Imports Microsoft.VisualBasic
Imports System
Imports System.Collections


Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub grid_DataBound(ByVal sender As Object, ByVal e As EventArgs)
		If (Not IsPostBack) Then
			grid.DetailRows.ExpandRow(0)
			grid.DetailRows.ExpandRow(2)
		End If
	End Sub
	Protected Sub grid_CustomJSProperties(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewClientJSPropertiesEventArgs)
		Dim table As New Hashtable(grid.DetailRows.VisibleCount)
		For i As Integer = 0 To grid.VisibleRowCount - 1
			If grid.DetailRows.IsVisible(i) Then
				table(i) = True
			End If
		Next i
		e.Properties("cpVisibleDetails") = table
	End Sub
End Class
