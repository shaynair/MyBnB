package mybnb.struct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Represents a comment.
 */
public class Comment implements Insertable {

  private int origin;
  private int target;
  private String content;
  private boolean forListing;

  /**
   * Creates a rating.
   *
   * @param target
   * @param origin
   * @param content
   * @param forListing
   */
  public Comment(int target, int origin, String content, boolean forListing) {
    this.origin = origin;
    this.content = content;
    this.target = target;
    this.forListing = forListing;
  }

  /**
   * Get the value of content
   *
   * @return the value of content
   */
  public String getContent() {
    return content;
  }

  /**
   * Set the value of content
   *
   * @param content new value of content
   */
  public void setContent(String content) {
    this.content = content;
  }

  /**
   * Get the value of origin
   *
   * @return the value of origin
   */
  public int getOrigin() {
    return origin;
  }

  /**
   * Set the value of origin
   *
   * @param origin new value of origin
   */
  public void setOrigin(int origin) {
    this.origin = origin;
  }

  /**
   * Gets target.
   *
   * @return target
   */
  public int getTarget() {
    return target;
  }

  /**
   * Sets target.
   *
   * @param target
   */
  public void setTarget(int target) {
    this.target = target;
  }

  /**
   * Gets if it is for listing.
   *
   * @return is for listing
   */
  public boolean isForListing() {
    return forListing;
  }

  /**
   * Sets for listing.
   *
   * @param forListing
   */
  public void setForListing(boolean forListing) {
    this.forListing = forListing;
  }

  @Override
  public void insert(Connection con) throws SQLException {
    String table = forListing ? "listing" : "profile";
    String column = forListing ? "listing" : "user";
    try (PreparedStatement ps = con.prepareStatement("INSERT INTO " + table + "_comments"
            + "(" + column + "ID, commenterID, content)"
            + " VALUES (?, ?, ?)")) {
      ps.setInt(1, target);
      ps.setInt(2, origin);
      ps.setString(3, content);
      ps.executeUpdate();
    }
  }
}
