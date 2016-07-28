package mybnb.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import mybnb.data.SQLEnumTypes;
import mybnb.data.SQLManager;
import mybnb.gui.LoginFrame;
import mybnb.gui.ReportsFrame;
import mybnb.gui.SearchFrame;
import mybnb.struct.Address;
import mybnb.struct.Availability;
import mybnb.struct.BasicUser;
import mybnb.struct.Booking;
import mybnb.struct.Comment;
import mybnb.struct.CreditCard;
import mybnb.struct.Listing;
import mybnb.struct.Rating;
import mybnb.struct.User;

/**
 * The main instance that holds the data for this application.
 */
public class Client {

  // Logger for this class
  private static final Logger LOG = Logger.getLogger(Client.class.getName());
  // Database connection
  private SQLManager sql = new SQLManager();
  // Types
  private SQLEnumTypes et = new SQLEnumTypes();
  // Current user
  private User user = null;
  private Listing list = null;
  /// GUI
  private LoginFrame login = new LoginFrame();
  private ReportsFrame reports = new ReportsFrame();
  private SearchFrame search = new SearchFrame();
  // Singleton
  private static Client c = new Client();

  // Hide constructor
  private Client() {
  }

  public LoginFrame getLogin() {
    return login;
  }

  public User getCurrentUser() {
    return user;
  }

  public Listing getCurrentListing() {
    return list;
  }

  public ReportsFrame getReports() {
    return reports;
  }

  public SearchFrame getSearch() {
    return search;
  }

  /**
   * Initializes this client.
   *
   * @throws SQLException if an SQL-initialization error occurred
   */
  public void initialize() throws SQLException {
    sql.get();
    et.initialize();
    setCurrentUser(null);
  }

  /**
   * Gets the singleton instance.
   *
   * @return the singleton instance
   */
  public static Client get() {
    return c;
  }

  /**
   * Gets the SQL Connector from the singleton instance.
   *
   * @return the SQL connector
   */
  public static SQLManager getConnector() {
    return c.sql;
  }

  /**
   * Gets the enum types from the instance.
   *
   * @return the enum types holder
   */
  public static SQLEnumTypes getTypes() {
    return c.et;
  }

  /**
   * Sets current user.
   *
   * @param u
   */
  public void setCurrentUser(User u) {
    this.user = u;
    if (u != null) {
      login.setVisible(false);
    }
  }

  /**
   * Sets current listing.
   *
   * @param l
   */
  public void setCurrentListing(Listing l) {
    this.list = l;
    if (l != null) {
      search.setVisible(false);
    }
  }

  /**
   * Creates and retrieves a user.
   *
   * @param id
   * @param email
   * @param login
   * @return the user
   */
  public User toUser(int id, String email, boolean login) {
    User ret = null;
    try {
      Connection con = sql.get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM user_information "
              + "WHERE " + (id > 0 ? "sin_id" : "email") + " = ?")) {
        if (id > 0) {
          ps.setInt(1, id);
        } else {
          ps.setString(1, email);
        }
        try (ResultSet rs = ps.executeQuery()) {
          if (rs.next()) {
            ret = toUser(con, rs);
          }
        }
      }
      if (ret == null) {
        return null;
      }

      if (login) {
        try (PreparedStatement ps = con.prepareStatement("UPDATE users "
                + "SET login_on = ? WHERE sin_id = ?")) {
          ps.setDate(1, toCurrentTime());
          ps.setInt(2, ret.getSIN());
          ps.executeUpdate();
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't login", ex);
    }
    return ret;
  }

