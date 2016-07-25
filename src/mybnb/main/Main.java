package mybnb.main;

import java.awt.EventQueue;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.UIManager;
import javax.swing.UIManager.LookAndFeelInfo;
import mybnb.data.DateConstants;
import mybnb.struct.Address;
import mybnb.struct.Availability;
import mybnb.struct.Booking;
import mybnb.struct.Comment;
import mybnb.struct.CreditCard;
import mybnb.struct.Listing;
import mybnb.struct.Rating;
import mybnb.struct.User;

/**
 * Main class for executing the program.
 */
public class Main {

  // Logger for this class
  private static final Logger LOG = Logger.getLogger(Main.class.getName());

  /**
   * Main method.
   *
   * @param args the command line arguments
   */
  public static void main(String[] args) {
    // Set look and feel
    boolean nimbus = false;
    try {
      for (LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()) {
        if ("Nimbus".equals(info.getName())) {
          UIManager.setLookAndFeel(info.getClassName());
          nimbus = true;
          break;
        }
      }
      if (!nimbus) {
        UIManager.setLookAndFeel(
                UIManager.getCrossPlatformLookAndFeelClassName());
      }
    } catch (Exception ex) {
      LOG.log(Level.WARNING, "Couldn't get the look and feel.", ex);
    }
    try {
      Client.get().initialize(); // Test the SQL
    } catch (SQLException e) {
      LOG.log(Level.SEVERE, "SQL Driver failed.", e);
      return;
    }
    try (Scanner in = new Scanner(System.in)) {
      while (Client.get().getCurrentUser() == null) {
        outln("Input a command.");
        outln("\t\t1 - Log in to user");
        outln("\t\t2 - Access reports");
        int command = in.nextInt();
        if (command == 1) {
          EventQueue.invokeLater(() -> Client.get().getLogin().setVisible(true));
        } else if (command == 2) {
          EventQueue.invokeLater(() -> Client.get().getReports().setVisible(true));
        } else {
          outln("Invalid.");
        }
      }
      User u = Client.get().getCurrentUser();
      outln("Successfully logged in as:");
      outln(u.toString());

      while (in.hasNextInt()) {
        outln("Input a command.");
        outln("\t\t1 - View credit cards");
        outln("\t\t2 - View hosted listings");
        outln("\t\t3 - View profile comments");
        outln("\t\t4 - View profile ratings");
        outln("\t\t5 - View current bookings");
        outln("\t\t6 - Search listings");
        int command = in.nextInt();
        if (command == 1) {
          for (int i = 0; i < u.getCards().size(); i++) {
            outln((i + 1) + ": " + u.getCards().get(i).toString());
          }
          outln("\t\t1 - Go back");
          outln("\t\t2 - Add a new credit card");
          outln("\t\t3 - Remove a credit card");
          command = in.nextInt();
          if (command == 2) {
            long number = 0;
            CreditCard c = null;
            do {
              outln("Enter a unique credit card number: ");
              number = in.nextLong();
              c = Client.get().getCard(number);
            } while (number <= 0 || c != null);
            String type = "";
            do {
              outln("Enter the credit card type (one in "
                      + Client.getTypes().getEnum("card_type") + ")");
              type = in.nextLine();
            } while (!Client.getTypes().getEnum("card_type").contains(type));
            Date expiry = null;
            do {
              outln("Enter the expiry date (YYYY-MM-DD)");
              expiry = DateConstants.parseDate(in.next());
            } while (expiry == null);

            CreditCard card = new CreditCard(number, u.getSIN(), type, expiry);
            try {
              card.insert(Client.getConnector().get());
            } catch (SQLException ex) {
              LOG.log(Level.SEVERE, "Insert error", ex);
            }
          } else if (command == 3) {
            if (!u.getCards().isEmpty()) {
              do {
                outln("Enter the index of the credit card to remove.");
                command = in.nextInt();
              } while (command <= 0 || command > u.getCards().size());

              u.getCards().remove(command - 1);
              try {
                u.update(Client.getConnector().get());
              } catch (SQLException ex) {
                LOG.log(Level.SEVERE, "Insert error", ex);
              }
              outln("Removed successfully.");
            } else {
              outln("No cards to remove.");
            }
          }
        } else if (command == 2) {
          for (int i = 0; i < u.getListings().size(); i++) {
            Listing l = u.getListings().get(i);
            outln((i + 1) + ": " + l.toString());
            outln("Address: " + l.getAddress()
                    + (l.getUnit() > 0 ? "#" + l.getUnit() : ""));
            outln("Description: " + l.getDescription());
            outln("Bathrooms: " + l.getBathrooms() + ", beds: " + l.getBeds()
                    + ", bedrooms: " + l.getBedrooms() + ", guests: " + l.getGuests());
            outln("Amenities: " + l.getAmenities());
          }
          outln("\t\t1 - Go back");
          outln("\t\t2 - Add a new listing");
          outln("\t\t3 - Remove a listing");
          outln("\t\t4 - Edit a listing");
          outln("\t\t5 - View commends and ratings of a listing");
          outln("\t\t6 - View and edit availabilities of a listing");

          Map<String, Double> shares = Reports.marketShareByHost(u.getSIN());
          for (Entry<String, Double> s : shares.entrySet()) {
            outln("WARNING: You have " + s.getValue() + "% market share in " + s.getKey() + ".");
          }

          command = in.nextInt();
          if (command == 2) {
            String type = "";
            do {
              outln("Enter the listing type (one in "
                      + Client.getTypes().getEnum("list_type") + ")");
              type = in.nextLine();
            } while (!Client.getTypes().getEnum("list_type").contains(type));

            outln("Enter the title.");
            String title = in.nextLine();

            outln("Enter the description.");
            String desc = in.nextLine();

            byte beds = 0;
            do {
              outln("Enter the number of beds.");
              beds = in.nextByte();
            } while (beds <= 0);
            byte bedrooms = 0;
            do {
              outln("Enter the number of bedrooms.");
              bedrooms = in.nextByte();
            } while (bedrooms <= 0);
            byte bathrooms = 0;
            do {
              outln("Enter the number of bathrooms.");
              bathrooms = in.nextByte();
            } while (bathrooms <= 0);
            byte guests = 0;
            do {
              outln("Enter the maximum guests.");
              guests = in.nextByte();
            } while (guests <= 0);

            double latitude = 0.0, longitude = 0.0;
            do {
              outln("Enter the latitude.");
              latitude = in.nextDouble();
            } while (latitude > 180 || latitude < -180);
            do {
              outln("Enter the longitude.");
              longitude = in.nextDouble();
            } while (longitude > 180 || longitude < -180);

            Address a = Client.get().findAddress(latitude, longitude);

            if (a == null) {
              String country = null, province = null, city = null,
                      street = null, postal = null;
              do {
                outln("This is a new location.");

                outln("Enter the country.");
                country = in.next();

                outln("Enter the province or state.");
                province = in.next();

                outln("Enter the city.");
                city = in.next();

                outln("Enter the street address.");
                street = in.nextLine();

                outln("Enter the postal code.");
                postal = in.nextLine();

                a = Client.get().findAddress(country, province,
                        city, street, postal);

                if (shares.containsKey(country + ", " + province + ", " + city)) {
                  outln("You have too much market share here.");
                }
              } while (a != null
                      || shares.containsKey(country + ", " + province + ", " + city));

              a = new Address(latitude, longitude, country, province, city,
                      street, postal);

              try {
                a.insert(Client.getConnector().get());
              } catch (SQLException ex) {
                LOG.log(Level.SEVERE, "Insert error", ex);
                continue;
              }
            }

            Listing l = new Listing(-1, u, type, a, title, desc, bathrooms, beds,
                    bedrooms, guests, true, 0.0, 0.0);

            try {
              l.insert(Client.getConnector().get());
            } catch (SQLException ex) {
              LOG.log(Level.SEVERE, "Insert error", ex);
              continue;
            }
            u.getListings().add(l);

            outln("Suggested price: $" + Math.round(Client.get().suggestPrice(l) * 100) / 100);

            outln("Add a new amenity? (Y/n)");
            while (in.next().toLowerCase().startsWith("y")) {
              String am = "";
              do {
                outln("Enter the amenity (one in "
                        + Client.getTypes().getEnum("amenity") + ")");
                am = in.nextLine();
              } while (!Client.getTypes().getEnum("amenity").contains(am));

              if (!l.getAmenities().contains(am)) {
                l.getAmenities().add(am);
              }

              outln("New suggested price: $" + Math.round(Client.get().suggestPrice(l) * 100) / 100);

              outln("Add a new amenity? (Y/n)");
            }

            outln("Add a new availability? (Y/n)");
            while (in.next().toLowerCase().startsWith("y")) {
              outln("Will this be an availability or an unavailability? (Y/n)");
              boolean available = in.next().toLowerCase().startsWith("y");
              String am = "";
              do {
                outln("Enter the type (one in "
                        + Client.getTypes().getEnum("rent_type") + ")");
                am = in.nextLine();
              } while (!Client.getTypes().getEnum("rent_type").contains(am));
              byte g = 0;
              do {
                outln("Enter the maximum guests.");
                g = in.nextByte();
              } while (g <= 0 || g > guests);

              Date begin = null;
              Date end = null;
              while (true) {
                do {
                  outln("Enter the begin date (YYYY-MM-DD)");
                  begin = DateConstants.parseDate(in.next());
                } while (begin == null);
                do {
                  outln("Enter the end date (YYYY-MM-DD)");
                  end = DateConstants.parseDate(in.next());
                } while (end == null);
                if (l.intersects(begin, end)) {
                  outln("An availability already exists in that range.");
                } else {
                  break;
                }
              }
              double price = 0;
              do {
                outln("Enter the daily price (Suggested: $"
                        + Math.round(Client.get().suggestPrice(l) * 100) / 100 + ".");
                price = in.nextDouble();
              } while (price <= 0);

              Availability av = new Availability(-1, l, begin, end,
                      am, price, g, available);

              l.getAvailabilities().add(av);

              try {
                av.insert(Client.getConnector().get());
              } catch (SQLException ex) {
                LOG.log(Level.SEVERE, "Insert error", ex);
                break;
              }
              outln("Add a new availability? (Y/n)");
            }
          } else if (command == 3) {
            if (!u.getListings().isEmpty()) {
              do {
                outln("Enter the index of the listing to remove.");
                command = in.nextInt();
              } while (command <= 0 || command > u.getListings().size());

              Listing l = u.getListings().remove(command - 1);
              l.setAvailable(false);
              try {
                l.update(Client.getConnector().get());
              } catch (SQLException ex) {
                LOG.log(Level.SEVERE, "Insert error", ex);
              }
              outln("Removed successfully.");
            } else {
              outln("No listings to remove.");
            }
          } else if (command == 4) {
            if (!u.getListings().isEmpty()) {
              do {
                outln("Enter the index of the listing to edit.");
                command = in.nextInt();
              } while (command <= 0 || command > u.getListings().size());

              Listing l = u.getListings().get(command - 1);
              outln("Enter the title (" + l.getTitle() + ").");
              String title = in.nextLine();

              outln("Enter the description.");
              String desc = in.nextLine();

              byte beds = 0;
              do {
                outln("Enter the number of beds (" + l.getBeds() + ").");
                beds = in.nextByte();
              } while (beds <= 0);
              byte bedrooms = 0;
              do {
                outln("Enter the number of bedrooms (" + l.getBedrooms() + ").");
                bedrooms = in.nextByte();
              } while (bedrooms <= 0);
              byte bathrooms = 0;
              do {
                outln("Enter the number of bathrooms (" + l.getBathrooms() + ").");
                bathrooms = in.nextByte();
              } while (bathrooms <= 0);
              byte guests = 0;
              do {
                outln("Enter the maximum guests (" + l.getGuests() + ").");
                guests = in.nextByte();
              } while (guests <= 0);

              l.setBeds(beds);
              l.setBathrooms(bathrooms);
              l.setBedrooms(bedrooms);
              l.setGuests(guests);
              l.setTitle(title);
              l.setDescription(desc);

              outln("Add a new amenity? (Y/n)");
              while (in.next().toLowerCase().startsWith("y")) {
                String am = "";
                do {
                  outln("Enter the amenity (one in "
                          + Client.getTypes().getEnum("amenity") + ")");
                  am = in.nextLine();
                } while (!Client.getTypes().getEnum("amenity").contains(am));

                if (!l.getAmenities().contains(am)) {
                  l.getAmenities().add(am);
                }

                outln("Add a new amenity? (Y/n)");
              }
              try {
                l.update(Client.getConnector().get());
              } catch (SQLException ex) {
                LOG.log(Level.SEVERE, "Insert error", ex);
              }
            } else {
              outln("No listings to edit.");
            }
          } else if (command == 5) {
            if (!u.getListings().isEmpty()) {
              do {
                outln("Enter the index of the listing to view.");
                command = in.nextInt();
              } while (command <= 0 || command > u.getListings().size());

              Listing l = u.getListings().get(command - 1);
              outln("Average rating: " + l.getAverageRating() + "/5");

              for (Rating r : l.getRatings()) {
                User other = Client.get().toUser(r.getOrigin(), "", false);
                if (other != null) {
                  outln(other.getFirstName() + " " + other.getLastName()
                          + " rated it " + r.getContent() + "/5");
                }
              }
              outln("-------------------");
              for (Comment r : l.getComments()) {
                User other = Client.get().toUser(r.getOrigin(), "", false);
                if (other != null) {
                  outln(other.getFirstName() + " " + other.getLastName()
                          + " commented: " + r.getContent());
                }
              }
            } else {
              outln("No listings to view.");
            }
          } else if (command == 6) {
            if (!u.getListings().isEmpty()) {
              do {
                outln("Enter the index of the listing to view.");
                command = in.nextInt();
              } while (command <= 0 || command > u.getListings().size());

              Listing l = u.getListings().get(command - 1);
              
              if (l.getAvailabilities().isEmpty()) {
                outln("No availabilities.");
                continue;
              }

              for (int i = 0; i < l.getAvailabilities().size(); i++) {
                Availability a = l.getAvailabilities().get(i);
                outln((i + 1) + ": " + a.toString());
              }
              do {
                outln("Enter the index of the availability to view.");
                command = in.nextInt();
              } while (command <= 0 || command > l.getAvailabilities().size());
              
              Availability a = l.getAvailabilities().get(command - 1);
              outln("Input a command.");
              if (!a.getBookings().isEmpty()) {
                outln("\t\t1 - View and edit bookings");
              } else {
                outln("\t\t2 - Edit this availability");
                outln("\t\t3 - Delete this availability");
              }
              command = in.nextInt();
              if (command == 1 && !a.getBookings().isEmpty()) {
                for (int i = 0; i < a.getBookings().size(); i++) {
                  Booking b = a.getBookings().get(i);
                  outln((i + 1) + ": Booked by " + b.getRenter().getFirstName() + " "
                          + b.getRenter().getLastName() + " : " + b);
                }
                do {
                  outln("Enter the index of the booking to view.");
                  command = in.nextInt();
                } while (command <= 0 || command > a.getBookings().size());
                
                Booking b = a.getBookings().get(command - 1);
                outln("Cancel this booking? (Y/n)");
                if (in.next().toLowerCase().startsWith("y")) {
                  b.setStatus("Canceled by Host");
                  try {
                    b.update(Client.getConnector().get());
                    outln("Success");
                  } catch (SQLException ex) {
                    LOG.log(Level.SEVERE, "Insert error", ex);
                  }
                }
              } else if (command == 2 && a.getBookings().isEmpty()) {
                byte g = 0;
                do {
                  outln("Enter the maximum guests (" + a.getGuests() + ").");
                  g = in.nextByte();
                } while (g <= 0 || g > l.getGuests());

                double price = 0;
                do {
                  outln("Enter the daily price (Suggested: $"
                          + Math.round(Client.get().suggestPrice(l) * 100) / 100 + ".");
                  price = in.nextDouble();
                } while (price <= 0);
                
                a.setPrice(price);
                a.setGuests(g);
                
                try {
                  a.update(Client.getConnector().get());
                  outln("Success");
                } catch (SQLException ex) {
                  LOG.log(Level.SEVERE, "Insert error", ex);
                }
              } else if (command == 3 && a.getBookings().isEmpty()) {
                l.getAvailabilities().remove(a);
                try {
                  a.delete(Client.getConnector().get());
                  outln("Success");
                } catch (SQLException ex) {
                  LOG.log(Level.SEVERE, "Delete error", ex);
                }
              } else {
                outln("Invalid command.");
              }
            } else {
              outln("No listings to view.");
            }
          }

        } else if (command == 3) {
          for (Comment r : u.getComments()) {
            User other = Client.get().toUser(r.getOrigin(), "", false);
            if (other != null) {
              outln(other.getFirstName() + " " + other.getLastName()
                      + " commented: " + r.getContent());
            }
          }
        } else if (command == 4) {
          outln("Average rating: " + u.getAverageRating() + "/5");
          for (Rating r : u.getRatings()) {
            User other = Client.get().toUser(r.getOrigin(), "", false);
            if (other != null) {
              outln(other.getFirstName() + " " + other.getLastName()
                      + " rated you " + r.getContent() + "/5");
            }
          }
        } else if (command == 5) {
          EventQueue.invokeLater(() -> Client.get().getSearch().setVisible(true));
          while (Client.get().getSearch().isVisible()) {
            try {
              Thread.sleep(1000);
            } catch (InterruptedException ex) {}
          }
          
          if (Client.get().getCurrentListing() != null) {
            
          }
        } else {
          outln("Invalid.");
        }
      }
    }
  }

  private static void outln(String text) {
    System.out.println(text);
  }

  private static void out(String text) {
    System.out.print(text);
  }

}
