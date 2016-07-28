package mybnb.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Manages SQL connections.
 */
public class SQLManager {

  // Logger for this class
  private static final Logger LOG = Logger.getLogger(SQLManager.class.getName());

  static {
    // See if the MySQL driver works
    try {
      Class.forName(SQLConstants.SQL_CLASS);
    } catch (ClassNotFoundException e) {
      LOG.log(Level.SEVERE, "SQL Driver not found", e);
    }
  }

  // Stores all connections.
  private Queue<Connection> allConnections = new ConcurrentLinkedQueue<>();

  // Connection manager to localize.
  private final ThreadLocal<Connection> connections = new ThreadLocal<Connection>() {

    @Override
    protected Connection initialValue() {
      Connection con = null;
      try {
        con = DriverManager.getConnection(SQLConstants.sqlConnection(),
                SQLConstants.SQL_USER, SQLConstants.SQL_PASS);

      } catch (SQLException e) {
        LOG.log(Level.SEVERE, "SQL driver failed", e);
      }
      return con;
    }
  };

  /**
   * Gets a new Connection local to this thread.
   *
   * @return a new Connection.
   * @throws SQLException if the connection failed
   */
  public Connection get() throws SQLException {
    Connection ret = connections.get();
    boolean alive = false;
    try {
      alive = isActive(ret);
    } catch (SQLException e) {
      LOG.log(Level.WARNING, "SQL connection failed", e);
    }
    // Refresh if not alive
    if (!alive) {
      if (ret != null) {
        allConnections.remove(ret);
      }
      connections.remove();
      allConnections.add(ret = connections.get());
    }
    return ret;
  }

  /**
   * Closes all connections in this SQLManager.
   */
  public void close() {
    allConnections.forEach(c -> {
      try {
        if (isActive(c)) {
          c.close();
        }
      } catch (SQLException e) {
        LOG.log(Level.WARNING, "SQL connection failed", e);
      }
    });
    connections.remove();
  }

  /**
   * Determines if a connection is alive or not.
   *
   * @param c the connection to check
   * @return a boolean, true if it is alive, false if not
   * @throws SQLException if an error occurred
   */
  private boolean isActive(Connection c) throws SQLException {
    return c != null && !c.isClosed() && c.getMetaData() != null;
  }
}
