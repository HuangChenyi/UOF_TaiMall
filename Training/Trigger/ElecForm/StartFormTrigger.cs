using Ede.Uof.WKF.ExternalUtility;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Training.Trigger.ElecForm
{
    public class StartFormTrigger : Ede.Uof.WKF.ExternalUtility.ICallbackTriggerPlugin
    {
        public void Finally()
        {
           // throw new NotImplementedException();
        }

        public string GetFormResult(ApplyTask applyTask)
        {
            //<Form formVersionId="cbc88b79-f200-4b99-a84b-3ed650808c0e">
            //  <FormFieldValue>
            //    <FieldItem fieldId="DocNbr" fieldValue="WKF250400002" realValue="" enableSearch="True" />
            //    <FieldItem fieldId="EdocContent" ConditionValue="&lt;ReturnValue&gt;&lt;FromUnitName&gt;動物園樂活有限公司&lt;/FromUnitName&gt;&lt;ToUnitName&gt;動物園樂活有限公司&lt;/ToUnitName&gt;&lt;SpeedType&gt;普通件&lt;/SpeedType&gt;&lt;/ReturnValue&gt;" realValue="">
            //      <EdocContent mode="receive"
            //      docId="beb70962-cc66-469c-98b2-7d3caefe94f9"
            //      fileGroupId="1eaaa89f-6eec-4b00-92d1-ed5e4202b8c3"
            //      previewFileGroupId="" toUnitName="動物園樂活有限公司"
            //      fromUnitName="動物園樂活有限公司"
            //      speedType="NORMAL" numberString="金字第1130000003號"
            //      fieldValue="&amp;lt;?xml version=&amp;quot;1.0&amp;quot; encoding=&amp;quot;utf-8&amp;quot;?&amp;gt;&amp;#10;&amp;lt;!DOCTYPE &amp;#26371;&amp;#21208;&amp;#36890;&amp;#30693;&amp;#21934; SYSTEM &amp;quot;104_B_utf8.dtd&amp;quot;[&amp;#10;&amp;lt;!ENTITY &amp;#34920;&amp;#21934; SYSTEM &amp;quot;A111111115_1130000003.sw&amp;quot; NDATA DI&amp;gt;&amp;#10;&amp;lt;!NOTATION _X SYSTEM &amp;quot;&amp;quot;&amp;gt;&amp;#10;&amp;lt;!NOTATION DI SYSTEM &amp;quot;&amp;quot;&amp;gt;&amp;#10;]&amp;gt;&amp;#10;&amp;lt;&amp;#26371;&amp;#21208;&amp;#36890;&amp;#30693;&amp;#21934;&amp;gt;&amp;#10;  &amp;lt;&amp;#30332;&amp;#25991;&amp;#27231;&amp;#38364;&amp;gt;&amp;#10;    &amp;lt;&amp;#20840;&amp;#37532;&amp;gt;&amp;#21205;&amp;#29289;&amp;#22290;&amp;#27138;&amp;#27963;&amp;#26377;&amp;#38480;&amp;#20844;&amp;#21496;&amp;lt;/&amp;#20840;&amp;#37532;&amp;gt;&amp;#10;    &amp;lt;&amp;#27231;&amp;#38364;&amp;#20195;&amp;#30908;&amp;gt;A111111115&amp;lt;/&amp;#27231;&amp;#38364;&amp;#20195;&amp;#30908;&amp;gt;&amp;#10;  &amp;lt;/&amp;#30332;&amp;#25991;&amp;#27231;&amp;#38364;&amp;gt;&amp;#10;  &amp;lt;&amp;#21463;&amp;#25991;&amp;#32773;&amp;gt;&amp;#10;    &amp;lt;&amp;#20132;&amp;#25563;&amp;#34920; &amp;#20132;&amp;#25563;&amp;#34920;&amp;#21934;=&amp;quot;&amp;#34920;&amp;#21934;&amp;quot;&amp;gt;&amp;#22914;&amp;#20986;&amp;#21015;&amp;#24109;&amp;#32773;&amp;lt;/&amp;#20132;&amp;#25563;&amp;#34920;&amp;gt;&amp;#10;  &amp;lt;/&amp;#21463;&amp;#25991;&amp;#32773;&amp;gt;&amp;#10;  &amp;lt;&amp;#32879;&amp;#32097;&amp;#20154;&amp;#21450;&amp;#38651;&amp;#35441;&amp;gt;&amp;#10;    &amp;lt;&amp;#22995;&amp;#21517;&amp;gt;&amp;#37329;&amp;#23403;&amp;lt;/&amp;#22995;&amp;#21517;&amp;gt;&amp;#10;    &amp;lt;&amp;#32887;&amp;#31281; /&amp;gt;&amp;#10;    &amp;lt;&amp;#38651;&amp;#35441;&amp;gt;0123456&amp;lt;/&amp;#38651;&amp;#35441;&amp;gt;&amp;#10;  &amp;lt;/&amp;#32879;&amp;#32097;&amp;#20154;&amp;#21450;&amp;#38651;&amp;#35441;&amp;gt;&amp;#10;  &amp;lt;&amp;#30332;&amp;#25991;&amp;#26085;&amp;#26399;&amp;gt;&amp;#10;    &amp;lt;&amp;#24180;&amp;#26376;&amp;#26085;&amp;gt;&amp;#20013;&amp;#33775;&amp;#27665;&amp;#22283;113&amp;#24180;2&amp;#26376;27&amp;#26085;&amp;lt;/&amp;#24180;&amp;#26376;&amp;#26085;&amp;gt;&amp;#10;  &amp;lt;/&amp;#30332;&amp;#25991;&amp;#26085;&amp;#26399;&amp;gt;&amp;#10;  &amp;lt;&amp;#30332;&amp;#25991;&amp;#23383;&amp;#34399;&amp;gt;&amp;#10;    &amp;lt;&amp;#23383;&amp;gt;&amp;#37329;&amp;lt;/&amp;#23383;&amp;gt;&amp;#10;    &amp;lt;&amp;#25991;&amp;#34399;&amp;gt;&amp;#10;      &amp;lt;&amp;#24180;&amp;#24230;&amp;gt;113&amp;lt;/&amp;#24180;&amp;#24230;&amp;gt;&amp;#10;      &amp;lt;&amp;#27969;&amp;#27700;&amp;#34399;&amp;gt;0000003&amp;lt;/&amp;#27969;&amp;#27700;&amp;#34399;&amp;gt;&amp;#10;      &amp;lt;&amp;#25903;&amp;#34399; /&amp;gt;&amp;#10;    &amp;lt;/&amp;#25991;&amp;#34399;&amp;gt;&amp;#10;  &amp;lt;/&amp;#30332;&amp;#25991;&amp;#23383;&amp;#34399;&amp;gt;&amp;#10;  &amp;lt;&amp;#36895;&amp;#21029; &amp;#20195;&amp;#30908;=&amp;quot;&amp;#26222;&amp;#36890;&amp;#20214;&amp;quot; /&amp;gt;&amp;#10;  &amp;lt;&amp;#23494;&amp;#31561;&amp;#21450;&amp;#35299;&amp;#23494;&amp;#26781;&amp;#20214;&amp;#25110;&amp;#20445;&amp;#23494;&amp;#26399;&amp;#38480;&amp;gt;&amp;#10;    &amp;lt;&amp;#23494;&amp;#31561; /&amp;gt;&amp;#10;    &amp;lt;&amp;#35299;&amp;#23494;&amp;#26781;&amp;#20214;&amp;#25110;&amp;#20445;&amp;#23494;&amp;#26399;&amp;#38480; /&amp;gt;&amp;#10;  &amp;lt;/&amp;#23494;&amp;#31561;&amp;#21450;&amp;#35299;&amp;#23494;&amp;#26781;&amp;#20214;&amp;#25110;&amp;#20445;&amp;#23494;&amp;#26399;&amp;#38480;&amp;gt;&amp;#10;  &amp;lt;&amp;#38468;&amp;#20214;&amp;gt;&amp;#10;    &amp;lt;&amp;#25991;&amp;#23383; /&amp;gt;&amp;#10;  &amp;lt;/&amp;#38468;&amp;#20214;&amp;gt;&amp;#10;  &amp;lt;&amp;#26371;&amp;#21208;&amp;#20107;&amp;#30001;&amp;gt;&amp;#10;    &amp;lt;&amp;#25991;&amp;#23383;&amp;gt;&amp;#37329;&amp;#31881;&amp;#35211;&amp;#38754;&amp;#26371;&amp;#22580;&amp;#22320;&amp;#22580;&amp;#21208;&amp;lt;/&amp;#25991;&amp;#23383;&amp;gt;&amp;#10;  &amp;lt;/&amp;#26371;&amp;#21208;&amp;#20107;&amp;#30001;&amp;gt;&amp;#10;  &amp;lt;&amp;#26371;&amp;#21208;&amp;#26178;&amp;#38291;&amp;gt;&amp;#10;    &amp;lt;&amp;#24180;&amp;#26376;&amp;#26085;&amp;gt;113&amp;#24180;2&amp;#26376;27&amp;#26085;&amp;lt;/&amp;#24180;&amp;#26376;&amp;#26085;&amp;gt;&amp;#10;    &amp;lt;&amp;#26143;&amp;#26399;&amp;gt;&amp;#20108;&amp;lt;/&amp;#26143;&amp;#26399;&amp;gt;&amp;#10;    &amp;lt;&amp;#26178;&amp;#20998;&amp;gt;&amp;#19979;&amp;#21320;4&amp;#26178;&amp;lt;/&amp;#26178;&amp;#20998;&amp;gt;&amp;#10;  &amp;lt;/&amp;#26371;&amp;#21208;&amp;#26178;&amp;#38291;&amp;gt;&amp;#10;  &amp;lt;&amp;#26371;&amp;#21208;&amp;#22320;&amp;#40670;&amp;gt;&amp;#10;    &amp;lt;&amp;#25991;&amp;#23383;&amp;gt;&amp;#19968;&amp;#31561;&amp;#19968;&amp;#31185;&amp;#25216;&amp;#36774;&amp;#20844;&amp;#22823;&amp;#27155;&amp;#19968;&amp;#27155;&amp;#22823;&amp;#24307;&amp;lt;/&amp;#25991;&amp;#23383;&amp;gt;&amp;#10;  &amp;lt;/&amp;#26371;&amp;#21208;&amp;#22320;&amp;#40670;&amp;gt;&amp;#10;  &amp;lt;&amp;#20027;&amp;#25345;&amp;#20154;&amp;gt;&amp;#10;    &amp;lt;&amp;#22995;&amp;#21517;&amp;gt;&amp;#21205;&amp;#29289;&amp;#22290;&amp;#27138;&amp;#27963;&amp;#26377;&amp;#38480;&amp;#20844;&amp;#21496;&amp;lt;/&amp;#22995;&amp;#21517;&amp;gt;&amp;#10;  &amp;lt;/&amp;#20027;&amp;#25345;&amp;#20154;&amp;gt;&amp;#10;  &amp;lt;&amp;#20986;&amp;#24109;&amp;#32773;&amp;gt;&amp;#10;    &amp;lt;&amp;#20840;&amp;#37532;&amp;gt;&amp;#19968;&amp;#31561;&amp;#19968;&amp;#31185;&amp;#25216;&amp;#32929;&amp;#20221;&amp;#26377;&amp;#38480;&amp;#20844;&amp;#21496;&amp;lt;/&amp;#20840;&amp;#37532;&amp;gt;&amp;#10;  &amp;lt;/&amp;#20986;&amp;#24109;&amp;#32773;&amp;gt;&amp;#10;  &amp;lt;&amp;#21015;&amp;#24109;&amp;#32773;&amp;gt;&amp;#10;    &amp;lt;&amp;#20840;&amp;#37532; /&amp;gt;&amp;#10;  &amp;lt;/&amp;#21015;&amp;#24109;&amp;#32773;&amp;gt;&amp;#10;  &amp;lt;&amp;#21103;&amp;#26412;&amp;gt;&amp;#10;    &amp;lt;&amp;#20840;&amp;#37532; /&amp;gt;&amp;#10;  &amp;lt;/&amp;#21103;&amp;#26412;&amp;gt;&amp;#10;  &amp;lt;&amp;#20633;&amp;#35387;&amp;gt;&amp;#10;    &amp;lt;&amp;#27573;&amp;#33853; &amp;#27573;&amp;#21517;=&amp;quot;&amp;#20633;&amp;#35387;&amp;#65306;&amp;quot;&amp;gt;&amp;#10;      &amp;lt;&amp;#25991;&amp;#23383;&amp;gt;&amp;#27880;&amp;#24847;&amp;#20107;&amp;#38917;&amp;#65306;&amp;lt;/&amp;#25991;&amp;#23383;&amp;gt;&amp;#10;      &amp;lt;&amp;#26781;&amp;#21015; &amp;#24207;&amp;#34399;=&amp;quot;&amp;#19968;&amp;#12289;&amp;quot;&amp;gt;&amp;#10;        &amp;lt;&amp;#25991;&amp;#23383;&amp;gt;&amp;#31532;&amp;#19968;&amp;#40670;&amp;lt;/&amp;#25991;&amp;#23383;&amp;gt;&amp;#10;      &amp;lt;/&amp;#26781;&amp;#21015;&amp;gt;&amp;#10;      &amp;lt;&amp;#26781;&amp;#21015; &amp;#24207;&amp;#34399;=&amp;quot;&amp;#20108;&amp;#12289;&amp;quot;&amp;gt;&amp;#10;        &amp;lt;&amp;#25991;&amp;#23383;&amp;gt;&amp;#31532;&amp;#20108;&amp;#40670;&amp;lt;/&amp;#25991;&amp;#23383;&amp;gt;&amp;#10;      &amp;lt;/&amp;#26781;&amp;#21015;&amp;gt;&amp;#10;      &amp;lt;&amp;#26781;&amp;#21015; &amp;#24207;&amp;#34399;=&amp;quot;&amp;#19977;&amp;#12289;&amp;quot;&amp;gt;&amp;#10;        &amp;lt;&amp;#25991;&amp;#23383;&amp;gt;&amp;#31532;&amp;#19977;&amp;#40670;&amp;lt;/&amp;#25991;&amp;#23383;&amp;gt;&amp;#10;      &amp;lt;/&amp;#26781;&amp;#21015;&amp;gt;&amp;#10;      &amp;lt;&amp;#26781;&amp;#21015; &amp;#24207;&amp;#34399;=&amp;quot;&amp;#22235;&amp;#12289;&amp;quot;&amp;gt;&amp;#10;        &amp;lt;&amp;#25991;&amp;#23383;&amp;gt;&amp;#31532;&amp;#22235;&amp;#40670;&amp;lt;/&amp;#25991;&amp;#23383;&amp;gt;&amp;#10;      &amp;lt;/&amp;#26781;&amp;#21015;&amp;gt;&amp;#10;      &amp;lt;&amp;#26781;&amp;#21015; &amp;#24207;&amp;#34399;=&amp;quot;&amp;#20116;&amp;#12289;&amp;quot;&amp;gt;&amp;#10;        &amp;lt;&amp;#25991;&amp;#23383;&amp;gt;&amp;#31532;&amp;#20116;&amp;#40670;&amp;lt;/&amp;#25991;&amp;#23383;&amp;gt;&amp;#10;      &amp;lt;/&amp;#26781;&amp;#21015;&amp;gt;&amp;#10;    &amp;lt;/&amp;#27573;&amp;#33853;&amp;gt;&amp;#10;  &amp;lt;/&amp;#20633;&amp;#35387;&amp;gt;&amp;#10;  &amp;lt;&amp;#32626;&amp;#21517;&amp;gt;&amp;#37329;&amp;#23403;&amp;#32317;&amp;#35009;&amp;lt;/&amp;#32626;&amp;#21517;&amp;gt;&amp;#10;&amp;lt;/&amp;#26371;&amp;#21208;&amp;#36890;&amp;#30693;&amp;#21934;&amp;gt;" />
            //    </FieldItem>
            //    <FieldItem fieldId="b001" fieldValue="" realValue="" enableSearch="True" />
            //  </FormFieldValue>
            //</Form>

            var EdocContent = applyTask.Task.CurrentDocument.
                Fields["EdocContent"].FieldValue;

            DB db = new DB();
            var docId = XElement.Parse(EdocContent).Attribute("docId").Value;
            string subject = db.GetEDocSubject(docId);

            applyTask.SetFormValue("Subject", subject);
            applyTask.SaveFormValue();
            Ede.Uof.WKF.EdocTrigger.StartEDocument doc = new Ede.Uof.WKF.EdocTrigger.StartEDocument();

           
            string jsonDisplay = applyTask.Task.JsonDisplay;
            var dic = JsonConvert.DeserializeObject<Dictionary<string, string>>(jsonDisplay);
         
            dic["Subject"] = subject;


            string json = JsonConvert.SerializeObject(dic);
            db.UpdataData(applyTask.Task.TaskId, json);


            doc.GetFormResult(applyTask);
            return "";
            //throw new NotImplementedException();
        }

        public void OnError(Exception errorException)
        {
          //  throw new NotImplementedException();
        }

        class DB:Ede.Uof.Utility.Data.BasePersistentObject
        {

            public string GetEDocSubject(string docID)
                {
                m_db = new Ede.Uof.Utility.Data.DatabaseHelper();
                string cmdTxt = @"select [SUBJECT] from TB_EDOC_RECEIVE
WHERE RECEIVE_DOC_ID=@RECEIVE_DOC_ID";

                this.m_db.AddParameter("@RECEIVE_DOC_ID", docID);
                object obj = this.m_db.ExecuteScalar(cmdTxt);
                if (obj == null)
                    return "";
                else
                    return obj.ToString();
            }

            public void UpdataData(string taskId, string json)
            {
                string cmdTxt = @"  UPDATE [dbo].[TB_WKF_TASK]  
 SET 
	 [JSON_DISPLAY] = @JSON_DISPLAY  

WHERE 
	[TASK_ID] = @TASK_ID";

                this.m_db.AddParameter("@JSON_DISPLAY", json);
                this.m_db.AddParameter("@TASK_ID", taskId);

                this.m_db.ExecuteNonQuery(cmdTxt);

            }
        }
    }
}
