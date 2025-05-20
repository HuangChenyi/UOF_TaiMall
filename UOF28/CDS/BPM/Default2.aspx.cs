using Ede.Uof.EIP.SystemInfo;
using Ede.Uof.Utility.Page;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class CDS_BPM_Default2 : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((Master_TwoColumn)this.Master).LeftTitle = "ABC";

        DepartmentTree.NodeOnClick += DepartmentTree_NodeOnClick;

        if(!IsPostBack)
        {
            GetRadDatePicker("rdpDateStart").SelectedDate=DateTime.Today.AddDays(-7);
            GetRadDatePicker("rdpDateEnd").SelectedDate = DateTime.Today;

            Label1.Text = new DB().GetData();
        }
    }

    class DB :Ede.Uof.Utility.Data.BasePersistentObject
    {
        public string GetData()
        {
            string cmdTxt = @"DECLARE	@return_value int

EXEC @return_value=[dbo].[SP_EB_ORG_Rebuild]
SELECT @return_value";
     
            return this.m_db.ExecuteScalar(cmdTxt).ToString();
        }
    }

    public RadDatePicker GetRadDatePicker(string id)
    {
        return (RadDatePicker)toolBar.FindItemByValue("Keyword").FindControl(id);
    }

    private void DepartmentTree_NodeOnClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
    {
        Label1.Text = DepartmentTree.SelectedDepartmentName;


    }

    protected void toolBar_ButtonClick(object sender, Telerik.Web.UI.RadToolBarEventArgs e)
    {
        if(e.Item.Value == "Query")
        {
            var startDate = GetRadDatePicker("rdpDateStart").SelectedDate;
            var endDate = GetRadDatePicker("rdpDateEnd").SelectedDate;
        }
    }
}