package mybnb.gui;

import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import mybnb.data.DateConstants;
import mybnb.main.Client;
import mybnb.struct.Address;
import mybnb.struct.User;

/**
 * First panel that the user will see.
 */
public class LoginPanel extends javax.swing.JPanel {

  /**
   * Creates new form LoginPanel
   */
  public LoginPanel() {
    initComponents();

    initState(0);
  }

  /**
   * This method is called from within the constructor to initialize the form.
   * WARNING: Do NOT modify this code. The content of this method is always
   * regenerated by the Form Editor.
   */
  @SuppressWarnings("unchecked")
  // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
  private void initComponents() {

    loginButton = new javax.swing.JRadioButton();
    registerButton = new javax.swing.JRadioButton();
    emailLabel = new javax.swing.JLabel();
    loginEmailText = new javax.swing.JTextField();
    login = new javax.swing.JButton();
    jLabel1 = new javax.swing.JLabel();
    jLabel2 = new javax.swing.JLabel();
    jLabel3 = new javax.swing.JLabel();
    emailText = new javax.swing.JTextField();
    firstNameText = new javax.swing.JTextField();
    lastNameText = new javax.swing.JTextField();
    jLabel4 = new javax.swing.JLabel();
    occupationText = new javax.swing.JTextField();
    jLabel5 = new javax.swing.JLabel();
    birthdayText = new javax.swing.JTextField();
    jLabel6 = new javax.swing.JLabel();
    jLabel7 = new javax.swing.JLabel();
    jLabel8 = new javax.swing.JLabel();
    countryText = new javax.swing.JTextField();
    provinceText = new javax.swing.JTextField();
    cityText = new javax.swing.JTextField();
    postalCodeText = new javax.swing.JTextField();
    jLabel9 = new javax.swing.JLabel();
    jLabel10 = new javax.swing.JLabel();
    sinText = new javax.swing.JTextField();
    jLabel11 = new javax.swing.JLabel();
    addressText = new javax.swing.JTextField();
    register = new javax.swing.JButton();
    error = new javax.swing.JLabel();
    loginError = new javax.swing.JLabel();
    latitudeText = new javax.swing.JTextField();
    latitudeLabel = new javax.swing.JLabel();
    longitudeLabel = new javax.swing.JLabel();
    longitudeText = new javax.swing.JTextField();
    deleteButton = new javax.swing.JRadioButton();
    jLabel12 = new javax.swing.JLabel();
    deleteEmailText = new javax.swing.JTextField();
    delete = new javax.swing.JButton();
    deleteError = new javax.swing.JLabel();

    loginButton.setText("Log in as an existing user.");
    loginButton.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(java.awt.event.ActionEvent evt) {
        loginButtonActionPerformed(evt);
      }
    });

    registerButton.setText("Register as a new user.");
    registerButton.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(java.awt.event.ActionEvent evt) {
        registerButtonActionPerformed(evt);
      }
    });

    emailLabel.setText("E-mail:");

    login.setText("Log In");
    login.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(java.awt.event.ActionEvent evt) {
        loginActionPerformed(evt);
      }
    });

    jLabel1.setText("E-mail:");

    jLabel2.setText("First Name:");

    jLabel3.setText("Last Name:");

    jLabel4.setText("Occupation:");

    jLabel5.setText("Birthdate:");

    birthdayText.setText("YYYY-MM-DD");

    jLabel6.setText("Country:");

    jLabel7.setText("Province:");

    jLabel8.setText("City:");

    jLabel9.setText("Postal Code:");

    jLabel10.setText("SIN:");

    jLabel11.setText("Address:");

    register.setText("Register");
    register.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(java.awt.event.ActionEvent evt) {
        registerActionPerformed(evt);
      }
    });

    error.setForeground(new java.awt.Color(255, 0, 0));

    loginError.setForeground(new java.awt.Color(255, 0, 0));

    latitudeLabel.setText("Latitude:");

    longitudeLabel.setText("Longitude:");

    deleteButton.setText("Delete a user.");
    deleteButton.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(java.awt.event.ActionEvent evt) {
        deleteButtonActionPerformed(evt);
      }
    });

    jLabel12.setText("E-mail:");

    delete.setText("Delete");
    delete.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(java.awt.event.ActionEvent evt) {
        deleteActionPerformed(evt);
      }
    });

    deleteError.setForeground(new java.awt.Color(255, 0, 0));

    javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
    this.setLayout(layout);
    layout.setHorizontalGroup(
      layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
      .addGroup(layout.createSequentialGroup()
        .addContainerGap()
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
          .addGroup(layout.createSequentialGroup()
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
              .addComponent(registerButton)
              .addGroup(layout.createSequentialGroup()
                .addComponent(loginButton)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(loginError, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
              .addGroup(layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                  .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                      .addComponent(emailLabel)
                      .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                      .addComponent(loginEmailText)
                      .addGap(18, 18, 18)
                      .addComponent(login, javax.swing.GroupLayout.PREFERRED_SIZE, 63, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                      .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                          .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                              .addComponent(jLabel4)
                              .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                              .addComponent(occupationText, javax.swing.GroupLayout.PREFERRED_SIZE, 87, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                              .addGap(53, 53, 53)
                              .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addComponent(countryText, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(cityText, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 94, javax.swing.GroupLayout.PREFERRED_SIZE))))
                          .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                          .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel7)
                            .addComponent(jLabel9)
                            .addComponent(jLabel5)))
                        .addGroup(layout.createSequentialGroup()
                          .addComponent(jLabel2)
                          .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                          .addComponent(firstNameText, javax.swing.GroupLayout.PREFERRED_SIZE, 96, javax.swing.GroupLayout.PREFERRED_SIZE)
                          .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                          .addComponent(jLabel3))
                        .addGroup(layout.createSequentialGroup()
                          .addComponent(jLabel1)
                          .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                          .addComponent(emailText, javax.swing.GroupLayout.PREFERRED_SIZE, 113, javax.swing.GroupLayout.PREFERRED_SIZE)
                          .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                          .addComponent(jLabel10)))
                      .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                      .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(lastNameText)
                        .addComponent(birthdayText, javax.swing.GroupLayout.DEFAULT_SIZE, 107, Short.MAX_VALUE)
                        .addComponent(postalCodeText)
                        .addComponent(provinceText)
                        .addComponent(sinText))))
                  .addGroup(layout.createSequentialGroup()
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                      .addComponent(jLabel6)
                      .addComponent(jLabel8)
                      .addComponent(latitudeLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 51, javax.swing.GroupLayout.PREFERRED_SIZE)
                      .addComponent(jLabel11))
                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                      .addGroup(layout.createSequentialGroup()
                        .addComponent(latitudeText, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(longitudeLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(longitudeText, javax.swing.GroupLayout.DEFAULT_SIZE, 116, Short.MAX_VALUE))
                      .addComponent(addressText))))))
            .addGap(0, 0, Short.MAX_VALUE))
          .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
              .addGroup(layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addComponent(jLabel12)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(deleteEmailText))
              .addGroup(layout.createSequentialGroup()
                .addGap(0, 17, Short.MAX_VALUE)
                .addComponent(error, javax.swing.GroupLayout.PREFERRED_SIZE, 268, javax.swing.GroupLayout.PREFERRED_SIZE)))
            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
              .addComponent(register)
              .addComponent(delete, javax.swing.GroupLayout.Alignment.TRAILING)))
          .addGroup(layout.createSequentialGroup()
            .addComponent(deleteButton)
            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
            .addComponent(deleteError, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        .addContainerGap())
    );
    layout.setVerticalGroup(
      layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
      .addGroup(layout.createSequentialGroup()
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(loginButton)
          .addComponent(loginError))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(emailLabel)
          .addComponent(loginEmailText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(login))
        .addGap(9, 9, 9)
        .addComponent(registerButton)
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(jLabel1)
          .addComponent(emailText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(jLabel10)
          .addComponent(sinText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(jLabel2)
          .addComponent(jLabel3)
          .addComponent(firstNameText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(lastNameText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(jLabel4)
          .addComponent(occupationText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(jLabel5)
          .addComponent(birthdayText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(jLabel6)
          .addComponent(jLabel7)
          .addComponent(countryText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(provinceText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(jLabel8)
          .addComponent(cityText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(postalCodeText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(jLabel9))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(jLabel11)
          .addComponent(addressText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(latitudeText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(latitudeLabel)
          .addComponent(longitudeLabel)
          .addComponent(longitudeText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(register)
          .addComponent(error))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(deleteButton)
          .addComponent(deleteError))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(jLabel12)
          .addComponent(deleteEmailText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(delete))
        .addContainerGap(55, Short.MAX_VALUE))
    );
  }// </editor-fold>//GEN-END:initComponents

  private void registerButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_registerButtonActionPerformed
    if (registerButton.isSelected()) {
      initState(1);
    }
  }//GEN-LAST:event_registerButtonActionPerformed

  private void loginButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_loginButtonActionPerformed
    if (loginButton.isSelected()) {
      initState(0);
    }
  }//GEN-LAST:event_loginButtonActionPerformed

  private void loginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_loginActionPerformed
    if (loginEmailText.getText().isEmpty()) {
      loginError.setText("Please enter an e-mail.");
      return;
    }
    User u = Client.get().toUser(-1, loginEmailText.getText(), true);
    if (u == null) {
      loginError.setText("This user was not found.");
      return;
    }
    Client.get().setCurrentUser(u);
  }//GEN-LAST:event_loginActionPerformed

  private void registerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_registerActionPerformed
    if (addressText.getText().isEmpty() || birthdayText.getText().length() != 10
            || cityText.getText().isEmpty() || countryText.getText().isEmpty()
            || emailText.getText().isEmpty() || firstNameText.getText().isEmpty()
            || lastNameText.getText().isEmpty() || occupationText.getText().isEmpty()
            || provinceText.getText().isEmpty() || sinText.getText().isEmpty()
            || postalCodeText.getText().isEmpty()) {
      error.setText("Please fill all fields.");
      return;
    }
    int sin;
    Date birthday = DateConstants.parseDate(birthdayText.getText());
    try {
      sin = Integer.parseInt(sinText.getText());
      if (sin <= 0) {
        error.setText("SIN must be a number greater than 0.");
        return;
      }
    } catch (NumberFormatException e) {
      error.setText("SIN must be a number.");
      return;
    }
    if (birthday == null || DateConstants.getDiffYears(birthday, new Date()) < 18) {
      error.setText("You must be at least 18 years old.");
      return;
    }

    if (Client.get().toUser(-1, emailText.getText(), false) != null
            || Client.get().toUser(sin, "", false) != null) {
      error.setText("User exists already.");
      return;
    }

    Address a = Client.get().findAddress(countryText.getText(), provinceText.getText(),
            cityText.getText(), addressText.getText(), postalCodeText.getText());
    if (a == null) {
      if (latitudeText.getText().isEmpty() || !latitudeText.isVisible()
              || longitudeText.getText().isEmpty() || !longitudeText.isVisible()) {
        latitudeLabel.setVisible(true);
        longitudeLabel.setVisible(true);
        latitudeText.setVisible(true);
        longitudeText.setVisible(true);
        error.setText("Please enter your latitude and longitude.");
        return;
      }
      double latitude, longitude;
      try {
        latitude = Double.parseDouble(latitudeText.getText());
        longitude = Double.parseDouble(longitudeText.getText());
        if (latitude < -180 || latitude > 180 || longitude < -180 || longitude > 180) {
          error.setText("Latitude and longitude must be -180 to 180.");
          return;
        }
      } catch (NumberFormatException e) {
        error.setText("Latitude and longitude must be numbers.");
        return;
      }
      a = Client.get().findAddress(latitude, longitude);
      if (a != null) {
        error.setText("That latitude and longitude exist.");
        return;
      }
      a = new Address(latitude, longitude, countryText.getText(), provinceText.getText(),
              cityText.getText(), addressText.getText(), postalCodeText.getText());

      try {
        a.insert(Client.getConnector().get());
      } catch (SQLException ex) {
        error.setText("An error occurred.");
        LOG.log(Level.SEVERE, "SQL error on insert address", ex);
        return;
      }
    }
    User u = new User(sin, firstNameText.getText(), lastNameText.getText(),
            emailText.getText(), occupationText.getText(), a, birthday, 0.0);
    try {
      u.insert(Client.getConnector().get());
    } catch (SQLException ex) {
      error.setText("An error occurred.");
      LOG.log(Level.SEVERE, "SQL error on insert user", ex);
      return;
    }
    Client.get().setCurrentUser(u);
  }//GEN-LAST:event_registerActionPerformed

  private void deleteButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_deleteButtonActionPerformed
    if (deleteButton.isSelected()) {
      initState(2);
    }
  }//GEN-LAST:event_deleteButtonActionPerformed

  private void deleteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_deleteActionPerformed
    if (deleteEmailText.getText().isEmpty()) {
      deleteError.setText("Please enter an e-mail.");
      return;
    }
    User u = Client.get().toUser(-1, deleteEmailText.getText(), true);
    if (u == null) {
      deleteError.setText("This user was not found.");
      return;
    }
    try {
      u.delete(Client.getConnector().get());
    } catch (SQLException ex) {
      deleteError.setText("An error occurred.");
      LOG.log(Level.SEVERE, "SQL error on insert user", ex);
      return;
    }
  }//GEN-LAST:event_deleteActionPerformed

  // Logger for this class
  private static final Logger LOG = Logger.getLogger(LoginPanel.class.getName());

  private void initState(int state) {
    addressText.setEnabled(state == 1);
    birthdayText.setEnabled(state == 1);
    cityText.setEnabled(state == 1);
    countryText.setEnabled(state == 1);
    emailText.setEnabled(state == 1);
    firstNameText.setEnabled(state == 1);
    lastNameText.setEnabled(state == 1);
    occupationText.setEnabled(state == 1);
    postalCodeText.setEnabled(state == 1);
    provinceText.setEnabled(state == 1);
    sinText.setEnabled(state == 1);
    this.register.setEnabled(state == 1);
    registerButton.setSelected(state == 1);

    login.setEnabled(state == 0);
    loginEmailText.setEnabled(state == 0);
    loginButton.setSelected(state == 0);

    delete.setEnabled(state == 2);
    deleteEmailText.setEnabled(state == 2);
    deleteButton.setSelected(state == 2);

    latitudeLabel.setVisible(false);
    longitudeLabel.setVisible(false);

    latitudeText.setVisible(false);
    latitudeText.setText("");
    longitudeText.setVisible(false);
    longitudeText.setText("");

    deleteError.setText("");
    loginError.setText("");
    error.setText("");
  }

  // Variables declaration - do not modify//GEN-BEGIN:variables
  private javax.swing.JTextField addressText;
  private javax.swing.JTextField birthdayText;
  private javax.swing.JTextField cityText;
  private javax.swing.JTextField countryText;
  private javax.swing.JButton delete;
  private javax.swing.JRadioButton deleteButton;
  private javax.swing.JTextField deleteEmailText;
  private javax.swing.JLabel deleteError;
  private javax.swing.JLabel emailLabel;
  private javax.swing.JTextField emailText;
  private javax.swing.JLabel error;
  private javax.swing.JTextField firstNameText;
  private javax.swing.JLabel jLabel1;
  private javax.swing.JLabel jLabel10;
  private javax.swing.JLabel jLabel11;
  private javax.swing.JLabel jLabel12;
  private javax.swing.JLabel jLabel2;
  private javax.swing.JLabel jLabel3;
  private javax.swing.JLabel jLabel4;
  private javax.swing.JLabel jLabel5;
  private javax.swing.JLabel jLabel6;
  private javax.swing.JLabel jLabel7;
  private javax.swing.JLabel jLabel8;
  private javax.swing.JLabel jLabel9;
  private javax.swing.JTextField lastNameText;
  private javax.swing.JLabel latitudeLabel;
  private javax.swing.JTextField latitudeText;
  private javax.swing.JButton login;
  private javax.swing.JRadioButton loginButton;
  private javax.swing.JTextField loginEmailText;
  private javax.swing.JLabel loginError;
  private javax.swing.JLabel longitudeLabel;
  private javax.swing.JTextField longitudeText;
  private javax.swing.JTextField occupationText;
  private javax.swing.JTextField postalCodeText;
  private javax.swing.JTextField provinceText;
  private javax.swing.JButton register;
  private javax.swing.JRadioButton registerButton;
  private javax.swing.JTextField sinText;
  // End of variables declaration//GEN-END:variables
}
