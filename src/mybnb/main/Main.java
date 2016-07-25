package mybnb.main;

import java.awt.EventQueue;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.UIManager;
import javax.swing.UIManager.LookAndFeelInfo;
import mybnb.gui.LoginFrame;

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
    EventQueue.invokeLater(() -> Client.get().getFrame().setVisible(true));
  }

}
