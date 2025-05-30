﻿<%@ Page Title="基本設定" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="BasicSetting.aspx.cs" Inherits="Ede.Uof.Web.Edoc.Management.BasicSetting" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function OnContactClicking(sender, args) {
            if (args.get_item().get_value() == "Create") {
                args.set_cancel(true);
                $uof.dialog.open2("~/Edoc/Management/UClientUnitDialog.aspx", args.get_item(), '<%=lblCreateUnit.Text%>', 600, 400, openDialogResult, { "TYPE": "Add" });
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }


    </script>

    <style type="text/css">
        .cssHidden {
            display: none;
        }

        .cssCenter {
            text-align: center !important;
        }

        .lbtnUpPadding {
            padding-left: 5px;
            width: 65px;
        }
    </style>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="PopTable">
                <tr>
                    <td colspan="2" class="PopTableHeader" style="white-space: nowrap;">
                        <asp:Label ID="Label3" runat="server" Text="收發文機關設定"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: middle; white-space: nowrap;">
                        <asp:Label ID="Label4" runat="server" Text="UOF eDoc Client驅動模式"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbBlockTypeAll" runat="server" Checked="false" GroupName="blockType" Text="所有機關共用一台Client" OnCheckedChanged="rbBlockType_CheckedChanged" AutoPostBack="true" /><br />
                        <asp:RadioButton ID="rbBlockTypeSingle" runat="server" Checked="false" GroupName="blockType" Text="每個機關獨立啟動專屬的Client" OnCheckedChanged="rbBlockType_CheckedChanged" AutoPostBack="true" />
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: middle; white-space: nowrap;">
                        <asp:Label ID="Label1" runat="server" Text="收發文機關"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadToolBar ID="rtbBasicSetting" runat="server" Width="100%" OnButtonClick="rtbEditOrg_ButtonClick" OnClientButtonClicking="OnContactClicking">
                            <Items>
                                <telerik:RadToolBarButton Text="新增" Value="Create" ID="rtbbCreate" CheckedImageUrl="~/Common/Images/Icon/icon_m71.png"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m71.png" HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                                    ImageUrl="~/Common/Images/Icon/icon_m71.png" runat="server">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sKeyword" />
                                <telerik:RadToolBarButton>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m132.gif" />
                                        <asp:Label ID="Label6" runat="server" Text="：啟用" ForeColor="Blue"></asp:Label>
                                        &nbsp;
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/Images/Icon/icon_m141.gif" />
                                        <asp:Label ID="Label7" runat="server" Text="：停用" ForeColor="Blue"></asp:Label>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>


                        <Ede:Grid ID="grdUClientUnit" runat="server" DataKeyNames="ORG_ID" Width="90%"
                            EmptyDataText="沒有資料"
                            AutoGenerateColumns="False"
                            AutoGenerateCheckBoxColumn="False"
                            OnRowDataBound="grdUClientUnit_RowDataBound"
                            CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" KeepSelectedRows="False"
                            SelectedRowColor="" UnSelectedRowColor="">
                            <EnhancePagerSettings ShowHeaderPager="True" />
                            <HeaderStyle Wrap="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="狀態">
                                    <HeaderStyle Width="5%" />
                                    <ItemStyle CssClass="cssCenter" />
                                    <ItemTemplate>
                                        <asp:Image ID="imgStatus" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="機關代碼">
                                    <HeaderStyle Width="15%" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnOrgId" Text="" OnClick="lbtnOrgId_Click" runat="server"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" HorizontalAlign="Left" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="機關名稱">
                                    <HeaderStyle Width="60%" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrgName" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" HorizontalAlign="Left" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="收發模式">
                                    <HeaderStyle Width="10%" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblActionType" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" HorizontalAlign="Left" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="排序">
                                    <HeaderStyle Width="15%" />
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <div class="lbtnUpPadding">
                                                        <asp:Image ID="imgup" ImageUrl="~/Common/Images/Icon/icon_m113.gif" runat="server" />
                                                        <asp:LinkButton ID="lbtnup" Text="上移" OnClick="btnup_Click" runat="server"></asp:LinkButton>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <asp:Image ID="imgdown" ImageUrl="~/Common/Images/Icon/icon_m114.gif" runat="server" />
                                                        <asp:LinkButton ID="lbtndown" Text="下移" OnClick="btndown_Click" runat="server"></asp:LinkButton>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" HorizontalAlign="Left" />
                                </asp:TemplateField>

                            </Columns>
                        </Ede:Grid>

                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="PopTableHeader" style="white-space: nowrap;">
                        <asp:Label ID="Label6" runat="server" Text="受文機關通訊錄"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: middle;">
                        <asp:Label ID="Label7" runat="server" Text="通訊錄"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadButton ID="rbImport" runat="server" Text="匯入" OnClick="rbImport_Click"></telerik:RadButton>
                        <asp:Label ID="lblImportMsg" runat="server"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:Label ID="lblImportDate" runat="server" ForeColor="Blue"></asp:Label>
                        <br />
                        <asp:Label ID="Label8" ForeColor="Blue" Text="若需更新通訊錄，請至https://data.gov.tw 政府資料開放平臺下載「公文電子交換系統地址簿」或「Web版公文製作之全國通訊錄」後重新匯入。" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="PopTableHeader" style="white-space: nowrap;">
                        <asp:Label ID="Label11" runat="server" Text="發文設定"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: middle;">
                        <asp:Label ID="Label2" runat="server" Text="發文字號取號設定"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbEdocNumberGetStart" runat="server" Checked="false" GroupName="edocNumberGet" Text="電子發文申請單送出申請後自動取號" OnCheckedChanged="rbEdocNumberGet_CheckedChanged" AutoPostBack="true" /><br />
                        <asp:RadioButton ID="rbEdocNumberGetEnd" runat="server" Checked="false" GroupName="edocNumberGet" Text="電子發文申請單核准結案後自動取號" OnCheckedChanged="rbEdocNumberGet_CheckedChanged" AutoPostBack="true" />
                         <br />
                        <asp:Label ID="Label5" ForeColor="Blue" Text="1.發文字號編號規則：收發文機關字號類別(自訂)+年度(3碼)+流水號(7碼)，EX.發文字第1120000001號" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="Label9" ForeColor="Blue" Text="2.取號後不可變更發文字號，包含字號類別及年度" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                     <td style="vertical-align: middle;">
                        <asp:Label ID="Label10" runat="server" Text="發文日期"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="cbEdocSendDateUpdate" runat="server" Text="允許機關管理員變更公文發文日期" OnCheckedChanged="cbEdocSendDateUpdate_CheckedChanged" AutoPostBack="true" />                        
                         <br />
                        <asp:Label ID="Label13" ForeColor="Blue" Text="勾選後，機關管理員可修改尚未產生公文電子交換檔案的公文發文日期" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>

            <asp:HiddenField ID="hfOrderCount" runat="server" />

            <asp:Label ID="lblDialogTitle" runat="server" Text="匯入通訊錄" Visible="false"></asp:Label>
            <asp:Label ID="lblOk" runat="server" Text="確定" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblErrorTitle" runat="server" Text="錯誤訊息" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblRegisterOk" runat="server" Text="設定成功" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblImportSuccess" runat="server" Text="已成功匯入" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblImportCount" runat="server" Text="筆" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblNotImportData" runat="server" Text="匯入檔案中無新增的機關" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblLatestImportDate" runat="server" Text="最後更新時間：" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblImportFailedBlank" runat="server" Text="機關名稱或機關代碼欄位空白，無法匯入" Visible="false"></asp:Label>
            <asp:Label ID="lblImportFailedPrimaryKey" runat="server" Text="機關代碼重複，無法匯入" Visible="false"></asp:Label>

            <asp:Label ID="lblCreateUnit" runat="server" Text="新增收發文機關" Visible="false"></asp:Label>
            <asp:Label ID="lblEditUnit" runat="server" Text="維護收發文機關" Visible="false"></asp:Label>
            <asp:Label ID="lblActionTypeAuto" runat="server" Text="串接系統" Visible="false"></asp:Label>
            <asp:Label ID="lblActionTypeWebjAgent" runat="server" Text="WebjAgent" Visible="false"></asp:Label>
            <asp:Label ID="lblMail" runat="server" Text="郵寄" Visible="false"></asp:Label>
            <asp:Label ID="lblOrdNotFound" runat="server" Text="通訊錄中無此機關" Visible="false"></asp:Label>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        var settingMsgObj = $eDoc.msgObj.getCommonMsg();
    </script>

</asp:Content>
