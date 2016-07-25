package mybnb.struct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

/**
 * A user struct.
 */
public class BasicUser {
  protected String firstName;
  protected String lastName;
  protected String email;
  protected String occupation;
  
  protected int sin;
  protected Date birthdate;
  protected double avgRating;
  
  /**
   * Constructor for user.
   *
   * @param sin
   * @param firstName
   * @param lastName
   * @param email
   * @param occupation
   * @param birthdate
   * @param avgRating
   */
  public BasicUser(int sin, String firstName, String lastName, String email,
          String occupation, Date birthdate, double avgRating) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.occupation = occupation;
    this.sin = sin;
    this.birthdate = birthdate;
    this.avgRating = avgRating;
  }
  
  /**
   * Get the value of birthdate
   *
   * @return the value of birthdate
   */
  public Date getBirthdate() {
    return birthdate;
  }

  /**
   * Set the value of birthdate
   *
   * @param birthdate new value of birthdate
   */
  public void setBirthdate(Date birthdate) {
    this.birthdate = birthdate;
  }

  /**
   * Get the value of SIN
   *
   * @return the value of SIN
   */
  public int getSIN() {
    return sin;
  }

  /**
   * Set the value of SIN
   *
   * @param sin new value of SIN
   */
  public void setSIN(int sin) {
    this.sin = sin;
  }
  
  /**
   * Get the value of occupation
   *
   * @return the value of occupation
   */
  public String getOccupation() {
    return occupation;
  }

  /**
   * Set the value of occupation
   *
   * @param occupation new value of occupation
   */
  public void setOccupation(String occupation) {
    this.occupation = occupation;
  }

  /**
   * Get the value of email
   *
   * @return the value of email
   */
  public String getEmail() {
    return email;
  }

  /**
   * Set the value of email
   *
   * @param email new value of email
   */
  public void setEmail(String email) {
    this.email = email;
  }

  /**
   * Get the value of lastName
   *
   * @return the value of lastName
   */
  public String getLastName() {
    return lastName;
  }

  /**
   * Set the value of lastName
   *
   * @param lastName new value of lastName
   */
  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  /**
   * Get the value of firstName
   *
   * @return the value of firstName
   */
  public String getFirstName() {
    return firstName;
  }

  /**
   * Set the value of firstName
   *
   * @param firstName new value of firstName
   */
  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  /**
   * Returns avg rating
   * @return avg rating
   */
  public double getAvgRating() {
    return avgRating;
  }

  /**
   * Sets avg rating
   * @param avgRating 
   */
  public void setAvgRating(double avgRating) {
    this.avgRating = avgRating;
  }
}
