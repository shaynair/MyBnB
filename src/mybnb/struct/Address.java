package mybnb.struct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Stores an address.
 */
public class Address implements Insertable {

  private String country;
  private String city;
  private String province;
  private double latitude;
  private double longitude;
  private String street;
  private String postalCode;

  /**
   * Constructor for address.
   * @param latitude
   * @param longitude
   * @param country
   * @param province
   * @param city
   * @param street
   * @param postalCode 
   */
  public Address(double latitude, double longitude, String country, String province, 
          String city, String street, String postalCode) {
    this.country = country;
    this.city = city;
    this.province = province;
    this.latitude = latitude;
    this.longitude = longitude;
    this.street = street;
    this.postalCode = postalCode;
  }

  /**
   * Get the value of postalCode
   *
   * @return the value of postalCode
   */
  public String getPostalCode() {
    return postalCode;
  }

  /**
   * Set the value of postalCode
   *
   * @param postalCode new value of postalCode
   */
  public void setPostalCode(String postalCode) {
    this.postalCode = postalCode;
  }

  /**
   * Get the value of street
   *
   * @return the value of street
   */
  public String getStreet() {
    return street;
  }

  /**
   * Set the value of street
   *
   * @param street new value of street
   */
  public void setStreet(String street) {
    this.street = street;
  }

  /**
   * Get the value of longitude
   *
   * @return the value of longitude
   */
  public double getLongitude() {
    return longitude;
  }

  /**
   * Set the value of longitude
   *
   * @param longitude new value of longitude
   */
  public void setLongitude(double longitude) {
    this.longitude = longitude;
  }

  /**
   * Get the value of latitude
   *
   * @return the value of latitude
   */
  public double getLatitude() {
    return latitude;
  }

  /**
   * Set the value of latitude
   *
   * @param latitude new value of latitude
   */
  public void setLatitude(double latitude) {
    this.latitude = latitude;
  }

  /**
   * Get the value of province
   *
   * @return the value of province
   */
  public String getProvince() {
    return province;
  }

  /**
   * Set the value of province
   *
   * @param province new value of province
   */
  public void setProvince(String province) {
    this.province = province;
  }

  /**
   * Get the value of city
   *
   * @return the value of city
   */
  public String getCity() {
    return city;
  }

  /**
   * Set the value of city
   *
   * @param city new value of city
   */
  public void setCity(String city) {
    this.city = city;
  }

  /**
   * Get the value of country
   *
   * @return the value of country
   */
  public String getCountry() {
    return country;
  }

  /**
   * Set the value of country
   *
   * @param country new value of country
   */
  public void setCountry(String country) {
    this.country = country;
  }

  @Override
  public void insert(Connection con) throws SQLException {
    try (PreparedStatement ps = con.prepareStatement("INSERT INTO address"
            + "(latitude, longitude, country, province, city, street_address, postal_code)"
            + " VALUES (?, ?, ?, ?, ?, ?, ?)")) {
      
      ps.setDouble(1, latitude);
      ps.setDouble(2, longitude);
      ps.setString(3, country);
      ps.setString(4, province);
      ps.setString(5, city);
      ps.setString(6, street);
      ps.setString(7, postalCode);
      ps.executeUpdate();
    } 
  }
}
