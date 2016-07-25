package mybnb.struct;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * An insertable MySQL object.
 */
public interface Insertable {
  
  /**
   * Inserts this into the database.
   * @param con
   * @throws SQLException 
   */
  public void insert(Connection con) throws SQLException;
}
