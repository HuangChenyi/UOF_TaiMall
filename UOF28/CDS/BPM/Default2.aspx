<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="CDS_BPM_Default2" %>

<%@ Register Src="~/Common/Organization/DepartmentTree.ascx" TagPrefix="uc1" TagName="DepartmentTree" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" Runat="Server">
    <telerik:RadToolBar ID="toolBar"
        Width="100%"
        runat="server" OnButtonClick="toolBar_ButtonClick">
        <Items>
            <telerik:RadToolBarButton Value="Keyword">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="查詢日期"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpDateStart" runat="server"></telerik:RadDatePicker>
                            </td>
                            <td>
                                         <asp:Label ID="Label3" runat="server" Text="~"></asp:Label>
                        
                            </td>
                            <td>
                                 <telerik:RadDatePicker ID="rdpDateEnd" runat="server"></telerik:RadDatePicker>
                       
                            </td>
                        </tr>
                    </table>

                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton Text="查詢" Value="Query"
                ImageUrl="~/Common/Images/Icon/icon_m39.png"
                ></telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
           
                        <telerik:RadToolBarButton Text="刪除" Value="Delete"
                ImageUrl="~/Common/Images/Icon/icon_m39.png"
                ></telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
           
        </Items>
    </telerik:RadToolBar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" Runat="Server">
    <uc1:DepartmentTree runat="server" ID="DepartmentTree" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

    <table class="PopTable">
        <tr>
            <td>
                111
            </td>
            <td>
                222
            </td>
        </tr>
    </table>

</asp:Content>

