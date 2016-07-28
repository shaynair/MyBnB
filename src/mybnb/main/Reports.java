package mybnb.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractMap.SimpleEntry;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import mybnb.struct.Address;

/**
 * Gets reports.
 */
public class Reports {

  private static final Logger LOG = Logger.getLogger(Reports.class.getName());

  public static List<Entry<String, Integer>> rankCountries() {
    List<Entry<String, Integer>> ret = new ArrayList<>();
    try {
      Connection con = Client.getConnector().get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
              + " listings_per_country "
              + " ORDER BY num_listings DESC")) {
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            ret.add(new SimpleEntry<>(rs.getString("country"),
                    rs.getInt("num_listings")));
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get report", ex);
    }
    return ret;
  }

  public static List<Entry<String, Integer>> rankCities() {
    List<Entry<String, Integer>> ret = new ArrayList<>();
    try {
      Connection con = Client.getConnector().get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
              + " listings_per_city "
              + " ORDER BY num_listings DESC")) {
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            ret.add(new SimpleEntry<>(rs.getString("country") + ", "
                    + rs.getString("province") + ", " + rs.getString("city"),
                    rs.getInt("num_listings")));
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get report", ex);
    }
    return ret;
  }

  public static List<Entry<String, Integer>> rankPostalCodes() {
    List<Entry<String, Integer>> ret = new ArrayList<>();
    try {
      Connection con = Client.getConnector().get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
              + " listings_per_postal_code "
              + " ORDER BY num_listings DESC")) {
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            ret.add(new SimpleEntry<>(rs.getString("country") + ", "
                    + rs.getString("province") + ", " + rs.getString("city")
                    + ", " + rs.getString("postal_code"),
                    rs.getInt("num_listings")));
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get report", ex);
    }
    return ret;
  }

  public static List<Entry<Entry<Integer, String>, Integer>> rankHostsByCountry() {
    List<Entry<Entry<Integer, String>, Integer>> ret = new ArrayList<>();
    try {
      Connection con = Client.getConnector().get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
              + " listings_per_host_in_country "
              + " ORDER BY num_listings DESC")) {
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            ret.add(new SimpleEntry<>(new SimpleEntry<>(rs.getInt("hostID"),
                    rs.getString("country")), rs.getInt("num_listings")));
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get report", ex);
    }
    return ret;
  }

  public static List<Entry<Entry<Integer, String>, Integer>> rankHostsByCity() {
    List<Entry<Entry<Integer, String>, Integer>> ret = new ArrayList<>();
    try {
      Connection con = Client.getConnector().get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
              + " listings_per_host_in_city"
              + " ORDER BY num_listings DESC")) {
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            ret.add(new SimpleEntry<>(new SimpleEntry<>(rs.getInt("hostID"),
                    rs.getString("country") + ", " + rs.getString("province") + ", "
                    + rs.getString("city")), rs.getInt("num_listings")));
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get report", ex);
    }
    return ret;
  }

  public static List<Entry<Integer, Integer>> rankCancels(boolean host) {
    List<Entry<Integer, Integer>> ret = new ArrayList<>();
    try {
      Connection con = Client.getConnector().get();
      String s = host ? "host" : "renter";

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
              + " cancellations_per_" + s
              + " ORDER BY num_cancellations DESC")) {
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            ret.add(new SimpleEntry<>(rs.getInt(s + "ID"),
                    rs.getInt("num_cancellations")));
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get report", ex);
    }
    return ret;
  }

  public static Map<String, Double> marketShareByHost(int hostID) {
    Map<String, Double> ret = new HashMap<>();
    try {
      Connection con = Client.getConnector().get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
              + " host_market_share WHERE hostID = ? AND market_share >= 10"
              + " ORDER BY market_share DESC")) {
        ps.setInt(1, hostID);
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            ret.put(
                    rs.getString("country") + ", " + rs.getString("province") + ", "
                    + rs.getString("city"), rs.getDouble("market_share"));
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get report", ex);
    }
    return ret;
  }

  public static List<Entry<Entry<Integer, String>, Double>> marketShares() {
    List<Entry<Entry<Integer, String>, Double>> ret = new ArrayList<>();
    try {
      Connection con = Client.getConnector().get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
              + " host_market_share WHERE market_share >= 10"
              + " ORDER BY market_share DESC")) {
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            ret.add(new SimpleEntry<>(new SimpleEntry<>(rs.getInt("hostID"),
                    rs.getString("country") + ", " + rs.getString("province") + ", "
                    + rs.getString("city")), rs.getDouble("market_share")));
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get report", ex);
    }
    return ret;
  }

  public static List<Entry<Integer, Integer>> rankRenters(Date begin,
          Date end) {
    List<Entry<Integer, Integer>> ret = new ArrayList<>();
    try {
      Connection con = Client.getConnector().get();

      try (PreparedStatement ps = con.prepareStatement("SELECT b.*, COUNT(b.bookingID) AS c "
              + " FROM booking_information b WHERE b.starts >= ? AND b.ends <= ?"
              + " AND b.status = 'Available'"
              + " GROUP BY b.renterID ORDER BY c DESC")) {
        ps.setDate(1, new java.sql.Date(begin.getTime()));
        ps.setDate(2, new java.sql.Date(end.getTime()));
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            ret.add(new SimpleEntry<>(rs.getInt("renterID"),
                    rs.getInt("c")));
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get report", ex);
    }
    return ret;
  }

  public static List<Entry<Entry<Integer, String>, Integer>> rankRentersByCity(Date begin,
          Date end) {
    List<Entry<Entry<Integer, String>, Integer>> ret = new ArrayList<>();
    try {
      Connection con = Client.getConnector().get();

      try (PreparedStatement ps = con.prepareStatement("SELECT b.*, COUNT(b.bookingID) AS c "
              + " FROM booking_information b WHERE b.starts >= ? AND b.ends <= ?"
              + " AND b.status = 'Available'"
              + " GROUP BY b.renterID, b.country, b.province, b.city ORDER BY c DESC")) {
        ps.setDate(1, new java.sql.Date(begin.getTime()));
        ps.setDate(2, new java.sql.Date(end.getTime()));
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            if (rs.getInt("c") >= 2) {
              ret.add(new SimpleEntry<>(new SimpleEntry<>(rs.getInt("renterID"),
                      rs.getString("country") + ", " + rs.getString("province") + ", "
                      + rs.getString("city")), rs.getInt("c")));
            }
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get report", ex);
    }
    return ret;
  }

  public static List<Entry<String, Integer>> rankCityBookings(Date begin,
          Date end) {
    List<Entry<String, Integer>> ret = new ArrayList<>();
    try {
      Connection con = Client.getConnector().get();

      try (PreparedStatement ps = con.prepareStatement("SELECT b.*, COUNT(b.bookingID) AS c "
              + " FROM booking_information b WHERE b.starts >= ? AND b.ends <= ?"
              + " AND b.status = 'Available'"
              + " GROUP BY b.country, b.province, b.city ORDER BY c DESC")) {
        ps.setDate(1, new java.sql.Date(begin.getTime()));
        ps.setDate(2, new java.sql.Date(end.getTime()));
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            ret.add(new SimpleEntry<>(rs.getString("country") + ", "
                    + rs.getString("province") + ", " + rs.getString("city"),
                    rs.getInt("c")));
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get report", ex);
    }
    return ret;
  }

  public static List<Entry<String, Integer>> rankPostalCodeBookings(Date begin,
          Date end) {
    List<Entry<String, Integer>> ret = new ArrayList<>();
    try {
      Connection con = Client.getConnector().get();

      try (PreparedStatement ps = con.prepareStatement("SELECT b.*, COUNT(b.bookingID) AS c "
              + " FROM booking_information b WHERE b.starts >= ? AND b.ends <= ?"
              + " AND b.status = 'Available'"
              + " GROUP BY b.country, b.province, b.city, b.postal_code ORDER BY c DESC")) {
        ps.setDate(1, new java.sql.Date(begin.getTime()));
        ps.setDate(2, new java.sql.Date(end.getTime()));
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            ret.add(new SimpleEntry<>(rs.getString("country") + ", "
                    + rs.getString("province") + ", " + rs.getString("city")
                    + ", " + rs.getString("postal_code"), rs.getInt("c")));
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get report", ex);
    }
    return ret;
  }

  public static Map<Integer, List<Entry<String, Integer>>> getWordClouds() {
    Map<Integer, Map<String, Integer>> arr = new HashMap<>();
    Map<Integer, List<Entry<String, Integer>>> val = new HashMap<>();
    try {
      Connection con = Client.getConnector().get();

      try (PreparedStatement ps = con.prepareStatement("SELECT * FROM "
              + " listing_comments")) {
        try (ResultSet rs = ps.executeQuery()) {
          while (rs.next()) {
            int listing = rs.getInt("listingID");
            String comment = rs.getString("content").toLowerCase()
                    .replaceAll("[^a-z ]", "");

            Map<String, Integer> ret = arr.get(listing);
            if (ret == null) {
              ret = new HashMap<>();
              arr.put(listing, ret);
            }
            for (String word : comment.split(" ")) {
              if (word.length() <= 3) {
                continue;
              }
              if (!ret.containsKey(word)) {
                ret.put(word, 0);
              }
              ret.put(word, ret.get(word) + 1);
            }
          }
        }
      }
    } catch (SQLException ex) {
      LOG.log(Level.SEVERE, "Couldn't get report", ex);
    }
    for (Entry<Integer, Map<String, Integer>> ent : arr.entrySet()) {
      List<Entry<String, Integer>> right = new ArrayList<>();
      right.addAll(ent.getValue().entrySet());
      // greatest to least
      right.sort((a, b) -> -a.getValue().compareTo(b.getValue()));

      val.put(ent.getKey(), right);
    }
    return val;
  }
}
