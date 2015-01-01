using MSUtil;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Yukleme : System.Web.UI.Page
{
    COMIISW3CInputContextClass inputContext = new COMIISW3CInputContextClass();
    COMSQLOutputContextClass sqllog = new COMSQLOutputContextClass();
    LogQueryClass logQuery = new LogQueryClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack){
           
        }
      
     
    }
    protected void upload_Click(object sender, EventArgs e)
    {
        
         HttpPostedFile postedFile = InputFile.PostedFile;
         int hata=2;
        string yeniPath="";
        try{
            if (postedFile != null && postedFile.ContentLength > 0)
                {

                    string serverPath = Server.MapPath(".");
                    string filePath = postedFile.FileName;
                    FileInfo clientFileInfo = new FileInfo(filePath);
                    string filename = clientFileInfo.Name;
                    yeniPath = serverPath + "\\dosyalar\\" + filename;
                    postedFile.SaveAs(yeniPath);
                    FileInfo serverFileInfo = new FileInfo(yeniPath);

                    FileStream stream = new FileStream(serverFileInfo.FullName, FileMode.Open, FileAccess.Read);
                    byte[] buffer = new byte[stream.Length];
                    stream.Read(buffer, 0, (int)stream.Length);
                    stream.Close();
                    hata = 0;
                }
            else
            {
                MyPlaceholder.Controls.Add(new Literal()
                {
                    Text = " <div class=\"alert alert-danger alert-dismissible\" role=\"alert\">" +
                        "<button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>" +
                        "<strong>Uyarı!</strong> Lütfen Log Dosyasını Seçin." +
                        "</div>"
                });
                hata = 1;
            }
        }

        catch(Exception ex)
        {
            MyPlaceholder.Controls.Add(new Literal()
            {
                Text = " <div class=\"alert alert-danger alert-dismissible\" role=\"alert\">" +
                      "<button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>" +
                      "<strong>Hata!</strong> Dosyayla Alakalı bir hata oldu.<br/> ("+ex.ToString()+")"+
                    "</div>"});
        hata = 1;
        }
        if (hata == 0)
        {
            try
            {
               
                sqllog.database = "log";
                sqllog.server = "IHOCAN";
                sqllog.createTable = true;
                sqllog.clearTable = true;
                sqllog.ignoreIdCols = true;
                
                sqllog.driver = "SQL SERVER";
                LogQueryClass logQuery = new LogQueryClassClass();
                String query =
             "SELECT TO_LOCALTIME(TO_TIMESTAMP(date, time)) as Datetime, c-ip, cs-uri-stem,  " +
             "URLUNESCAPE(cs-uri-query) as csUriQuery, sc-status, sc-win32-status, sc-bytes, cs-bytes, " +
             "time-taken, cs-host, cs(User-Agent), " +
             "cs(Referer) FROM '" + yeniPath + "' TO Kayit";

                logQuery.ExecuteBatch(query, inputContext, sqllog);
                string FileToDelete;
                FileToDelete = yeniPath;
                File.Delete(FileToDelete);
            }
            catch (Exception ex)
            {
                MyPlaceholder.Controls.Add(new Literal()
                {
                    Text = " <div class=\"alert alert-danger alert-dismissible\" role=\"alert\">" +
                          "<button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>" +
                          "<strong>Hata!</strong> Sql Kayıtında Hata Olacak.<br/> (" + ex.ToString() + ")" +
                        "</div>"
                });
                
            }
            finally{

                MyPlaceholder.Controls.Add(new Literal()
                {
                    Text = " <div class=\"alert alert-success alert-dismissible\" role=\"alert\">" +
                          "<button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>" +
                          "<strong>Başarılı!</strong> Log Bilgileri başarıyla Alındı.<br/>" +
                        "</div>"
                });
                Response.Redirect("./index.aspx");
                
            }
        }


        } 
    
    
}