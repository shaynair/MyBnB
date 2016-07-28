package mybnb.struct;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Struct for an updatable object.
 */
public interface Updatable extends Insertable {

  /**
   * Inserts this into the database.
   *
   * @param con
   * @throws SQLException
   */
  public void update(Connection con) throws SQLException;
}
