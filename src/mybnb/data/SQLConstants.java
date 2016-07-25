package mybnb.data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Stores constants related to the program.
 */
public class SQLConstants {

  /**
   * SQL information for the connection.
   */
  public static final String SQL_USER = "root";
  public static final String SQL_PASS = "password";
  public static final short SQL_PORT = 3307;
  public static final String SQL_ADDR = "127.0.0.1";
  public static final String SQL_SCHEMA = "mybnb";
  public static final String SQL_CLASS = "com.mysql.jdbc.Driver";
  
  /**
   * The enum types to parse.
   */
  public static final Map<String, Collection<String>> ENUM_TABLES = new HashMap<>();
  
  static {
    // <table name> -> <column names>
    ENUM_TABLES.put("renter_payments", Collections.singleton("card_type"));
    ENUM_TABLES.put("listings", Collections.singleton("list_type"));
    ENUM_TABLES.put("amenities", Collections.singleton("amenity"));
    ENUM_TABLES.put("availability", Arrays.asList("rent_type"));
    ENUM_TABLES.put("bookings", Collections.singleton("status"));
  }

  /**
   * Gets the full SQL connection string.
   *
   * @return String for JDBC.
   */
  public static final String sqlConnection() {
    return "jdbc:mysql://" + SQL_ADDR + ":" + SQL_PORT
            + "/" + SQL_SCHEMA + "?autoReconnect=true&maxReconnects=10";
  }

  /**
   * The constant indicating that generated keys should be made available for
   * retrieval.
   */
  public static final int RETURN_GENERATED_KEYS = 1;
}
