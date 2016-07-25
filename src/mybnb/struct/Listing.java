package mybnb.struct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import mybnb.data.SQLConstants;

/**
 * Represents a listing.
 */
public class Listing implements Updatable {

  private int id;
  private BasicUser host;
  private String type;
  private Address address;
  private short unit;
  private String title;
  private String description;
  private byte bathrooms;
  private byte beds;
  private byte bedrooms;
  private byte guests;
  private boolean available;
  private double avgRating;
  private double avgPrice;
  private final Set<String> amenities = new HashSet<>();
  
  private final List<Comment> comments = new ArrayList<>();
  private final List<Rating> ratings = new ArrayList<>();
  private final List<Availability> availabilities = new ArrayList<>();
  /**
   * Constructs a listing.
   * @param id
   * @param host
   * @param type
   * @param address
   * @param title
   * @param description
   * @param bathrooms
   * @param beds
   * @param bedrooms
   * @param guests
   * @param available 
   * @param avgRating
   * @param avgPrice
   */
  public Listing(int id, BasicUser host, String type, Address address, String title, 
          String description, byte bathrooms, byte beds, byte bedrooms, byte guests, 
          boolean available, double avgRating, double avgPrice) {
    this.id = id;
    this.host = host;
    this.type = type;
    this.address = address;
    this.title = title;
    this.description = description;
    this.bathrooms = bathrooms;
    this.beds = beds;
    this.bedrooms = bedrooms;
    this.guests = guests;
    this.available = available;
    this.avgRating = avgRating;
    this.avgPrice = avgPrice;
  }

  /**
   * Gets availabilities.
   * @return availabilities
   */
  public List<Availability> getAvailabilities() {
    return availabilities;
  }
  
  
  /**
   * Get the value of ratings
   *
   * @return the value of ratings
   */
  public List<Rating> getRatings() {
    return ratings;
  }

  /**
   * Get the value of comments
   *
   * @return the value of comments
   */
  public List<Comment> getComments() {
    return comments;
  }
  
