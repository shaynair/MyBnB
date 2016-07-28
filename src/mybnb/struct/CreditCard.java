package mybnb.struct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import mybnb.data.DateConstants;

/**
 * Stores an instance of a credit card.
 */
public class CreditCard implements Updatable {

  private long number;
  private int renter;
  private Date expiry;
  private String type;

  /**
   * Constructor for credit card.
   *
   * @param number
   * @param renter
   * @param type
   * @param expiry
   */
  public CreditCard(long number, int renter, String type, Date expiry) {
    this.number = number;
    this.renter = renter;
    this.expiry = expiry;
    this.type = type;
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
   * Get the value of expiry
   *
   * @return the value of expiry
   */
  public Date getExpiry() {
    return expiry;
  }

  /**
   * Set the value of expiry
   *
   * @param expiry new value of expiry
   */
  public void setExpiry(Date expiry) {
    this.expiry = expiry;
  }

  /**
   * Get the value of number
   *
   * @return the value of number
   */
  public long getNumber() {
    return number;
  }

  /**
   * Set the value of number
   *
   * @param number new value of number
   */
  public void setNumber(long number) {
    this.number = number;
  }

  /**
   * Gets renter.
   *
   * @return renter
   */
  public int getRenter() {
    return renter;
  }

  /**
   * Sets renter.
   *
   * @param renter
   */
  public void setRenter(int renter) {
    this.renter = renter;
  }

  @Override
  public void insert(Connection con) throws SQLException {
    try (PreparedStatement ps = con.prepareStatement("INSERT INTO renter_payments"
            + "(card_number, renterID, card_type, expiry_date)"
            + " VALUES (?, ?, ?, ?)")) {
      ps.setLong(1, getNumber());
      ps.setInt(2, getRenter());
      ps.setString(3, getType());
      ps.setDate(4, new java.sql.Date(getExpiry().getTime()));
      ps.executeUpdate();
    }
  }

  @Override
  public void update(Connection con) throws SQLException {
    try (PreparedStatement ps = con.prepareStatement("UPDATE renter_payments"
            + " SET card_type = ?, expiry_date = ?"
            + " WHERE card_number = ?")) {
      ps.setLong(3, getNumber());
      ps.setString(1, getType());
      ps.setDate(2, new java.sql.Date(getExpiry().getTime()));
      ps.executeUpdate();
    }
  }

  @Override
  public String toString() {
    return getType() + " - " + getNumber() + ": Expires "
            + DateConstants.serializeDate(getExpiry());
  }

}
