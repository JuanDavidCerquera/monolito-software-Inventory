/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.entity;
import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author bonil
 */

 

public class AutocompleteExample extends JFrame {
    private JComboBox<String> comboBox;
    private JTextField textField;

    public AutocompleteExample() {
        super("Autocomplete Example");

        // Create the combo box and text field
        comboBox = new JComboBox<>();
        textField = new JTextField();

        // Add a document listener to the text field
        textField.getDocument().addDocumentListener(new DocumentListener() {
            @Override
            public void insertUpdate(DocumentEvent e) {
                update();
            }

            @Override
            public void removeUpdate(DocumentEvent e) {
                update();
            }

            @Override
            public void changedUpdate(DocumentEvent e) {
                update();
            }

            private void update() {
                // Get the user's input
                String input = textField.getText();

                // Clear the combo box
                comboBox.removeAllItems();

                // Get the suggestions from the database
                ArrayList<String> suggestions = getSuggestions(input);

                // Add the suggestions to the combo box
                for (String suggestion : suggestions) {
                    comboBox.addItem(suggestion);
                }

                // Show the combo box
                comboBox.setPopupVisible(true);
            }
        });

        // Add the combo box and text field to the frame
        add(comboBox);
        add(textField);

        // Set the layout and size of the frame
        setLayout(new BoxLayout(getContentPane(), BoxLayout.Y_AXIS));
        setSize(300, 100);

        // Show the frame
        setVisible(true);
    }

    private ArrayList<String> getSuggestions(String input) {
        ArrayList<String> suggestions = new ArrayList<>();

        try {
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda", "root", "");

            // Create a statement to query the database
            Statement stmt = conn.createStatement();

            // Execute the query and get the results
            //ResultSet rs = stmt.executeQuery("SELECT Nombre FROM Provedores WHERE Nombre LIKE '%" + input + "%';");
             ResultSet rs = stmt.executeQuery("SELECT id_provedor, Nombre FROM provedores WHERE Nombre LIKE '%" + input + "%';");
            // Loop through the results and add them to the list of suggestions
            while (rs.next()) {
                suggestions.add(rs.getString("Nombre"));
            }

            // Close the connection and statement
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return suggestions;
    }

    public static void main(String[] args) {
        new AutocompleteExample();
    }
}


