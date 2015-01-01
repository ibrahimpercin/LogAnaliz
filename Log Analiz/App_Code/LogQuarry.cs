using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for LogQuarry
/// </summary>
/// 
namespace LoQuarryname
{
    public class LogQuarry
    {


        SqlDataReader reader;
        SqlConnection con = new SqlConnection("Data Source=IHOCAN;Initial Catalog=log;Integrated Security=True");
        private static string[] sqlsorgu = { "select", "null", "count", "like", "values", "into", "drop", "insert", "delete", "truncate", "update", "alter", "exec", "xp_cmdshell", "create", "where", "from"};
        private static string[] xssorgu = { @"<", @">", @"#", @"{", @"(", @")", @"}", @"<", @">", "fromcharcode", "script", "javascript", "object", ".js", "vbscript", "allowscriptaccess", "activex", "iframe", "object", "input", "dynsrc", "lowsrc", "size", "link", "href", "rel", "import", "moz-binding", "htc", "mocha", "livescript", "content", "embed", "src", "-webkit", "html", "alert", "print", "echo" };
        public string xxsstring()
        {
            string str = "";
            for (int i = 0; i < xssorgu.Length; i++)
            {
                str += "[csUriQuery] like '%" + xssorgu[i] + "%'";
                if (i < xssorgu.Length - 1)
                {
                    str += " or ";
                }
            }
            return str;

        }
        public string sqlstring()
        {
            string str = "";
            for (int i = 0; i < sqlsorgu.Length; i++)
            {
                str += "[csUriQuery] like '%" + sqlsorgu[i] + "%'";
                if (i < sqlsorgu.Length - 1)
                {
                    str += " or ";
                }
            }
            return str;

        }
        public string toplamtik()
        {//toplam tık
            string tiksayisi;
            string query = @"Select count(*) as [Toplam Tık] from Kayit ";
            SqlCommand comm = new SqlCommand(query, con);
            
            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                tiksayisi = comm.ExecuteScalar().ToString();

            }
            finally
            {
               
                con.Close();
               
            }
            return tiksayisi;
        }
        public string duzgungiris()
        {//Toplam Tekil İp Sayısı
            string duzgungiris;
            string query = @"SELECT COUNT(DISTINCT [cIp]) as [Hatasız Giriş Yapan Tekil İp Sayısı] FROM Kayit";

            SqlCommand comm = new SqlCommand(query, con);

            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                duzgungiris = comm.ExecuteScalar().ToString();

            }
            finally
            {

                con.Close();

            }
            return duzgungiris;
            
        }
        public string hatasayisi()
        {//Toplam Tekil İp Sayısı
            string hatasayisi;
            string query = @"SELECT COUNT(*) as [Hatasız Giriş Yapan Tekil İp Sayısı] FROM Kayit where [scStatus]>400 ";

            SqlCommand comm = new SqlCommand(query, con);

            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                hatasayisi = comm.ExecuteScalar().ToString();

            }
            finally
            {

                con.Close();

            }
            return hatasayisi;

        }

        public string hatalitik()
        {//Toplam Hatalı tık sayısı 
            string hatalitik;
            string query = @"SELECT COUNT(*) as [Hatalı Tık Sayısı] FROM Kayit where [scStatus]>=400";
            SqlCommand comm = new SqlCommand(query, con);
            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                hatalitik = comm.ExecuteScalar().ToString();

            }
            finally
            {

                con.Close();

            }
            return hatalitik;
        }

        public string bothit()
        {//toplam tık
            string bothitsayisi;
            string query = @"Select count(*) as [Toplam Tık] from Kayit where [csUserAgent] Like '%bot%'";
            SqlCommand comm = new SqlCommand(query, con);

            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                bothitsayisi = comm.ExecuteScalar().ToString();

            }
            finally
            {

                con.Close();

            }
            return bothitsayisi;
        }
        public string spiderhit()
        {//toplam tık
            string spiderhitsayisi;
            string query = @"Select count(*) as [Toplam Tık] from Kayit where [csUserAgent] Like '%spider%'";
            SqlCommand comm = new SqlCommand(query, con);

            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                spiderhitsayisi = comm.ExecuteScalar().ToString();

            }
            finally
            {

                con.Close();

            }
            return spiderhitsayisi;
        }
        //toplam sayfa Görüntülenme
        public string toplamsayfa()
        {
            string toplamsayfagoruntulenme;
            string query = @"Select count([csUriStem]) as [Siteler] from Kayit where ([csUriStem] not like '%jpg' and [csUriStem] not like '%png' and [csUriStem] not like '%gif' and [csUriStem] not like '%ico' and [csUriStem] not like '%js' and [csUriStem] not like '%css' and [csUriStem] not like '%ttf' and [csUriStem] not like '%woff')";
            SqlCommand comm = new SqlCommand(query, con);

            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                toplamsayfagoruntulenme = comm.ExecuteScalar().ToString();

            }
            finally
            {

                con.Close();

            }
            return toplamsayfagoruntulenme;
        }

        public string gelenveri()
        {//servere gelen toplam veri miktarı
            string query = @"SELECT sum([csBytes]) [Gelen Toplam Veri] From Kayit";
            string gelenveri;
            SqlCommand comm = new SqlCommand(query, con);

            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                gelenveri = comm.ExecuteScalar().ToString();

            }
            finally
            {

                con.Close();

            }
            return gelenveri;
        }
        public string gidenveri()
        {//servere gelen toplam veri miktarı
            string query = @"SELECT sum([scBytes]) [Gelen Toplam Veri] From Kayit";
            string gidenveri;
            SqlCommand comm = new SqlCommand(query, con);

            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                gidenveri = comm.ExecuteScalar().ToString();

            }
            finally
            {

                con.Close();

            }
            return gidenveri;
        }
        public string sayfalaragirissayisi()
        {//sayfalara giris sayisi
            string query = @"SELECT top 6 [csUriStem]  [Sayfa Adresi], (COUNT(*)) as [Toplam Hit], Max([timeTaken]) as [Geçilen Süre], AVG([timeTaken]) as [Ortalama Geçen Süre],AVG([csBytes]) as [Gönderilen ortalama Byte] FROM Kayit WHERE [csUriStem] not like '%jpg' and [csUriStem] not like '%png' and [csUriStem] not like '%gif' and [csUriStem] not like '%ico' and [csUriStem] not like '%js' and [csUriStem] not like '%css' and [csUriStem] not like '%ttf' and [csUriStem] not like '%woff' GROUP BY [csUriStem] ORDER BY [Toplam Hit] DESC";
            return query;
        }
        public DataTable Encokgirilensayfa()
        {//servere gelen toplam veri miktarı
            con.Open();
            DataTable table = null;
            try 
            {
                string query1 = @"SELECT top 6 [csUriStem]  [Sayfa Adresi], COUNT(*)  [Toplam Hit], Max([timeTaken]) as [Geçilen Süre], AVG([timeTaken]) as [Ortalama Geçen Süre],AVG([csBytes]) as [Gönderilen ortalama Byte]  FROM Kayit where ([csUriStem] not like '%jpg' and [csUriStem] not like '%png' and [csUriStem] not like '%gif' and [csUriStem] not like '%ico' and [csUriStem] not like '%js' and [csUriStem] not like '%css' and [csUriStem] not like '%axd' and [csUriStem] not like '%ttf' and [csUriStem] not like '%woff')  GROUP BY [csUriStem] ORDER BY [Toplam Hit] DESC";
                SqlDataAdapter da = new SqlDataAdapter(query1, con);
                SqlCommandBuilder commandBuilder = new SqlCommandBuilder(da);
                table = new DataTable();
                table.Locale = System.Globalization.CultureInfo.InvariantCulture;
                da.Fill(table);
            }
            finally { 
            con.Close();
            }
            return table;
        }
        public DataTable top20giris()
        {//servere gelen toplam veri miktarı
            con.Open();
            DataTable table = null;
            try
            {
                string query1 = @"SELECT top 20 [cIp] as[İp Adresi], Count(*) as [Tık Sayısı]  FROM Kayit GROUP BY [cIp] ORDER BY [Tık Sayısı]  DESC";
                SqlDataAdapter da = new SqlDataAdapter(query1, con);
                SqlCommandBuilder commandBuilder = new SqlCommandBuilder(da);
                table = new DataTable();
                table.Locale = System.Globalization.CultureInfo.InvariantCulture;
                da.Fill(table);
            }
            finally
            {
                con.Close();
            }
            return table;
        }

        public string hata400()
        {//400 HATASI   

            string query = @"SELECT COUNT(*) as [Yanlış İstek Hatası] FROM Kayit where [scStatus]=400";
            string hata400;
            SqlCommand comm = new SqlCommand(query, con);

            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                hata400 = comm.ExecuteScalar().ToString();

            }
            finally
            {

                con.Close();

            }
            return hata400;
        }
        public string hata403()
        {//403 hatası

            string query = @"SELECT COUNT(*) as [Yasak Giriş Hatası] FROM Kayit where [scStatus]=403";
            string hata403;
            SqlCommand comm = new SqlCommand(query, con);

            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                hata403 = comm.ExecuteScalar().ToString();

            }
            finally
            {

                con.Close();

            }
            return hata403;
        }
        public string hata404()
        {//404 hatası
            string query = @"SELECT COUNT(*) as [Sayfa Bulunamıyor] FROM Kayit where [scStatus]=404";
            string hata404;
            SqlCommand comm = new SqlCommand(query, con);

            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                hata404 = comm.ExecuteScalar().ToString();

            }
            finally
            {

                con.Close();

            }
            return hata404;
        }
        public string hata416()
        {//416 hatası
            string query = @"SELECT COUNT(*) as [İstenen Aralık Karşılanabilir Değil Hatası] FROM Kayit where [scStatus]=416";
            string hata416;
            SqlCommand comm = new SqlCommand(query, con);

            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                hata416 = comm.ExecuteScalar().ToString();

            }
            finally
            {

                con.Close();

            }
            return hata416;
        }
        public string hata500()
        {//500 hatası
            string query = @"SELECT COUNT(*) as [Dahili Sunucu Hatası] FROM Kayit where [scStatus]=500";
            string hata500;
            SqlCommand comm = new SqlCommand(query, con);

            try
            {
                //Connection açma ve DataBinding işlemim
                con.Open();
                hata500 = comm.ExecuteScalar().ToString();

            }
            finally
            {

                con.Close();

            }
            return hata500;
        }

        public string saatlikgirissayisi()
        {//Serverdan gönderilen toplam veri miktarı
            string query = @"SELECT CAST(DATEADD(hh,FLOOR(DATEDIFF(hh,0,CAST([dateTime] AS TIME))/1)*1,0) AS time) [Başlangıç Zamanı], count(DISTINCT [cIp]) [Giriş Sayısı] From Kayit group by CAST(DATEADD(hh,FLOOR(DATEDIFF(hh,0,CAST([dateTime] AS TIME))/1)*1,0) AS time) order by [Başlangıç Zamanı]";
            return query;
        }
        public DataTable xssaciklari()
        {
            //500 hatası
            con.Open();
            DataTable table = null;
            try {
                
                    string query1 = @"SELECT DISTINCT [Datetime] as [tarih] , [cIp] As [Saldıran İp], [csUriStem] as [Saldırılan Adres], [csUriQuery] as [Denenen Sorgular] FROM Kayit where ([csUriStem] not like '%jpg' and [csUriStem] not like '%png' and [csUriStem] not like '%axd' and [csUriStem] not like '%gif' and [csUriStem] not like '%ico' and [csUriStem] not like '%js' and [csUriStem] not like '%axd'and [csUriStem] not like '%css' and [csUriStem] not like '%ttf' and [csUriStem] not like '%woff') and (" + xxsstring()+ ") GROUP BY [cIp], [csUriStem] , [csUriQuery], [Datetime]  ";
                    SqlCommand comm = new SqlCommand(query1, con);
                    //comm.Parameters.AddWithValue("@parametre", "%" + edc + "%");
                    SqlDataAdapter da = new SqlDataAdapter(comm);
                    SqlCommandBuilder commandBuilder = new SqlCommandBuilder(da);
                    table = new DataTable();
                    table.Locale = System.Globalization.CultureInfo.InvariantCulture;
                    da.Fill(table);
               
            }
           
            finally { con.Close(); }
           
            return table;
        }
        public DataTable gecenxssaciklari()
        {
            //500 hatası
            DataSet myDataSet = new DataSet();
            con.Open();
            DataTable table = null;
            
                string query1 = @"SELECT DISTINCT [Datetime] as [tarih],  [cIp] As [Saldıran İp], [csUriStem] as [Saldırılan Adres], [csUriQuery] as [Denenen Sorgular] FROM Kayit where ([csUriStem] not like '%jpg' and [csUriStem] not like '%png' and [csUriStem] not like '%gif' and [csUriStem] not like '%ico' and [csUriStem] not like '%js' and [csUriStem] not like '%css' and [csUriStem] not like '%axd' and [csUriStem] not like '%ttf' and [csUriStem] not like '%woff') and (" + xxsstring() + " and [scStatus] like '500') GROUP BY [cIp], [csUriStem] , [csUriQuery] , [Datetime]  ";
                SqlCommand comm = new SqlCommand(query1, con);
                
                SqlDataAdapter da = new SqlDataAdapter(comm);
                SqlCommandBuilder commandBuilder = new SqlCommandBuilder(da);
                table = new DataTable();
                table.Locale = System.Globalization.CultureInfo.InvariantCulture;
                da.Fill(table);
            
            con.Close();
            return table;
        }
        public DataTable sqlacikleri()
        {
            
                con.Open();
                DataTable table = null;
                
                    string query1 = @"SELECT DISTINCT [Datetime] as [tarih],  [cIp], [csUriStem], [csUriQuery]  FROM Kayit where ([csUriStem] not like '%jpg' and [csUriStem] not like '%png' and [csUriStem] not like '%gif' and [csUriStem] not like '%ico' and [csUriStem] not like '%js' and [csUriStem] not like '%css' and [csUriStem] not like '%ttf' and [csUriStem] not like '%woff' and [csUriStem] not like '%axd') and " + sqlstring()+ " GROUP BY [cIp], [csUriStem] , [csUriQuery] ,[Datetime]  ";
                    SqlCommand comm = new SqlCommand(query1, con);
                    //comm.Parameters.AddWithValue("@parametre", "'%" + edc + "%'");
                    SqlDataAdapter da = new SqlDataAdapter(comm);
                    SqlCommandBuilder commandBuilder = new SqlCommandBuilder(da);
                    table = new DataTable();
                    table.Locale = System.Globalization.CultureInfo.InvariantCulture;
                    da.Fill(table);
                
                con.Close();
                return table;
        }

        public DataTable gecensqlacikleri()
        {

            con.Open();
            DataTable table = null;

            string query1 = @"SELECT DISTINCT [Datetime] as [tarih], [cIp], [csUriStem], [csUriQuery] FROM Kayit where ([csUriStem] not like '%jpg' and [csUriStem] not like '%axd' and [csUriStem] not like '%axd' and [csUriStem] not like '%png' and [csUriStem] not like '%gif' and [csUriStem] not like '%ico' and [csUriStem] not like '%js' and [csUriStem] not like '%css' and [csUriStem] not like '%ttf' and [csUriStem] not like '%woff') and (" + sqlstring()+ " and [scStatus] like '500') GROUP BY [cIp], [csUriStem] , [csUriQuery],[Datetime] ";
            SqlCommand comm = new SqlCommand(query1, con);
            //comm.Parameters.AddWithValue("@parametre", "'%" + edc + "%'");
            SqlDataAdapter da = new SqlDataAdapter(comm);
            SqlCommandBuilder commandBuilder = new SqlCommandBuilder(da);
            table = new DataTable();
            table.Locale = System.Globalization.CultureInfo.InvariantCulture;
            da.Fill(table);

            con.Close();
            return table;
        }


        public DataTable dos()
        {//dos atack
            tablosil();
            con.Open();
            DataTable table = null;
            string query1 = @" SELECT sum([csBytes]) [Gelen Toplam Veri] , CAST(DATEADD(ss,FLOOR(DATEDIFF(ss,0,CAST([dateTime] AS TIME))/5)*5,0) AS time) [Başlangıç Zamanı], CAST(DATEADD(ss,FLOOR(DATEDIFF(ss,5,CAST([dateTime] AS TIME))/5)*5,0) AS time) [Bitiş Zamanı],[cIp] [Saldırgan İp],[csUriStem] [Saldırılan Sayfa],COUNT(*) [Total] INTO DosTablosu FROM Kayit WHERE  [csUriStem] not like '%jpg' and [csUriStem] not like '%axd' and [csUriStem] not like '%png' and [csUriStem] not like '%gif' and [csUriStem] not like '%ico' and [csUriStem] not like '%js' and [csUriStem] not like '%css' and [csUriStem] not like '%ttf' and [csUriStem] not like '%woff' group by CAST(DATEADD(ss,FLOOR(DATEDIFF(ss,0,CAST([dateTime] AS TIME))/5)*5,0) AS time),CAST(DATEADD(ss,FLOOR(DATEDIFF(ss,5,CAST([dateTime] AS TIME))/5)*5,0) AS time),[cIp],[csUriStem] HAVING Count(*)>20 order by [Total] desc Select * from DosTablosu order by [Total] desc";
            SqlCommand comm = new SqlCommand(query1, con);
            //comm.Parameters.AddWithValue("@parametre", "'%" + edc + "%'");
            SqlDataAdapter da = new SqlDataAdapter(comm);
            SqlCommandBuilder commandBuilder = new SqlCommandBuilder(da);
            table = new DataTable();
            table.Locale = System.Globalization.CultureInfo.InvariantCulture;
            da.Fill(table);

            con.Close();
            return table;
        }
        public DataTable ddos()
        {//ddos atack
            
            con.Open();
            DataTable table = null;

            string query1 = @"SELECT CAST(DATEADD(mi,FLOOR(DATEDIFF(mi,0,CAST([Başlangıç Zamanı] AS TIME))/30)*30,0) AS time) [Zaman Aralığı], Count(DISTINCT [Saldırgan İp]) [Yapılan Saldırı Sayısı] from DosTablosu group by CAST(DATEADD(mi,FLOOR(DATEDIFF(mi,0,CAST([Başlangıç Zamanı] AS TIME))/30)*30,0) AS time)  having Count(DISTINCT [Saldırgan İp])>1 ";
            SqlCommand comm = new SqlCommand(query1, con);
            //comm.Parameters.AddWithValue("@parametre", "'%" + edc + "%'");
            SqlDataAdapter da = new SqlDataAdapter(comm);
            SqlCommandBuilder commandBuilder = new SqlCommandBuilder(da);
            table = new DataTable();
            table.Locale = System.Globalization.CultureInfo.InvariantCulture;
            da.Fill(table);

            con.Close();
            
            return table;
        }
        public void tablosil ()
            {
            try
             {
                DataTable table = null;
                SqlDataAdapter da = new SqlDataAdapter("drop table DosTablosu", con);
                SqlCommandBuilder commandBuilder = new SqlCommandBuilder(da);
                table = new DataTable();
                table.Locale = System.Globalization.CultureInfo.InvariantCulture;
                da.Fill(table);
            }
            catch { }
            finally { con.Close(); }
            }

        public LogQuarry()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}