  private User toUser(Connection con, ResultSet rs) throws SQLException {
    User ret = new User(toBasicUser(rs), toAddress(rs));
    int id = ret.getSIN();

    try (PreparedStatement ps = con.prepareStatement("SELECT * FROM renter_payments "
            + "WHERE renterID = ?")) {
      ps.setInt(1, id);
      try (ResultSet rse = ps.executeQuery()) {
        while (rse.next()) {
          ret.getCards().add(toCard(rse));
        }
      }
    }
    try (PreparedStatement ps = con.prepareStatement("SELECT * FROM profile_ratings "
            + "WHERE userID = ? ORDER BY rated_on DESC")) {
      ps.setInt(1, id);
      try (ResultSet rse = ps.executeQuery()) {
        while (rse.next()) {
          ret.getRatings().add(toRating("userID", rse));
        }
      }
    }
    try (PreparedStatement ps = con.prepareStatement("SELECT * FROM profile_comments "
            + "WHERE userID = ? ORDER BY commented_on DESC")) {
      ps.setInt(1, id);
      try (ResultSet rse = ps.executeQuery()) {
        while (rse.next()) {
          ret.getComments().add(toComment("userID", rse));
        }
      }
    }
    try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
            + "booking_information WHERE renterID = ?  AND status = 'Available' "
            + "ORDER BY booking_time DESC")) {
      ps.setInt(1, id);
      try (ResultSet rse = ps.executeQuery()) {
        while (rse.next()) {
          ret.getBookings().add(toBooking(con, rse, null, null));
        }
      }
    }
    try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
            + "listing_information WHERE hostID = ? AND is_available = TRUE "
            + "ORDER BY created_on DESC")) {
      ps.setInt(1, id);
      try (ResultSet rse = ps.executeQuery()) {
        while (rse.next()) {
          ret.getListings().add(toListing(con, rse, ret));
        }
      }
    }
    return ret;
  }

  private Listing toListing(Connection con, ResultSet rs, User parent) throws SQLException {
    User u = parent;
    if (u == null) {
      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM user_information "
              + "WHERE sin_id = ?")) {
        ps.setInt(1, rs.getInt("hostID"));
        try (ResultSet rse = ps.executeQuery()) {
          if (rse.next()) {
            u = toUser(con, rse);
          }
        }
      }
      if (u == null) {
        throw new SQLException("User not found: " + rs.getInt("hostID"));
      }
    }
    Listing ret = new Listing(rs.getInt("listingID"), u,
            rs.getString("list_type"), toAddress(rs), rs.getString("title"),
            rs.getString("description"), rs.getByte("num_bathrooms"),
            rs.getByte("num_beds"), rs.getByte("num_bedrooms"),
            rs.getByte("max_guests"), rs.getBoolean("is_available"),
            rs.getDouble("average_listing_rating"), rs.getDouble("average_price"));

    int id = ret.getId();
    try (PreparedStatement ps = con.prepareStatement("SELECT amenity FROM amenities "
            + "WHERE listingID = ?")) {
      ps.setInt(1, id);
      try (ResultSet rse = ps.executeQuery()) {
        while (rse.next()) {
          ret.getAmenities().add(rse.getString("amenity"));
        }
      }
    }
    try (PreparedStatement ps = con.prepareStatement("SELECT * FROM listing_ratings "
            + "WHERE listingID = ? ORDER BY rated_on DESC")) {
      ps.setInt(1, id);
      try (ResultSet rse = ps.executeQuery()) {
        while (rse.next()) {
          ret.getRatings().add(toRating("listingID", rse));
        }
      }
    }
    try (PreparedStatement ps = con.prepareStatement("SELECT * FROM listing_comments "
            + "WHERE listingID = ? ORDER BY commented_on DESC")) {
      ps.setInt(1, id);
      try (ResultSet rse = ps.executeQuery()) {
        while (rse.next()) {
          ret.getComments().add(toComment("listingID", rse));
        }
      }
    }
    try (PreparedStatement ps = con.prepareStatement("SELECT * FROM availability "
            + "WHERE listingID = ?")) {
      ps.setInt(1, id);
      try (ResultSet rse = ps.executeQuery()) {
        while (rse.next()) {
          Availability a = toAvailability(con, rse, ret, u);
          try (PreparedStatement pse = con.prepareStatement("SELECT * FROM booking_information "
                  + "WHERE listingID = ? AND availabilityID = ? AND status = 'Available'")) {
            pse.setInt(1, id);
            pse.setInt(2, a.getId());
            try (ResultSet rsd = pse.executeQuery()) {
              while (rsd.next()) {
                a.getBookings().add(toBooking(con, rsd, a, u));
              }
            }
          }
          ret.getAvailabilities().add(a);
        }
      }
    }
    return ret;
  }

  private Address toAddress(ResultSet rs) throws SQLException {
    return new Address(rs.getDouble("latitude"), rs.getDouble("longitude"),
            rs.getString("country"), rs.getString("province"), rs.getString("city"),
            rs.getString("street_address"), rs.getString("postal_code"));
  }

  private Comment toComment(String target, ResultSet rs) throws SQLException {
    return new Comment(rs.getInt(target), rs.getInt("commenterID"), rs.getString("content"),
            target.equals("listingID"));
  }

  private Rating toRating(String target, ResultSet rs) throws SQLException {
    return new Rating(rs.getInt(target), rs.getInt("raterID"), rs.getByte("rating"),
            target.equals("listingID"));
  }

  private CreditCard toCard(ResultSet rs) throws SQLException {
    return new CreditCard(rs.getLong("card_number"), rs.getInt("renterID"),
            rs.getString("card_type"), rs.getDate("expiry_date"));
  }

  private Availability toAvailability(Connection con, ResultSet rs, Listing l, User parent) throws SQLException {
    return new Availability(rs.getInt("availabilityID"), l == null ? toListing(con, rs, parent) : l,
            rs.getDate("starts_on"), rs.getDate("ends_on"),
            rs.getString("rent_type"), rs.getDouble("daily_price"),
            rs.getByte("guests"), rs.getBoolean("is_available"));
  }

  private Booking toBooking(Connection con, ResultSet rs, Availability a, User parent) throws SQLException {
    return new Booking(rs.getInt("bookingID"), a == null ? toAvailability(con, rs, null, parent) : a,
            toBasicUser(rs), rs.getDate("starts"), rs.getDate("ends"),
            rs.getString("status"), rs.getByte("num_guests"), toCard(rs),
            rs.getDouble("total_price"));
  }

  private BasicUser toBasicUser(ResultSet rs) throws SQLException {
    return new BasicUser(rs.getInt("sin_id"), rs.getString("first_name"),
            rs.getString("last_name"), rs.getString("email"),
            rs.getString("occupation"), rs.getDate("birth_date"),
            rs.getDouble("average_user_rating"));
  }

  private java.sql.Date toCurrentTime() {
    return new java.sql.Date(Calendar.getInstance().getTime().getTime());
  }

  /**
   * Gets an address.
   *
   * @param country
   * @param province
   * @param city
   * @param address
   * @param postalCode
   * @return the address in the database
   */
  public Address findAddress(String country, String province, String city,
          String address, String postalCode) {
    Address ret = null;
    try {
      Connection con = sql.get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM address "
              + "WHERE country = ? AND province = ? AND city = ? AND "
              + "(street_address = ? OR postal_code = ?)")) {
        ps.setString(1, country);
        ps.setString(2, province);
        ps.setString(3, city);
        ps.setString(4, address);
        ps.setString(5, postalCode);
        try (ResultSet rs = ps.executeQuery()) {
          if (rs.next()) {
            ret = toAddress(rs);
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get", ex);
    }
    return ret;
  }

  /**
   * Gets an address.
   *
   * @param latitude
   * @param longitude
   * @return the address in the database
   */
  public Address findAddress(double latitude, double longitude) {
    Address ret = null;
    try {
      Connection con = sql.get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM address "
              + "WHERE latitude = ? AND longitude = ? ")) {
        ps.setDouble(1, latitude);
        ps.setDouble(2, longitude);
        try (ResultSet rs = ps.executeQuery()) {
          if (rs.next()) {
            ret = toAddress(rs);
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get", ex);
    }
    return ret;
  }

  /**
   * Gets a listing
   *
   * @param id
   * @return the listing in the database
   */
  public Listing getListing(int id) {
    Listing ret = null;
    try {
      Connection con = sql.get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM listing_information "
              + "WHERE listingID = ? AND is_available = TRUE")) {
        ps.setInt(1, id);
        try (ResultSet rs = ps.executeQuery()) {
          if (rs.next()) {
            ret = toListing(con, rs, null);
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get", ex);
    }
    return ret;
  }

  public CreditCard getCard(long id) {
    CreditCard ret = null;
    try {
      Connection con = sql.get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM renter_payments "
              + "WHERE card_number = ?")) {
        ps.setLong(1, id);
        try (ResultSet rs = ps.executeQuery()) {
          if (rs.next()) {
            ret = toCard(rs);
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get", ex);
    }
    return ret;
  }

  /**
   * Gets an address.
   *
   * @param postalCode
   * @return the address in the database
   */
  public List<Address> findAddressByCode(String postalCode) {
    List<Address> ret = new ArrayList<>();
    if (postalCode.length() < 3) {
      return ret;
    }
    try {
      Connection con = sql.get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM address "
              + "WHERE postal_code LIKE ?")) {
        ps.setString(1, postalCode.substring(0, 3) + "%");
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            ret.add(toAddress(rs));
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get", ex);
    }
    return ret;
  }

  /**
   * Gets an address.
   *
   * @param address
   * @return the address in the database
   */
  public List<Address> findAddressByStreet(String address) {
    List<Address> search = new ArrayList<>();
    try {
      Connection con = sql.get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM address "
              + "WHERE street_address = ?")) {
        ps.setString(1, address);
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            search.add(toAddress(rs));
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get", ex);
    }
    return search;
  }

  public List<Address> findAddressByVicinity(double lat, double lon, double vicinity) {
    List<Address> search = new ArrayList<>();
    try {
      Connection con = sql.get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM address")) {
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            Address a = toAddress(rs);
            if (a.calcDistance(lat, lon) <= vicinity) {
              search.add(a);
            }
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get", ex);
    }
    return search;
  }

  public List<Listing> searchListings(List<Address> search, int host) {
    List<Listing> ret = new ArrayList<>();
    try {
      Connection con = sql.get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
              + "listing_information WHERE latitude = ? AND longitude = ?"
              + " AND hostID != ?")) {
        ps.setInt(3, host);
        for (Address s : search) {
          ps.setDouble(1, s.getLatitude());
          ps.setDouble(2, s.getLongitude());
          try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
              ret.add(toListing(con, rs, null));
            }
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get", ex);
    }
    return ret;
  }

  public void filterListings(List<Listing> input, Date begin,
          Date end, boolean descPrice, Set<String> amenities,
          double priceLow, double priceHigh, int beds, int bedrooms,
          int bathrooms, int guests) {

    input.removeIf(listing -> {
      return listing.getAveragePrice() < priceLow
              || listing.getAveragePrice() > priceHigh
              || (begin != null && end != null
              && listing.getAvailability(begin, end) == null)
              || !listing.hasAllAmenities(amenities)
              || (beds > 0 && listing.getBeds() < beds)
              || (bedrooms > 0 && listing.getBedrooms() < bedrooms)
              || (bathrooms > 0 && listing.getBathrooms() < bathrooms)
              || (guests > 0 && listing.getGuests() < guests);
    });

    input.sort((a, b) -> ((descPrice ? -1 : 1)
            * Double.compare(a.getAveragePrice(), b.getAveragePrice())));
  }

  public double suggestPrice(Listing l) {
    List<Double> ret = new ArrayList<>();
    try {
      Connection con = sql.get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
              + "price_per_essential_in_location WHERE country = ? AND"
              + " province = ? AND city = ?")) {
        ps.setString(1, l.getAddress().getCountry());
        ps.setString(2, l.getAddress().getProvince());
        ps.setString(3, l.getAddress().getCity());
        try (ResultSet rs = ps.executeQuery()) {
          if (rs.next()) {
            ret.add(rs.getDouble("bed_price") * l.getBeds());
            ret.add(rs.getDouble("bedroom_price") * l.getBedrooms());
            ret.add(rs.getDouble("bathroom_price") * l.getBathrooms());
            ret.add(rs.getDouble("amenity_price") * l.getAmenities().size());
            ret.add(rs.getDouble("guest_price") * l.getGuests());
          }
        }
      }
      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
              + "price_per_amenity_in_location WHERE country = ? AND"
              + " province = ? AND city = ?")) {
        ps.setString(1, l.getAddress().getCountry());
        ps.setString(2, l.getAddress().getProvince());
        ps.setString(3, l.getAddress().getCity());
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            if (l.getAmenities().contains(rs.getString("amenity"))) {
              ret.add(rs.getDouble("average_price"));
            }
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get", ex);
    }
    return ret.isEmpty() ? 0 : ret.stream().mapToDouble(a -> a).average().getAsDouble();
  }
}