  /**
   * Gets amenities.
   * @return the amenities
   */
  public Set<String> getAmenities() {
    return amenities;
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
   * Get the value of bedrooms
   *
   * @return the value of bedrooms
   */
  public byte getBedrooms() {
    return bedrooms;
  }

  /**
   * Set the value of bedrooms
   *
   * @param bedrooms new value of bedrooms
   */
  public void setBedrooms(byte bedrooms) {
    this.bedrooms = bedrooms;
  }

  /**
   * Get the value of beds
   *
   * @return the value of beds
   */
  public byte getBeds() {
    return beds;
  }

  /**
   * Set the value of beds
   *
   * @param beds new value of beds
   */
  public void setBeds(byte beds) {
    this.beds = beds;
  }

  /**
   * Get the value of bathrooms
   *
   * @return the value of bathrooms
   */
  public byte getBathrooms() {
    return bathrooms;
  }

  /**
   * Set the value of bathrooms
   *
   * @param bathrooms new value of bathrooms
   */
  public void setBathrooms(byte bathrooms) {
    this.bathrooms = bathrooms;
  }

  /**
   * Get the value of description
   *
   * @return the value of description
   */
  public String getDescription() {
    return description;
  }

  /**
   * Set the value of description
   *
   * @param description new value of description
   */
  public void setDescription(String description) {
    this.description = description;
  }

  /**
   * Get the value of title
   *
   * @return the value of title
   */
  public String getTitle() {
    return title;
  }

  /**
   * Set the value of title
   *
   * @param title new value of title
   */
  public void setTitle(String title) {
    this.title = title;
  }

  /**
   * Get the value of unit
   *
   * @return the value of unit
   */
  public short getUnit() {
    return unit;
  }

  /**
   * Set the value of unit
   *
   * @param unit new value of unit
   */
  public void setUnit(short unit) {
    this.unit = unit;
  }

  /**
   * Get the value of address
   *
   * @return the value of address
   */
  public Address getAddress() {
    return address;
  }

  /**
   * Set the value of address
   *
   * @param address new value of address
   */
  public void setAddress(Address address) {
    this.address = address;
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
   * Get the value of host
   *
   * @return the value of host
   */
  public BasicUser getHost() {
    return host;
  }

  /**
   * Set the value of host
   *
   * @param host new value of host
   */
  public void setHost(BasicUser host) {
    this.host = host;
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

  /**
   * Get avg rating
   * @return avg rating
   */
  public double getAvgRating() {
    return avgRating;
  }

  /**
   * Set avg rating
   * @param avgRating 
   */
  public void setAvgRating(double avgRating) {
    this.avgRating = avgRating;
  }

  /**
   * Get avg Price
   * @return avg Price
   */
  public double getAvgPrice() {
    return avgPrice;
  }

  /**
   * Set avg Price
   * @param avgPrice
   */
  public void setAvgPrice(double avgPrice) {
    this.avgPrice = avgPrice;
  }
  
  /**
   * Get average price
   * @return average
   */
  public double getAveragePrice() {
    if (availabilities.isEmpty()) {
      return avgPrice;
    }
    return availabilities.stream().mapToDouble(a -> a.getPrice())
            .average().getAsDouble();
  }
  
  /**
   * Get average rating
   * @return average
   */
  public double getAverageRating() {
    if (ratings.isEmpty()) {
      return avgRating;
    }
    return ratings.stream().mapToDouble(a -> a.getContent())
            .average().getAsDouble();
  }
  
  public Availability getAvailability(Date begin, Date end) {
    for (Availability av : availabilities) {
      if ((av.getStart().after(begin) || av.getStart().equals(begin))
        && (av.getEnd().before(end) || av.getEnd().equals(end))
              && !av.isNotBooked()) {
        return av;
      }
    }
    return null;
  }
  
  public boolean intersects(Date begin, Date end) {
    for (Availability av : availabilities) {
      if ((av.getStart().before(end) || av.getStart().equals(end))
        && (av.getEnd().after(begin) || av.getEnd().equals(begin))) {
        return true;
      }
    }
    return false;
  }
  
  public boolean hasAllAmenities(Set<String> amen) {
    for (String s : amen) {
      if (!amenities.contains(s)) {
        return false;
      }
    }
    return true;
  }
  
  public boolean isEligibleRenter(int renter) {
    for (Availability av : availabilities) {
      for (Booking b : av.getBookings()) {
        if (b.getRenter().getSIN() == renter) {
          return true;
        }
      }
    }
    return false;
  }
  
  public boolean isEligibleCommenter(int renter) {
    for (Comment c : comments) {
      if (c.getOrigin() == renter) {
        return false;
      }
    }
    return false;
  }
  
  public boolean isEligibleRater(int renter) {
    for (Rating c : ratings) {
      if (c.getOrigin() == renter) {
        return false;
      }
    }
    return false;
  }
  
  @Override
  public void insert(Connection con) throws SQLException {
    try (PreparedStatement ps = con.prepareStatement("INSERT INTO listings"
            + "(hostID, list_type, latitude, longitude, unit_number, title,"
            + " description, num_bedrooms, num_beds, num_bathrooms, max_guests,"
            + " is_available)"
            + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
            SQLConstants.RETURN_GENERATED_KEYS)) {
      ps.setInt(1, host.getSIN());
      ps.setString(2, getType());
      ps.setDouble(3, address.getLatitude());
      ps.setDouble(4, address.getLongitude());
      ps.setInt(5, unit);
      ps.setString(6, title);
      ps.setString(7, description);
      ps.setByte(8, bedrooms);
      ps.setByte(9, beds);
      ps.setByte(10, bathrooms);
      ps.setByte(11, guests);
      ps.setBoolean(12, available);
      ps.executeUpdate();
      
      try (ResultSet rs = ps.getGeneratedKeys()) {
        if (!rs.next()) {
          throw new SQLException("No generated keys");
        }
        setId(rs.getInt(1));
      }
    }
    insertAmenities(con);
    for (Availability a : availabilities) {
      a.insert(con);
    }
    for (Rating r : ratings) {
      r.insert(con);
    }
    for (Comment r : comments) {
      r.insert(con);
    }
  }
  
  @Override
  public void update(Connection con) throws SQLException {
    try (PreparedStatement ps = con.prepareStatement("UPDATE listings SET "
            + " list_type = ?, unit_number = ?, title = ?,"
            + " description = ?, num_bedrooms = ?, num_beds = ?, num_bathrooms = ?, "
            + " max_guests = ?, is_available = ? WHERE listingID = ?")) {
      ps.setString(1, getType());
      ps.setInt(2, unit);
      ps.setString(3, title);
      ps.setString(4, description);
      ps.setByte(5, bedrooms);
      ps.setByte(6, beds);
      ps.setByte(7, bathrooms);
      ps.setByte(8, guests);
      ps.setBoolean(9, available);
      ps.setInt(10, getId());
      ps.executeUpdate();
    }
    try (PreparedStatement ps = con.prepareStatement("DELETE FROM amenities"
            + " WHERE listingID = ?")) {
      ps.setInt(1, getId());
      ps.executeUpdate();
    }
    insertAmenities(con);
    for (Availability a : availabilities) {
      a.update(con);
    }
  }
  
  private void insertAmenities(Connection con) throws SQLException {
    try (PreparedStatement ps = con.prepareStatement("INSERT INTO amenities"
            + "(listingID, amenity) VALUES (?, ?)")) {
      ps.setInt(1, getId());
      for (String s : amenities) {
        ps.setString(2, s);
        ps.executeUpdate();
      }
    }
  }

  @Override
  public String toString() {
    return "[" + title + "] Rating: " + getAverageRating() + "/5, Price: " + 
            getAveragePrice() + ", Type: " + type;
  }
  
}
