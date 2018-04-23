using System;
using System.Collections;


public partial class _Default : System.Web.UI.Page {

    protected void grid_DataBound(object sender, EventArgs e) {
        if(!IsPostBack) {
            grid.DetailRows.ExpandRow(0);
            grid.DetailRows.ExpandRow(2);
        }
    }
    protected void grid_CustomJSProperties(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewClientJSPropertiesEventArgs e) {
        Hashtable table = new Hashtable(grid.DetailRows.VisibleCount);
        for(int i = 0; i < grid.VisibleRowCount; i++) {
            if(grid.DetailRows.IsVisible(i))
                table[i] = true;
        }
        e.Properties["cpVisibleDetails"] = table;
    }
}
