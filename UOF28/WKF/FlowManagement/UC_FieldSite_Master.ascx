﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_UC_FieldSite_Master" Codebehind="UC_FieldSite_Master.ascx.cs" %>
<%@ 
    Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<script type="text/javascript" id="telerikClientEvents1">
    function WebImageButton_DeleteSite_Clicking(sender, args) {
        args.set_cancel(!confirm('<%=lblDelete.Text %>?'));
    }
</script>

<script id="menujs" type="text/javascript">
    function UltraWebMenu1_ItemClick(menuId, itemId) {
        alert(igmenu_getItemById(itemId).getText());
    }
</script>

<div style="text-align: center">
    <table border="0" cellpadding="0" cellspacing="0" width="90%" style="margin: 0px auto; ">
        <tr>
            <td align="center" style="height: 30px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m54.gif" meta:resourcekey="Image1Resource1" /></td>
        </tr>
        <tr>
            <td>
                <div style="text-align: center">
                    <table border="0" cellpadding="1" cellspacing="1" class="PopTable" width="500px">
                        <tr>
                            <td width="166px" class="PopTableLeftTD" style="height: 24px; text-align: center;" colspan="2">
                                <asp:Label ID="lbSignType" runat="server" meta:resourcekey="lbSignTypeResource1" Text="型態"></asp:Label>
                            </td>
                            <td width="167px" class="PopTableLeftTD" style="height: 24px; text-align: center;" colspan="2">
                                <asp:Label ID="Label3" runat="server" Text="可否修改" meta:resourcekey="Label3Resource1"></asp:Label>
                            </td>
                            <td width="166px" class="PopTableLeftTD" style="height: 24px; text-align: center;" colspan="2">
                                <asp:Label ID="lblTimeoutTitle" runat="server" Text="逾時" meta:resourcekey="lblTimeoutTitleResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="PopTableRightTD" style="height: 36px; text-align: center;" colspan="2">
                                <asp:Label ID="LblSiteType" runat="server" meta:resourcekey="LblSiteTypeResource1"></asp:Label>
                            </td>
                            <td align="center" class="PopTableRightTD" style="height: 36px; text-align: center;" colspan="2">
                                <asp:Image ID="imgIsMoidfiable" runat="server" meta:resourcekey="imgIsMoidfiableResource1" />
                            </td>
                            <td align="center" class="PopTableRightTD" style="height: 36px; text-align: center;" colspan="2">
                                <asp:Label ID="lblTimeOut" runat="server" meta:resourcekey="lblTimeOutResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="height: 24px; text-align: center;" colspan="6" width="250px">
                                <asp:Label ID="lbGeneralSigner" runat="server" Text="表單欄位簽核" meta:resourcekey="lbGeneralSignerResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableRightTD" valign="top" style="text-align: center;" colspan="6" width="250px">
                                <asp:Label ID="lblSigner" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="PopTableLeftTD" style="height: 24px" colspan="3">
                                <div align="center">
                                    <asp:Label ID="Label1" runat="server" Text="簽核前知會" meta:resourcekey="Label1Resource1"></asp:Label>
                                </div>
                            </td>
                            <td align="center" class="PopTableLeftTD" style="height: 24px" width="25%" colspan="3">
                                <div align="center">
                                    <asp:Label ID="Label5" runat="server" Text="簽核後知會" meta:resourcekey="Label5Resource1"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableRightTD" style="vertical-align: top; text-align: center" colspan="3" >                                   
                                <Fast:Grid ID="gridSignAlter" runat="server" Width="100%"  
                                           DataKeyNames="NOTIFY_ID"  AutoGenerateCheckBoxColumn="False"
                                           DataKeyOnClientWithCheckBox="True" EnhancePager="True" PageSize="15" AutoGenerateColumns="False"
                                           AllowSorting="True" DefaultSortDirection="Ascending" OnRowDataBound="gridSignAlter_RowDataBound"
                                           EmptyDataText="沒有資料" KeepSelectedRows="False"
                                           meta:resourcekey="gridSignAlterResource1" >
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:BoundField DataField="COND_ID" HeaderText="條件" meta:resourcekey="BoundFieldResource1" >
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle Width="100px" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="特殊知會" meta:resourcekey="TemplateFieldResource1">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle Width="125px" HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblSpecialAlter" runat="server" meta:resourcekey="lblSpecialAlterResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="一般知會" meta:resourcekey="TemplateFieldResource2">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <uc1:UC_ChoiceList ID="uc_Alter" IsAllowEdit="false" runat="server" ShowMember="False" ExpandToUser="False" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                            </td>
                            <td class="PopTableRightTD" style="vertical-align: top; text-align: center" colspan="3">
                                <Fast:Grid ID="gridSignedAlter" runat="server" Width="100%" 
                                     DataKeyNames="NOTIFY_ID"  AutoGenerateCheckBoxColumn="False"
                                    DataKeyOnClientWithCheckBox="True" EnhancePager="True" PageSize="15" AutoGenerateColumns="False"
                                    AllowSorting="True" DefaultSortDirection="Ascending" OnRowDataBound="gridSignedAlter_RowDataBound"
                                    EmptyDataText="沒有資料" KeepSelectedRows="False"
                                    meta:resourcekey="gridSignedAlterResource1">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:BoundField DataField="COND_ID" HeaderText="條件" meta:resourcekey="BoundFieldResource1" >
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle Width="100px" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="特殊知會" meta:resourcekey="TemplateFieldResource1">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle Width="125px" HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblSpecialAlter" runat="server" meta:resourcekey="lblSpecialAlterResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="一般知會" meta:resourcekey="TemplateFieldResource2">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <uc1:UC_ChoiceList ID="uc_Alter" IsAllowEdit="false" runat="server" ShowMember="False" ExpandToUser="False" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                            </td>
                        </tr>
                    </table>
                    <table align="right" cellpadding="0" cellspacing="0" style="width:100%" >
                        <tr>
                            <td style="text-align: right; width: 100%">
                                <table style="width:100%" >
                                    <tr>
                                        <td style="width: 1%">&nbsp;</td>
                                        <td style="text-align:right" >
                                            <telerik:RadButton ID="WebImageButton_UPSite" runat="server" 
                                                Text="↑" Width="20px" meta:resourcekey="WebImageButton_UPSiteResource1" OnClick="WebImageButton_UPSite_Click1"></telerik:RadButton>
                            
                                            <telerik:RadButton ID="WebImageButton_DownSite" runat="server" 
                                                Text="↓" Width="20px" meta:resourcekey="WebImageButton_DownSiteResource1" OnClick="WebImageButton_DownSite_Click1"></telerik:RadButton>
                                       
                                            <telerik:RadButton ID="WebImageButton_InsertSite" runat="server" 
                                                meta:resourcekey="WebImageButton_InsertSiteResource1" OnClick="WebImageButton_InsertSite_Click1"></telerik:RadButton>
                             
                                            <telerik:RadButton ID="WebImageButton_ModifySite" runat="server"
                                                 meta:resourcekey="WebImageButton_ModifySiteResource1"></telerik:RadButton>
                               
                                            <telerik:RadButton ID="WebImageButton_DeleteSite" runat="server" 
                                                meta:resourcekey="WebImageButton_DeleteSiteResource1" OnClientClicking="WebImageButton_DeleteSite_Clicking" OnClick="WebImageButton_DeleteSite_Click1"></telerik:RadButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblSite" runat="server" Text="插入站點" Visible="False" meta:resourcekey="lblSiteResource1"></asp:Label>
    <asp:Label ID="lblSet" runat="server" Text="設定" Visible="False" meta:resourcekey="lblSetResource1"></asp:Label>
    <asp:Label ID="lblDeleteSite" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDeleteSiteResource1"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" Text="確定刪除站點?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblGeneral" runat="server" Text="一般" Visible="False" meta:resourcekey="lblGeneralResource1"></asp:Label>
    <asp:Label ID="lblAnd" runat="server" Text="並簽" Visible="False" meta:resourcekey="lblAndResource1"></asp:Label>
    <asp:Label ID="lblOr" runat="server" Text="會簽" Visible="False" meta:resourcekey="lblOrResource1"></asp:Label>
    <asp:Label ID="lblAssign" runat="server" Text="指定" Visible="False" meta:resourcekey="lblAssignResource1"></asp:Label>
    <asp:Label ID="lblStartSigner" runat="server" Text="流程起始人員" Visible="False" meta:resourcekey="lblStartSignerResource1"></asp:Label>
    <asp:Label ID="lblApplyer" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblApplyerResource1"></asp:Label>
    <asp:Image ID="imgSiteType" runat="server" Visible="False" meta:resourcekey="imgSiteTypeResource1" />
    <asp:Label ID="lblJumpTitle" runat="server" Text="跳簽" Visible="False" meta:resourcekey="lblJumpTitleResource1"></asp:Label>
    <asp:Image ID="imgIsJump" runat="server" Visible="False" ImageUrl="~/Common/Images/Icon/icon_m49.gif" meta:resourcekey="imgIsJumpResource1" />
    <asp:Label ID="lblFlowEndTitle" runat="server" Text="結束" Visible="False" meta:resourcekey="lblFlowEndTitleResource1"></asp:Label>
    <asp:Label ID="lbAdditionalSignTitle" runat="server" Text="加簽" Visible="False" meta:resourcekey="lbAdditionalSignTitleResource1"></asp:Label>
    <asp:Image ID="imgIsFlowEnd" runat="server" Visible="False" meta:resourcekey="imgIsFlowEndResource1" />
    <asp:Image ID="imgIsAddSign" runat="server" Visible="False" meta:resourcekey="imgIsAddSignResource1" />
    <asp:Label ID="lblLastSiteAgent" runat="server" Text="上一站點代理人" Visible="False" meta:resourcekey="lblLastSiteAgentResource1"></asp:Label>
    <asp:Label ID="lblApplyerSuperiorSign" runat="server" Text="申請者直屬主管" Visible="False" meta:resourcekey="lblApplyerSuperiorSignResource1"></asp:Label>
    <asp:Label ID="lblLastSuperiorSign" runat="server" Text="上一站直屬主管" Visible="False" meta:resourcekey="lblLastSuperiorSignResource1"></asp:Label>
    <asp:Label ID="lblDefault" runat="server" Text="其他" Visible="False" meta:resourcekey="lblDefaultResource1"></asp:Label>
    <telerik:RadTreeView ID="treeCondition" runat="server" Visible="False" meta:resourcekey="treeConditionResource2"></telerik:RadTreeView>
</div>