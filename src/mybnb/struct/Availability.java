package mybnb.struct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import mybnb.data.SQLConstants;

/**
 * Represents an availability.
 */
public class Availability implements Updatable {
  
  private int id;
  private Listing listing;
  private Date start;
  private Date end;
  private String type;
  private double price;
  private byte guests;
  private boolean available;
  private final List<Booking> bookings = new ArrayList<>();

  /**
   * Generates a new availability.
   * @param id
   * @param listing
   * @param start
   * @param end
   * @param type
   * @param price
   * @param guests
   * @param available 
   */
  public Availability(int id, Listing listing, Date start, Date end, 
          String type, double price, byte guests, boolean available) {
    this.id = id;
    this.listing = listing;
    this.start = start;
    this.end = end;
    this.type = type;
    this.price = price;
    this.guests = guests;
    this.available = available;
  }

  /**
   * Gets listing
   * @return listing
   */
  public Listing getListing() {
    return listing;
  }

  /**
   * Sets listing
   * @param listing 
   */
  public void setListing(Listing listing) {
    this.listing = listing;
  }

  /**
   * Get the value of booking
   *
   * @return the value of booking
   */
  public List<Booking> getBookings() {
    return bookings;
  }

  /**
   * Get the value of available
   *
   * @return the value of available
   */
  public boolean isAvailable() {
    return available;
  }

  /**
   * Set the value of available
   *
   * @param available new value of available
   */
  public void setAvailable(boolean available) {
    this.available = available;
  }

  /**
   * Get the value of guests
   *
   * @return the value of guests
   */
  public byte getGuests() {
    return guests;
  }

  /**
   * Set the value of guests
   *
   * @param guests new value of guests
   */
  public void setGuests(byte guests) {
    this.guests = guests;
  }

  /**
   * Get the value of price
   *
   * @return the value of price
   */
  public double getPrice() {
    return price;
  }

  /**
   * Set the value of price
   *
   * @param price new value of price
   */
  public void setPrice(double price) {
    this.price = price;
  }

  /**
   * Get the value of type
   *
   * @return the value of type
   */
  public String getType() {
    return type;
  }

  /**
   * Set the value of type
   *
   * @param type new value of type
   */
  public void setType(String type) {
    this.type = type;
  }

  /**
   * Get the value of end
   *
   * @return the value of end
   */
  public Date getEnd() {
    return end;
  }

  /**
   * Set the value of end
   *
   * @param end new value of end
   */
  public void setEnd(Date end) {
    this.end = end;
  }

  /**
   * Get the value of start
   *
   * @return the value of start
   */
  public Date getStart() {
    return start;
  }

  /**
   * Set the value of start
   *
   * @param start new value of start
   */
  public void setStart(Date start) {
    this.start = start;
  }

  /**
   * Get the value of id
   *
   * @return the value of id
   */
  public int getId() {
    return id;
  }

  /**
   * Set the value of id
   *
   * @param id new value of id
   */
  public void setId(int id) {
    this.id = id;
  }

  @Override
  public void insert(Connection con) throws SQLException {
    try (PreparedStatement ps = con.prepareStatement("INSERT INTO availability"
            + "(listingID, starts_on, ends_on, rent_type, daily_price, guests,"
            + " is_available)"
            + " VALUES (?, ?, ?, ?, ?, ?, ?)", 
            SQLConstants.RETURN_GENERATED_KEYS)) {
      ps.setInt(1, listing.getId());
      ps.setDate(2, new java.sql.Date(start.getTime()));
      ps.setDate(3, new java.sql.Date(end.getTime()));
      ps.setString(4, getType());
      ps.setDouble(5, getPrice());
      ps.setByte(6, guests);
      ps.setBoolean(7, available);
      ps.executeUpdate();
      
      try (ResultSet rs = ps.getGeneratedKeys()) {
        if (!rs.next()) {
          throw new SQLException("No generated keys");
        }
        setId(rs.getInt(1));
      }
    }
    for (Booking b : bookings) {
      b.insert(con);
    }
  }
  
  @Override
  public void update(Connection con) throws SQLException {
    try (PreparedStatement ps = con.prepareStatement("UPDATE availability SET "
            + " starts_on = ?, ends_on = ?, rent_type = ?, daily_price = ?, "
            + "guests = ?, is_available = ? WHERE availabilityID = ?")) {
      ps.setDate(1, new java.sql.Date(start.getTime()));
      ps.setDate(2, new java.sql.Date(end.getTime()));
      ps.setString(3, getType());
      ps.setDouble(4, getPrice());
      ps.setByte(5, guests);
      ps.setBoolean(6, available);
      ps.setInt(7, getId());
      ps.executeUpdate();
    }
    for (Booking b : bookings) {
      b.update(con);
    }
  }
}