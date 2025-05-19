<%@ Page Title="維護刷卡範圍" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="PunchPositionRangeEdit.aspx.cs" Inherits="EIP_Duty_Punch_PunchPositionRangeEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <asp:Label ID="lblAuthAlredayRemove" runat="server" Text="維護權限已被移除，請重新登入系統" ForeColor="Red" Visible="False" meta:resourcekey="lblAuthAlredayRemoveResource1"></asp:Label>

    <table id="tbMain" runat="server" class="PopTable">
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="名稱" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" MaxLength="10" Width="100%" meta:resourcekey="txtNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不允許空白" ControlToValidate="txtName" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="範圍半徑(公尺)" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rnumRange" runat="server" Width="65px" NumberFormat-DecimalDigits="0" ClientEvents-OnValueChanged="setCircleRadius"  MinValue="10" MaxValue="999999" MaxLength="6" Value="50" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="rnumRangeResource1">
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label7" runat="server" Text="半徑最小限制為10公尺" CssClass="SizeMemo" meta:resourcekey="Label7Resource1"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不允許空白" ControlToValidate="rnumRange" Display="Dynamic" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblStatus" runat="server" Text="狀態" meta:resourcekey="lblStatusResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:CheckBox ID="cbActive" Checked="true" runat="server" />
                <asp:Label ID="lblActive" runat="server" Text="啟用" meta:resourcekey="lblActiveResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label5Resource1"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="人員" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ShowMember="false" ExpandToUser="false" />
                        <asp:HiddenField ID="hfUserSetCount" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請選擇人員" ClientValidationFunction="CheckPositionPerson" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            </td>
        </tr>
    </table>
     <telerik:RadToolBar ID="RadToolBar1" runat="server" SingleClick="None" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton Value="address" meta:resourcekey="RadToolBarButtonResource1">
                <ItemTemplate>
                    <telerik:RadTextBox ID="txtAddress" runat="server" Width="300px" meta:resourcekey="txtAddressResource1" ClientEvents-OnKeyPress="onAddressEntered"></telerik:RadTextBox>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="搜尋" ImageUrl="~/Common/Images/Icon/icon_m39.gif" Value="queryAddress" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
             <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton Value="addressErr" meta:resourcekey="RadToolBarButtonResource4">
                <ItemTemplate>
                     <asp:Label ID="lblRemark" runat="server" Text="可輸入地點或地址"  CssClass="SizeMemo" meta:resourcekey="lblSearchRemarkResource1"></asp:Label>

                    <asp:Label ID="lblError" runat="server" ForeColor="Red" meta:resourcekey="lblErrorResource1"></asp:Label>
                </ItemTemplate>
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="無法取得經緯度，請重新定位" ClientValidationFunction="CheckLatLng" Display="Dynamic" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    
    <asp:HiddenField ID="hfLat" runat="server" />
    <asp:HiddenField ID="hfLng" runat="server" />
    <asp:HiddenField ID="hfTimeZone" runat="server" />
    <asp:HiddenField ID="hfPunchPositionGuid" runat="server" />
    <asp:Label ID="lblAddressError" runat="server" Text="無法取得地址經緯度，錯誤代碼:" ForeColor="Red" Visible="False" meta:resourcekey="lblAddressErrorResource1"></asp:Label>

    <div id="map" style="width:100%; height:76%"></div>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
    <script type="text/javascript">

        Sys.Application.add_load(function () {
            if ($("#<%=hfLat.ClientID %>").val() && $("#<%=hfLng.ClientID %>").val()) {
                createMap($("#<%=hfLat.ClientID %>").val(), $("#<%=hfLng.ClientID %>").val());
            } else {
                createMap(22.604206, 120.298395);
            }
        });

        var map;
        var isRangeChange = false;
        var circle;
        var mIcon;

        function onAddressEntered(sender, arg) {
            if (arg.get_keyCode() === 13)
                addressTransform(sender.get_textBoxValue());
        }


        function createMap(lat, lng) {
            if (!map) {
                var range = $find("<%= rnumRange.ClientID %>").get_value();
                map = L.map('map', {
                    zoomControl: false,
                    attributionControl: false
                }).setView([lat, lng], 18);

                tile = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    maxZoom: 19,
                    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
                }).addTo(map);

                circle = L.circle([lat, lng], { radius: range }).addTo(map);
                mIcon = L.icon({
                    iconUrl: '<%=siteUrl%>' +'/common/images/icon/icon_map_location.png',
                    iconSize: [35, 32],
                    iconAnchor: [17, 32],
                });
                marker = L.marker([lat, lng], { icon: mIcon }).addTo(map);
            }
        }
       
        /**
         *設定範圍大小(unit: M)
         */
        function setCircleRadius(e,args) {
            circle.setRadius($find("<%= rnumRange.ClientID %>").get_value());
        }

        function RadToolBar1_ButtonClicking(sender, args) {
            var itemValue = args.get_item().get_value();
            var toolbarbutton = sender.findItemByValue("address");
            var address = $telerik.findElement(toolbarbutton.get_element(), ("txtAddress")).value;

            args.set_cancel(true);
            if (itemValue === "queryAddress") {
                addressTransform(address);
            }
        }

        function addressTransform(address) {

            var data = [address];
            result = $uof.pageMethod.sync("GetGeoCode", data);
            var arrResult = result.split(',');
            if (arrResult.length > 1) {
                if (arrResult[0] === "err") {
                    alert("<%=lblAddressError.Text%>" + arrResult[1]);
                }
                else {
                    $("#<%=hfLat.ClientID %>").val(arrResult[0]);
                    $("#<%=hfLng.ClientID %>").val(arrResult[1]);
                    map.setView([arrResult[0], arrResult[1]], 18);
                    var latlng = L.latLng([arrResult[0], arrResult[1]]);
                    circle.setLatLng(latlng);
                    marker.setLatLng(latlng);
                }
            }
        }

        function CheckPositionPerson(sender, args) {
            if ($("#<%= hfUserSetCount.ClientID %>").val()) {

                if (Number($("#<%= hfUserSetCount.ClientID %>").val()) <= 0) {
                    args.IsValid = false;
                    return;
                }
            }
            else {
                args.IsValid = false;
                return;
            }
        }

        function CheckLatLng(sender,args) {
            if (!$("#<%= hfLat.ClientID %>").val() || !$("#<%= hfLng.ClientID %>").val()) {
                args.IsValid = false;
                return;
            }
        }
    </script>
</asp:Content>
