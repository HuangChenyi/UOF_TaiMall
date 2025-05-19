<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetDocInfoWatermark.aspx.cs" Inherits="Ede.Uof.Web.DMS.Admin.SetDocInfoWatermark" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table style="width: 100%; height: 540px; vertical-align: top" border="0">
    <tr>
        <td rowspan="2" style="text-align: left; vertical-align: top; width: 50%">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <contenttemplate>
                    <table border="1"  class="PopTable" style="width:100%; height:540px;">
                        <tr>
                            <td style="text-align:center;vertical-align:middle"  >
                                <asp:Label ID="Label1" runat="server" Text="已選擇的欄位" 
                                    meta:resourcekey="lblTitle1Resource1"></asp:Label>  
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableRightTD" style="text-align:left;width:100%;height:440px;vertical-align:top" >   
                                <telerik:RadTreeView ID="rtvSelected" Runat="server" height="500px"
                                    EnableDragAndDrop="true"
                                    OnNodeDrop="rtvSelected_NodeDrop"
                                    AllowDragAndDrop="true">
                                </telerik:RadTreeView>
                            </td>
                        </tr>
                    </table>
                </contenttemplate>
                <triggers>                    
                    <asp:AsyncPostBackTrigger ControlID="btn_Add" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btn_Delete" EventName="Click" />
                </triggers>
            </asp:UpdatePanel>
        </td>
        <td style="vertical-align:middle">
            <td  style="min-width:50px;vertical-align:middle;text-align:center">
                <telerik:RadButton ID="btn_Add" runat="server" CausesValidation="False" 
                    meta:resourcekey="btn_AddResource1" Text="<--" OnClick="btn_Add_Click"></telerik:RadButton>
                &nbsp;
                <br />
                <br />
                <telerik:RadButton ID="btn_Delete" runat="server"  
                    meta:resourcekey="btn_DeleteResource1" Text="-->" OnClick="btn_Delete_Click"></telerik:RadButton>
            </td>
        </td>
        <td rowspan="2" style="vertical-align:top;width:50%;text-align:left">
            <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                <contenttemplate>
                    <table border="1"  class="PopTable" style="width:100%; height:540px;">
                        <tr>
                            <td style="text-align:center;vertical-align:middle"  >
                                <asp:Label ID="lblTitle2" runat="server" Text="可選擇的欄位列表" 
                                    meta:resourcekey="lblTitle2Resource1"></asp:Label>  
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableRightTD" style="text-align:left;width:100%;height:440px;vertical-align:top" >   
                                <telerik:RadTreeView ID="rtvAvailable" runat="server" Height="500px">

                                </telerik:RadTreeView> 
                            </td>
                        </tr>
                    </table>
                </contenttemplate>
                <triggers>                    
                    <asp:AsyncPostBackTrigger ControlID="btn_Add" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btn_Delete" EventName="Click" />
                </triggers>
            </asp:UpdatePanel>
        </td>
    </tr>
</table>

<asp:HiddenField ID="hfWatermarkSetting" runat="server" />
<asp:Label ID="lbNoSelectedItemWarning" runat="server" Text="請選擇浮水印設定項目" Visible="False" meta:resourcekey="lbNoSelectedItemWarningResource1"></asp:Label>
<asp:Label ID="lblDocNo" runat="server" Text="文件編號" Visible="False" meta:resourcekey="lblDocNoResource"></asp:Label>
<asp:Label ID="lblDocName" runat="server" Text="文件名稱" Visible="False" meta:resourcekey="lblDocNameResource"></asp:Label>
<asp:Label ID="lblSecLevel" runat="server" Text="機密等級" Visible="False" meta:resourcekey="lblSecLevelResource"></asp:Label>
<asp:Label ID="lblVersion" runat="server" Text="版本" Visible="False" meta:resourcekey="lblVersionResource"></asp:Label>
<asp:Label ID="lblEffDate" runat="server" Text="生效日" Visible="False" meta:resourcekey="lblEffDateResource"></asp:Label>
<asp:Label ID="lblIssUnit" runat="server" Text="發行單位" Visible="False" meta:resourcekey="lblIssUnitResource"></asp:Label>
<asp:Label ID="lblPubDate" runat="server" Text="公佈日" Visible="False" meta:resourcekey="lblPubDateResource"></asp:Label>
<asp:Label ID="lblSysDate" runat="server" Text="系統日期" Visible="False" meta:resourcekey="lblSysDateResource"></asp:Label>
<asp:Label ID="lblSysPath" runat="server" Text="文件路徑" Visible="False" meta:resourcekey="lblSysPathResource"></asp:Label>

</asp:Content>
