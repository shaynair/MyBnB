package mybnb.struct;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Represents a deletable object.
 */
public interface Deletable extends Updatable {

  /**
   * Deletes this from the database.
   *
   * @param con
   * @throws SQLException
   */
  public void delete(Connection con) throws SQLException;
}
