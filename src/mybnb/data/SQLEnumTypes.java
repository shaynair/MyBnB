package mybnb.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import mybnb.main.Client;

/**
 * Parses enum types and stores them.
 */
public class SQLEnumTypes {

  // Logger for this class
  private static final Logger LOG = Logger.getLogger(SQLManager.class.getName());
  // stores types
  private final Map<String, List<String>> types = new HashMap<>();

  /**
   * Initializes enum types.
   *
   * @throws SQLException if an SQL-related error occurred
   */
  public void initialize() throws SQLException {
    Connection con = Client.getConnector().get();
    
    for (Entry<String, Collection<String>> enumTable
            : SQLConstants.ENUM_TABLES.entrySet()) {

      try (PreparedStatement ps = con.prepareStatement(
              "SHOW COLUMNS FROM " + enumTable.getKey() + " LIKE ?")) {
        for (String s : enumTable.getValue()) {
          if (types.containsKey(s)) {
            LOG.log(Level.WARNING, "Already contains type {0}", s);
            continue;
          }
          ps.setString(1, s);
          try (ResultSet rs = ps.executeQuery()) {
            if (!rs.next()) {
              LOG.log(Level.WARNING, "Does not contain type {0}", s);
              continue;
            }

            String enumType = rs.getString("Type");
            if (enumType.length() <= 6 || !enumType.startsWith("enum(")) {
              LOG.log(Level.WARNING, "Does not contain type {0}, {1}",
                      new String[]{s, enumType});
              continue;
            }
            // Filter out the enum( )
            enumType = enumType.substring(5, enumType.length() - 1);
            List<String> list = new ArrayList<>();
            for (String add : enumType.split(",")) {
              // Filter out the ''
              list.add(add.substring(1, add.length() - 1));
            }
            types.put(s, list);
          }
        }
      }
    }
  }

  /**
   * Gets an enum type.
   *
   * @param t the enum name
   * @return the enum list
   */
  public List<String> getEnum(String t) {
    return types.get(t);
  }
}
