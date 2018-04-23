<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Example</title>
    <script type="text/javascript">
		function grid_RowDblClick(s, e) {
			var expanded = !!s.cpVisibleDetails[e.visibleIndex];
			alert(expanded ? "Expanded" : "Collapsed");
		}
    </script>
</head>
<body>
    <form id="form1" runat="server">
		<p>Double click a row to check its expanded state</p>
		
		<dx:ASPxGridView runat="server" ID="grid" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" KeyFieldName="CategoryID" OnCustomJSProperties="grid_CustomJSProperties" OnDataBound="grid_DataBound">
			<Columns>
				<dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="0" />
				<dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1" />
			</Columns>
			<SettingsDetail ShowDetailRow="True" />
			<Templates>
				<DetailRow>
					<%# Eval("Description") %>
				</DetailRow>
			</Templates>
			<ClientSideEvents RowDblClick="grid_RowDblClick" />
		</dx:ASPxGridView>
		
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT * FROM [Categories]"></asp:AccessDataSource>
    </form>
</body>
</html>
