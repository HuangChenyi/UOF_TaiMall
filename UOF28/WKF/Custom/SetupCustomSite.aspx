﻿<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Customer_SetupCustomSite" Title="使用者自訂站點" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" CodeBehind="SetupCustomSite.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/WKF/FlowManagement/UC_SignDirections.ascx" TagPrefix="uc1" TagName="UC_SignDirections" %>
<%@ Register Src="~/WKF/Common/UC_CustomWordsChoice.ascx" TagPrefix="uc1" TagName="UC_CustomWordsChoice" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">

        Sys.Application.add_load(function () {
            rbCycleNotifyClick();
        });

        function rbCycleNotifyClick() {

            var rbCycleNotifyForm = $("#<%=rbCycleNotifyForm.ClientID%>");
            var rbCycleNotifySite = $("#<%=rbCycleNotifySite.ClientID%>");

            if ($("#<%= rbCycleNotifyForm.ClientID %>").is(":checked"))
                $("#divCycleNotifySite").hide();
            else
                $("#divCycleNotifySite").show();
        }
    </script>

    <table class="PopTable" cellspacing="1" width="100%">
        <tbody>
            <tr>
                <td style="height: 27px" class="PopTableHeader" align="center" colspan="4">
                    <center>
                        <asp:Label ID="lblSiteSignTitle" runat="server" meta:resourcekey="lblSiteSignTitleResource1" Text="使用者自訂站點"></asp:Label>
                    </center>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; height: 27px;" class="PopTableLeftTD">
                    <asp:Label ID="Label1" runat="server" Text="此站點是否可變更" meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
                <td style="width: 30%; height: 27px" class="PopTableRightTD" colspan="3">
                    <asp:RadioButton ID="rbYes" runat="server" Text="是" GroupName="canChange" meta:resourcekey="rbYesResource1"></asp:RadioButton>
                    <asp:RadioButton ID="rbNo" runat="server" Text="否" GroupName="canChange" Checked="True" meta:resourcekey="rbNoResource1"></asp:RadioButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSignType" runat="server" meta:resourcekey="lblSignTypeResource1" Text="簽核型態"></asp:Label>
                </td>
                <td style="white-space: nowrap">
                    <asp:RadioButton ID="rbSignTypeGeneral" runat="server" meta:resourcekey="rbSignType0Resource1"
                        Text="一般" GroupName="singType" Checked="True"></asp:RadioButton>

                    <asp:RadioButton ID="rbSignTypeOr" runat="server" meta:resourcekey="rbSignType1Resource1"
                        Text="並簽" GroupName="singType"></asp:RadioButton>

                    <asp:RadioButton ID="rbSignTypeAnd" runat="server" meta:resourcekey="rbSignType2Resource1"
                        Text="會簽" GroupName="singType"></asp:RadioButton>
                    <br />
                    <uc1:UC_SignDirections runat="server" ID="UC_SignDirections" />
                </td>

                <td style="width: 20%; height: 27px" class="PopTableLeftTD">
                    <asp:Label ID="lblTimeoutCount" runat="server" Text="逾時設定" meta:resourcekey="lblTimeoutCountResource1"></asp:Label>
                </td>
                <td style="height: 27px" class="PopTableRightTD">&nbsp;
                    
                    <telerik:RadNumericTextBox ID="tbTimeoutCount" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="tbTimeoutCountResource1">
                        <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"></NumberFormat>
                    </telerik:RadNumericTextBox>
                    <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="小時"></asp:Label>
                    <asp:Label ID="Label10" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label10Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; height: 27px">
                    <asp:Label ID="lblCycleAlert" runat="server" Text="簽核提醒頻率" meta:resourcekey="lblCycleAlertResource1"></asp:Label>
                </td>
                <td style="width: 30%; height: 27px">
                    <asp:RadioButton ID="rbCycleNotifyForm" runat="server" GroupName="CycleNotify" Text="繼承表單" onClick="rbCycleNotifyClick()" Checked="true"
                        meta:resourcekey="rbCycleNotifyFormResource1" />
                    <br />
                    <asp:RadioButton ID="rbCycleNotifySite" runat="server" GroupName="CycleNotify" Text="站點自訂" onClick="rbCycleNotifyClick()"
                        meta:resourcekey="rbCycleNotifySiteResource1" />
                    <br />
                    <div id="divCycleNotifySite" style="padding-left:15px;">
                        <telerik:RadNumericTextBox ID="txtCycleAlert" runat="server" Width="60px" MinValue="0" MaxValue="9999" MaxLength="4" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="txtCycleAlertResource1">
                            <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label5" runat="server" meta:resourcekey="Label2Resource1" Text="小時"></asp:Label>
                        <asp:Label ID="Label9" runat="server" Text="[0表示不提醒]" CssClass="SizeMemo" meta:resourcekey="Label9Resource1"></asp:Label>
                    </div>
                </td>
                <td style="width: 20%; height: 27px" class="PopTableLeftTD">
                    <asp:Label ID="Label6" runat="server" Text="自動送至下一站" meta:resourcekey="Label6Resource1"></asp:Label>
                </td>
                <td style="height: 27px" class="PopTableRightTD">&nbsp;
                    <telerik:RadNumericTextBox ID="txtAutoSign" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="txtAutoSignResource1">
                        <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"></NumberFormat>
                    </telerik:RadNumericTextBox>
                    <asp:Label ID="Label7" runat="server" meta:resourcekey="Label2Resource1" Text="小時"></asp:Label>
                    <asp:Label ID="Label8" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label8Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" style="width: 20%; height: 27px">
                    <asp:Label ID="lblGeneralSingers" runat="server" Text="簽核人員" meta:resourcekey="lblGeneralSingersResource2"></asp:Label>
                </td>
                <td class="PopTableRightTD" style="width: 30%; height: 27px" colspan="3">
                    <asp:CustomValidator ID="CustomValidatorSigner" runat="server" Display="Dynamic" meta:resourcekey="SignerCustomValidatorResource1"></asp:CustomValidator>
                    <uc1:UC_ChoiceList ID="UC_ChoiceList_Sign" runat="server" ShowMember="False" />
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" style="width: 20%; height: 27px">
                    <asp:Label ID="lblGeneralAlerter" runat="server" Text="簽核前知會人員" meta:resourcekey="lblGeneralAlerterResource1"></asp:Label></td>
                <td class="PopTableRightTD" style="height: 27px">
                    <uc1:UC_ChoiceList ID="UC_ChoiceList_Alert" runat="server" ShowMember="False" />
                </td>

                <td class="PopTableLeftTD">
                    <asp:Label ID="Label3" runat="server" Text="簽核後知會人員" meta:resourcekey="Label3Resource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <uc1:UC_ChoiceList ID="UC_ChoiceList_SignedAlter" runat="server" ShowMember="False" />
                </td>
            </tr>
            <tr id="trCustomWords" runat="server">
                <td>
                    <asp:Label ID="lblCustomWords" runat="server" Text="簽核字詞" meta:resourcekey="lblCustomWordsResource1"></asp:Label>
                </td>
                <td colspan="3">
                    <uc1:UC_CustomWordsChoice runat="server" ID="UC_CustomWordsChoice" />
                </td>
            </tr>
        </tbody>
    </table>
    <asp:Label ID="lblRequireMsg" runat="server" Text="請選擇簽核人員!" Visible="False" meta:resourcekey="lblRequireMsgResource1"></asp:Label>
    <asp:Label ID="lblOutOfRangeMsg" runat="server" Text="一般簽核型態，簽核人員只能有一人!" Visible="False" meta:resourcekey="lblOutOfRangeMsgResource1"></asp:Label>
    <br />
    &nbsp;
    <asp:Label ID="lblComment" runat="server" Text="註：此為觀看頁面，若要修改站點資訊，請至「設定自訂流程」維護。" Visible="False" meta:resourcekey="lblCommentResource1"></asp:Label>
</asp:Content>
