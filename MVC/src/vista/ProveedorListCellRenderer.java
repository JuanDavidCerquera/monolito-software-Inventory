package vista;

import javax.swing.JList;
import javax.swing.ListCellRenderer;
import modelo.Proveedor;

public class ProveedorListCellRenderer implements ListCellRenderer<Proveedor> {
    @Override
    public java.awt.Component getListCellRendererComponent(JList<? extends Proveedor> list, Proveedor value, int index, boolean isSelected, boolean cellHasFocus) {
        return new javax.swing.JLabel(value.getNombre());
    }
}
