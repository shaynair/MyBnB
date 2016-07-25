package mybnb.gui;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.swing.DefaultListModel;
import mybnb.data.DateConstants;
import mybnb.main.Client;
import mybnb.struct.Address;
import mybnb.struct.Listing;

/**
 *
 * @author user
 */
public class SearchPanel extends javax.swing.JPanel {

  private List<Listing> listings = new ArrayList<>();
  
  /**
   * Creates new form MainPanel
   */
  public SearchPanel() {
    initComponents();
  }

  /**
   * This method is called from within the constructor to initialize the form.
   * WARNING: Do NOT modify this code. The content of this method is always
   * regenerated by the Form Editor.
   */
  @SuppressWarnings("unchecked")
  // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
  private void initComponents() {

    buttonGroup1 = new javax.swing.ButtonGroup();
    buttonGroup2 = new javax.swing.ButtonGroup();
    coordButton = new javax.swing.JRadioButton();
    jLabel1 = new javax.swing.JLabel();
    latitude = new javax.swing.JTextField();
    longitude = new javax.swing.JTextField();
    jLabel2 = new javax.swing.JLabel();
    postalButton = new javax.swing.JRadioButton();
    addressButton = new javax.swing.JRadioButton();
    jLabel3 = new javax.swing.JLabel();
    search = new javax.swing.JTextField();
    priceAsc = new javax.swing.JRadioButton();
    priceDesc = new javax.swing.JRadioButton();
    jLabel4 = new javax.swing.JLabel();
    dateStart = new javax.swing.JTextField();
    jLabel5 = new javax.swing.JLabel();
    dateEnd = new javax.swing.JTextField();
    jScrollPane1 = new javax.swing.JScrollPane();
    amenities = new javax.swing.JList<>();
    jLabel6 = new javax.swing.JLabel();
    startSearch = new javax.swing.JButton();
    error = new javax.swing.JLabel();
    jLabel7 = new javax.swing.JLabel();
    jLabel8 = new javax.swing.JLabel();
    priceLow = new javax.swing.JTextField();
    priceHigh = new javax.swing.JTextField();
    jLabel9 = new javax.swing.JLabel();
    vicinity = new javax.swing.JTextField();
    jScrollPane2 = new javax.swing.JScrollPane();
    results = new javax.swing.JList<>();
    beds = new javax.swing.JTextField();
    jLabel10 = new javax.swing.JLabel();
    bedrooms = new javax.swing.JTextField();
    jLabel11 = new javax.swing.JLabel();
    bathrooms = new javax.swing.JTextField();
    jLabel12 = new javax.swing.JLabel();
    guests = new javax.swing.JTextField();

    buttonGroup1.add(coordButton);
    coordButton.setText("Search by Co-ordinates");
    coordButton.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(java.awt.event.ActionEvent evt) {
        coordButtonActionPerformed(evt);
      }
    });

    jLabel1.setText("Latitude:");

    jLabel2.setText("Longitude:");

    buttonGroup1.add(postalButton);
    postalButton.setText("Search by adjacent Postal Codes");
    postalButton.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(java.awt.event.ActionEvent evt) {
        postalButtonActionPerformed(evt);
      }
    });

    addressButton.setText("Search by exact Address");
    addressButton.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(java.awt.event.ActionEvent evt) {
        addressButtonActionPerformed(evt);
      }
    });

    jLabel3.setText("Search:");

    buttonGroup2.add(priceAsc);
    priceAsc.setSelected(true);
    priceAsc.setText("Sort by price (Ascending)");

    buttonGroup2.add(priceDesc);
    priceDesc.setText("Sort by price (Descending)");

    jLabel4.setText("Date range start:");

    dateStart.setText("YYYY-MM-DD (Optional)");

    jLabel5.setText("Date range end:");

    dateEnd.setText("YYYY-MM-DD (Optional)");
    dateEnd.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(java.awt.event.ActionEvent evt) {
        dateEndActionPerformed(evt);
      }
    });

    jScrollPane1.setViewportView(amenities);

    jLabel6.setText("Beds:");

    startSearch.setText("Start Search");
    startSearch.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(java.awt.event.ActionEvent evt) {
        startSearchActionPerformed(evt);
      }
    });

    error.setForeground(new java.awt.Color(255, 0, 0));

    jLabel7.setText("Price range min:");

    jLabel8.setText("Price range max:");

    priceLow.setText("(Optional)");

    priceHigh.setText("(Optional)");

    jLabel9.setText("Vicinity (km):");

    vicinity.setText("5.0");

    results.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
    results.addListSelectionListener(new javax.swing.event.ListSelectionListener() {
      public void valueChanged(javax.swing.event.ListSelectionEvent evt) {
        resultsValueChanged(evt);
      }
    });
    jScrollPane2.setViewportView(results);

    beds.setText("0");

    jLabel10.setText("Bedrooms:");

    bedrooms.setText("0");

    jLabel11.setText("Bathrooms:");

    bathrooms.setText("0");

    jLabel12.setText("Guests:");

    guests.setText("0");

    javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
    this.setLayout(layout);
    layout.setHorizontalGroup(
      layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
      .addGroup(layout.createSequentialGroup()
        .addContainerGap()
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
          .addGroup(layout.createSequentialGroup()
            .addComponent(postalButton)
            .addGap(18, 18, 18)
            .addComponent(addressButton, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
          .addGroup(layout.createSequentialGroup()
            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 119, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addGap(18, 18, 18)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
              .addComponent(priceDesc, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
              .addGroup(layout.createSequentialGroup()
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(dateStart))
              .addGroup(layout.createSequentialGroup()
                .addComponent(jLabel5)
                .addGap(15, 15, 15)
                .addComponent(dateEnd))
              .addGroup(layout.createSequentialGroup()
                .addComponent(jLabel7)
                .addGap(22, 22, 22)
                .addComponent(priceLow))
              .addGroup(layout.createSequentialGroup()
                .addComponent(jLabel8)
                .addGap(18, 18, 18)
                .addComponent(priceHigh))
              .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                  .addComponent(priceAsc)
                  .addGroup(layout.createSequentialGroup()
                    .addComponent(error, javax.swing.GroupLayout.PREFERRED_SIZE, 143, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                    .addComponent(startSearch)))
                .addGap(0, 3, Short.MAX_VALUE))))
          .addGroup(layout.createSequentialGroup()
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
              .addComponent(coordButton)
              .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 383, javax.swing.GroupLayout.PREFERRED_SIZE))
            .addGap(0, 0, Short.MAX_VALUE))
          .addGroup(layout.createSequentialGroup()
            .addGap(21, 21, 21)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
              .addGroup(layout.createSequentialGroup()
                .addComponent(jLabel6)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(beds, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel10)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(bedrooms, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel11)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(bathrooms, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel12)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(guests, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
              .addGroup(layout.createSequentialGroup()
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(search))
              .addGroup(layout.createSequentialGroup()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(latitude, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(longitude, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel9)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(vicinity)))))
        .addContainerGap())
    );
    layout.setVerticalGroup(
      layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
      .addGroup(layout.createSequentialGroup()
        .addContainerGap()
        .addComponent(coordButton)
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(jLabel1)
          .addComponent(latitude, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(jLabel2)
          .addComponent(jLabel9)
          .addComponent(vicinity, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(longitude, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(postalButton)
          .addComponent(addressButton))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(jLabel3)
          .addComponent(search, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
          .addComponent(jLabel6)
          .addComponent(beds, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(jLabel10)
          .addComponent(bedrooms, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(jLabel11)
          .addComponent(bathrooms, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
          .addComponent(jLabel12)
          .addComponent(guests, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
          .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
            .addComponent(priceAsc)
            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
            .addComponent(priceDesc)
            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
              .addComponent(jLabel4)
              .addComponent(dateStart, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
              .addComponent(jLabel5)
              .addComponent(dateEnd, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
              .addComponent(jLabel7)
              .addComponent(priceLow, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
              .addComponent(jLabel8)
              .addComponent(priceHigh, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
              .addComponent(error, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
              .addComponent(startSearch)))
          .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 203, javax.swing.GroupLayout.PREFERRED_SIZE))
        .addGap(9, 9, 9)
        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 119, javax.swing.GroupLayout.PREFERRED_SIZE)
        .addContainerGap())
    );
  }// </editor-fold>//GEN-END:initComponents

  private void populate() {
    if (amenities.getModel().getSize() > 0) {
      return;
    }
    DefaultListModel lm = new DefaultListModel();
    for (String s : Client.getTypes().getEnum("amenity").toArray(new String[0])) {
      lm.addElement(s);
    }
    amenities.setModel(lm);
  }
  
  private void startSearchActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_startSearchActionPerformed
    populate();
    List<Address> addresses = null;
    if (addressButton.isSelected()) {
      if (search.getText().isEmpty()) {
        error.setText("Please enter fields.");
        return;
      }
      addresses = Client.get().findAddressByStreet(search.getText());
    } else if (postalButton.isSelected()) {
      if (search.getText().isEmpty()) {
        error.setText("Please enter fields.");
        return;
      }
      addresses = Client.get().findAddressByCode(search.getText());
    } else if (coordButton.isSelected()) {
      if (latitude.getText().isEmpty() || longitude.getText().isEmpty()
              || vicinity.getText().isEmpty()) {
        error.setText("Please enter fields.");
        return;
      }
      try {
        addresses = Client.get().findAddressByVicinity(
                Double.parseDouble(latitude.getText()), 
                Double.parseDouble(longitude.getText()), 
                Double.parseDouble(vicinity.getText()));
      } catch (NumberFormatException ex) {
        error.setText("Please enter numbers.");
        return;
      }
    } else {
      error.setText("Select an option.");
      return;
    }
    if (addresses == null || addresses.isEmpty()) {
      error.setText("Address not found.");
      return;
    }
    boolean descPrice = priceDesc.isSelected();
    Date begin = DateConstants.parseDate(dateStart.getText());
    Date end = DateConstants.parseDate(dateEnd.getText());
    Set<String> amenityList = new HashSet<>();
    List<String> amen = Client.getTypes().getEnum("amenity");
    for (int i : amenities.getSelectedIndices()) {
      if (i >= 0 && i < amen.size()) {
        amenityList.add(amen.get(i));
      }
    }
    int nBeds = 0, nBathrooms = 0, nBedrooms = 0, nGuests = 0;
    double priceMin = Double.NEGATIVE_INFINITY;
    double priceMax = Double.POSITIVE_INFINITY;
    try {
      priceMin = Double.parseDouble(priceLow.getText());
      priceMax = Double.parseDouble(priceHigh.getText());
    } catch (Exception e) {}
    try {
      nBeds = Integer.parseInt(beds.getText());
    } catch (Exception e) {}
    try {
      nBedrooms = Integer.parseInt(bedrooms.getText());
    } catch (Exception e) {}
    try {
      nBathrooms = Integer.parseInt(bathrooms.getText());
    } catch (Exception e) {}
    try {
      nGuests = Integer.parseInt(guests.getText());
    } catch (Exception e) {}
    
    List<Listing> listing = Client.get().searchListings(addresses);
    if (listing.isEmpty()) {
      error.setText("No listings found.");
      return;
    }
    Client.get().filterListings(listing, begin, end, descPrice, amenityList, 
          priceMin, priceMax, nBeds, nBedrooms, nBathrooms, nGuests);
    
    if (listing.isEmpty()) {
      error.setText("Fields too restrictive.");
      return;
    }
    DefaultListModel listModel = new DefaultListModel();
    for (Listing l : listing) {
      listModel.addElement(l.toString());
    }
    results.setModel(listModel);
    
    listings = listing;
    
  }//GEN-LAST:event_startSearchActionPerformed

  private void dateEndActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_dateEndActionPerformed
  }//GEN-LAST:event_dateEndActionPerformed

  private void resultsValueChanged(javax.swing.event.ListSelectionEvent evt) {//GEN-FIRST:event_resultsValueChanged
    if (evt.getFirstIndex() != evt.getLastIndex() || listings.isEmpty()
            || evt.getFirstIndex() < 0 || evt.getFirstIndex() >= listings.size()) {
      return;
    }
    Client.get().setCurrentListing(listings.get(evt.getFirstIndex()));
  }//GEN-LAST:event_resultsValueChanged

  private void coordButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_coordButtonActionPerformed
    populate();
  }//GEN-LAST:event_coordButtonActionPerformed

  private void postalButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_postalButtonActionPerformed
    populate();
  }//GEN-LAST:event_postalButtonActionPerformed

  private void addressButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_addressButtonActionPerformed
    populate();
  }//GEN-LAST:event_addressButtonActionPerformed


  // Variables declaration - do not modify//GEN-BEGIN:variables
  private javax.swing.JRadioButton addressButton;
  private javax.swing.JList<String> amenities;
  private javax.swing.JTextField bathrooms;
  private javax.swing.JTextField bedrooms;
  private javax.swing.JTextField beds;
  private javax.swing.ButtonGroup buttonGroup1;
  private javax.swing.ButtonGroup buttonGroup2;
  private javax.swing.JRadioButton coordButton;
  private javax.swing.JTextField dateEnd;
  private javax.swing.JTextField dateStart;
  private javax.swing.JLabel error;
  private javax.swing.JTextField guests;
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
  private javax.swing.JScrollPane jScrollPane1;
  private javax.swing.JScrollPane jScrollPane2;
  private javax.swing.JTextField latitude;
  private javax.swing.JTextField longitude;
  private javax.swing.JRadioButton postalButton;
  private javax.swing.JRadioButton priceAsc;
  private javax.swing.JRadioButton priceDesc;
  private javax.swing.JTextField priceHigh;
  private javax.swing.JTextField priceLow;
  private javax.swing.JList<String> results;
  private javax.swing.JTextField search;
  private javax.swing.JButton startSearch;
  private javax.swing.JTextField vicinity;
  // End of variables declaration//GEN-END:variables
}