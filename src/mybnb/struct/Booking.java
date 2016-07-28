package mybnb.struct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import mybnb.data.DateConstants;
import mybnb.data.SQLConstants;

/**
 * Represents a booking.
 */
public class Booking implements Updatable {

  private int id;
  private BasicUser renter;
  private Date starts;
  private Date ends;
  private String status;
  private byte guests;
  private CreditCard card;
  private Availability availability;
  private double totalPrice;

  /**
   * Creates a new booking.
   *
   * @param id
   * @param availability
   * @param renter
   * @param starts
   * @param ends
   * @param status
   * @param guests
   * @param card
   * @param totalPrice
   */
  public Booking(int id, Availability availability, BasicUser renter, Date starts, Date ends,
          String status, byte guests, CreditCard card, double totalPrice) {
    this.id = id;
    this.availability = availability;
    this.renter = renter;
    this.starts = starts;
    this.ends = ends;
    this.totalPrice = totalPrice;
    this.status = status;
    this.guests = guests;
    this.card = card;
  }

  /**
   * Get the value of totalPrice
   *
   * @return the value of totalPrice
   */
  public double getTotalPrice() {
    return totalPrice;
  }

  /**
   * Set the value of totalPrice
   *
   * @param totalPrice new value of totalPrice
   */
  public void setTotalPrice(double totalPrice) {
    this.totalPrice = totalPrice;
  }

  /**
   * Get the value of availability
   *
   * @return the value of availability
   */
  public Availability getAvailability() {
    return availability;
  }

  /**
   * Set the value of availability
   *
   * @param availability new value of availability
   */
  public void setAvailability(Availability availability) {
    this.availability = availability;
  }

  /**
   * Get the value of card
   *
   * @return the value of card
   */
  public CreditCard getCard() {
    return card;
  }

  /**
   * Set the value of card
   *
   * @param card new value of card
   */
  public void setCard(CreditCard card) {
    this.card = card;
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
   * Get the value of status
   *
   * @return the value of status
   */
  public String getStatus() {
    return status;
  }

  /**
   * Set the value of status
   *
   * @param status new value of status
   */
  public void setStatus(String status) {
    this.status = status;
  }

  /**
   * Get the value of ends
   *
   * @return the value of ends
   */
  public Date getEnds() {
    return ends;
  }

  /**
   * Set the value of ends
   *
   * @param ends new value of ends
   */
  public void setEnds(Date ends) {
    this.ends = ends;
  }

  /**
   * Get the value of starts
   *
   * @return the value of starts
   */
  public Date getStarts() {
    return starts;
  }

  /**
   * Set the value of starts
   *
   * @param starts new value of starts
   */
  public void setStarts(Date starts) {
    this.starts = starts;
  }

  /**
   * Get the value of renter
   *
   * @return the value of renter
   */
  public BasicUser getRenter() {
    return renter;
  }

  /**
   * Set the value of renter
   *
   * @param renter new value of renter
   */
  public void setRenter(BasicUser renter) {
    this.renter = renter;
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
    try (PreparedStatement ps = con.prepareStatement("INSERT INTO bookings"
            + "(availabilityID, renterID, starts, ends, status, num_guests,"
            + " card_number)"
            + " VALUES (?, ?, ?, ?, ?, ?, ?)",
            SQLConstants.RETURN_GENERATED_KEYS)) {
      ps.setInt(1, availability.getId());
      ps.setInt(2, renter.getSIN());
      ps.setDate(3, new java.sql.Date(starts.getTime()));
      ps.setDate(4, new java.sql.Date(ends.getTime()));
      ps.setString(5, getStatus());
      ps.setByte(6, guests);
      ps.setLong(7, card.getNumber());
      ps.executeUpdate();

      try (ResultSet rs = ps.getGeneratedKeys()) {
        if (!rs.next()) {
          throw new SQLException("No generated keys");
        }
        setId(rs.getInt(1));
      }
    }
  }

  @Override
  public void update(Connection con) throws SQLException {
    try (PreparedStatement ps = con.prepareStatement("UPDATE bookings SET "
            + "starts = ?, ends = ?, status = ?, num_guests = ? "
            + "WHERE bookingID = ?")) {
      ps.setDate(1, new java.sql.Date(starts.getTime()));
      ps.setDate(2, new java.sql.Date(ends.getTime()));
      ps.setString(3, getStatus());
      ps.setByte(4, guests);
      ps.setInt(5, getId());
      ps.executeUpdate();
    }
  }

  @Override
  public String toString() {
    return status + " from " + DateConstants.serializeDate(starts)
            + " to " + DateConstants.serializeDate(ends) + " by " + guests + " guests";
  }
}
