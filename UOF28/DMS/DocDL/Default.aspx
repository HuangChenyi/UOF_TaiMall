﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/DefaultMasterPage.master" Inherits="DMS_DocDL_Default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="Default.aspx.cs" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .hidden {
            display:none;
        }
    </style>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="Label1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">

            // 2012-5-25 ELTON, change to FileCenterV2 and use dialog to view PDF
            function OpenPDFViewerWithFileCenterV2(sJson, appPath) {
                var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                openWinNavigateUrl(sJson);
            }

            function displayTrigger() { }

            function OpenContentDoc(docID, status, docversion) {

                $uof.dialog.open2("~/DMS/DocStore/DocDownLoad.aspx", this, "", 0, 0, function (returnValue) {
                    $uof.dialog.close();
                    return false;
                }, { "docid": docID, "status": status, "ver": docversion });
            }

            function openWinNavigateUrl(sJson) {
                var h = $uof.tool.printScreenSize('h', screen.availHeight);
                var w = $uof.tool.printScreenSize('w', screen.availWidth);
                $uof.window.open("../DocStore/PdfViewerSL.aspx?p=" + encodeURIComponent(sJson), w, h); 

                //直接window.close()的話因為程式跑太快了，語法無法生效，所以需要Timeout一秒時間
                setTimeout(() => {
                    ClosePage();
                }, "1000");
            }

            function NoAuth() {
                if ($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hfFromAuthPage.Value,true)%>') === 'True') {
                    ClosePage();
                }
                else {
                    $('#' + '<%=btnRedirect.ClientID%>').click();
                }
            }

            function ClosePage() {
                window.close();
            }

            function OpenUDocViewer(sJson, docid, docversion, status) {
                var data = [$uof.tool.htmlDecode(docid), $uof.tool.htmlDecode(docversion), $uof.tool.htmlDecode(status)];
                $uof.pageMethod.syncUc("DMS/DocStore/UC_DMSDoc.ascx", "StatisticsViewCount", data);
                $uof.uDocViewer.open(sJson);
            }
        </script>

    </telerik:RadCodeBlock>

    <asp:Button ID="btnRedirect" runat="server" Text="Redirect" CssClass="hidden" OnClick="btnRedirect_Click" />
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="累計下載次數發生錯誤" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <input id="hdAppPath" runat="server" style="width: 35px" type="hidden" />
    <asp:HiddenField ID="hfFromAuthPage" runat="server" />

    <asp:Label ID="lblNotFindVer" runat="server" Text="此版本已不存在" Visible="False" meta:resourcekey="lblNotFindVerResource1"></asp:Label>
    <asp:Label ID="lblNoPublish" runat="server" Text="此文件尚未有公佈版本，無法下載" Visible="False" meta:resourcekey="lblNoPublishResource1"></asp:Label>
    <asp:Label ID="labFileError" runat="server" ForeColor="Red" Text="發生錯誤，檔案不存在！" Visible="False" meta:resourcekey="labFileErrorResource1"></asp:Label>
    <asp:Label ID="labAlert" runat="server" Text="目前無法觀看此檔案，正在進行PDF檔案轉換!" ForeColor="Red" Visible="False" meta:resourcekey="labAlertResource1"></asp:Label>
    <asp:Label ID="labDlFile" runat="server" ForeColor="Black" Text="請按下載...來讀取此份文件......" meta:resourcekey="labDlFileResource1" Visible="False"></asp:Label>
    <asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Red" Text="發生錯誤，轉換PDF失敗！" Visible="False" meta:resourcekey="labPDFConvertERRORResource"></asp:Label>
    <asp:Label ID="labPDFError" runat="server" ForeColor="Red" Text="尚未完成 或 已發生錯誤..." meta:resourcekey="labPDFErrorResource1" Visible="False"></asp:Label>
    <asp:Label ID="labWait" runat="server" ForeColor="Red" Text="請稍待，文件下載處理中..." Visible="False" meta:resourcekey="labWaitResource1"></asp:Label>
    <asp:Label ID="lblNoDownload" runat="server" ForeColor="Red" Text="權限不足無法下載" Visible="False" meta:resourcekey="lblNoDownloadResource1"></asp:Label>
    <asp:Label ID="lblNowApprove" runat="server" Text="此文件版本正在審核中，無法下載" meta:resourcekey="lblNowApproveResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblInactive" runat="server" Text="此文件已失效，無法下載" Visible="False" meta:resourcekey="lblInactiveResource1"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" Text="此文件已作廢，無法下載" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
    <asp:Label ID="lblTempInact" runat="server" Text="此文件版本已下架，無法下載" Visible="False" meta:resourcekey="lblTempInactResource1"></asp:Label>
    <asp:Label ID="lblNeverPublish" runat="server" Text="文件未曾公佈過，無法下載" meta:resourcekey="lblNeverPublishResource1" Visible="False"></asp:Label>
    <asp:Label ID="lbllblNotFindDoc" runat="server" Text="此文件已不存在" meta:resourcekey="lbllblNotFindDocResource1" Visible="False"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False"></asp:Label>
    <asp:Label ID="lblDocSerial" runat="server" Text="文件編號：" Visible="false" meta:resourcekey="lblDocSerialResource1"></asp:Label>
    <asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="false" meta:resourcekey="lblManualVersionResource1"></asp:Label>
    <asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="false" meta:resourcekey="lblPrintUserResource1"></asp:Label>
    <a id="atag" style="display:none;">Run UDoc Viewer</a>
</asp:Content>

