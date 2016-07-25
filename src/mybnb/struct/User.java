package mybnb.struct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Stores a user instance.
 */
public class User extends BasicUser implements Deletable {

  private Address address;
  private final List<Comment> comments = new ArrayList<>();
  private final List<Rating> ratings = new ArrayList<>();
  private final List<Booking> bookings = new ArrayList<>();
  private final Set<CreditCard> cards = new HashSet<>();
  private final List<Listing> listings = new ArrayList<>();

  /**
   * Constructor for user.
   *
   * @param sin
   * @param firstName
   * @param lastName
   * @param email
   * @param occupation
   * @param address
   * @param birthdate
   * @param avgRating
   */
  public User(int sin, String firstName, String lastName, String email,
          String occupation, Address address, Date birthdate, double avgRating) {

    super(sin, firstName, lastName, email, occupation, birthdate, avgRating);
    this.address = address;
  }

  /**
   * Constructor using another user.
   *
   * @param bu
   * @param address
   */
  public User(BasicUser bu, Address address) {
    this(bu.sin, bu.firstName, bu.lastName, bu.email, bu.occupation, address,
            bu.birthdate, bu.avgRating);
  }

  /**
   * Get the value of cards
   *
   * @return the value of cards
   */
  public Set<CreditCard> getCards() {
    return cards;
  }

  /**
   * Get the value of listings
   *
   * @return the value of listings
   */
  public List<Listing> getListings() {
    return listings;
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

  @Override
  public void insert(Connection con) throws SQLException {
    try (PreparedStatement ps = con.prepareStatement("INSERT INTO users"
            + "(sin_id, first_name, last_name, email, latitude, longitude, "
            + "birth_date, occupation)"
            + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)")) {

      ps.setInt(1, sin);
      ps.setString(2, firstName);
      ps.setString(3, lastName);
      ps.setString(4, email);
      ps.setDouble(5, address.getLatitude());
      ps.setDouble(6, address.getLongitude());
      ps.setDate(7, new java.sql.Date(birthdate.getTime()));
      ps.setString(8, occupation);
      ps.executeUpdate();
    }
    for (CreditCard card : cards) {
      card.insert(con);
    }
    for (Rating r : ratings) {
      r.insert(con);
    }
    for (Comment r : comments) {
      r.insert(con);
    }
    for (Listing list : listings) {
      list.insert(con);
    }
    for (Booking book : bookings) {
      book.insert(con);
    }
  }
  
  @Override
  public void update(Connection con) throws SQLException {
    try (PreparedStatement ps = con.prepareStatement("UPDATE users"
            + " SET first_name = ?, last_name = ?, birth_date = ?, occupation = ?"
            + " WHERE sin_id = ?")) {

      ps.setInt(5, sin);
      ps.setString(1, firstName);
      ps.setString(2, lastName);
      ps.setDate(3, new java.sql.Date(birthdate.getTime()));
      ps.setString(4, occupation);
      ps.executeUpdate();
    }
    for (CreditCard card : cards) {
      card.update(con);
    }
    for (Listing list : listings) {
      list.update(con);
    }
    for (Booking book : bookings) {
      book.update(con);
    }
  }
  
    
  @Override
  public void delete(Connection con) throws SQLException {
    try (PreparedStatement ps = con.prepareStatement("DELETE FROM users"
            + " WHERE sin_id = ?")) {

      ps.setInt(1, sin);
      ps.executeUpdate();
    }
  }
}
