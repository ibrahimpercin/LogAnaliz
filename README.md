LogAnaliz
=========

Log Parser Kullanılarak Parse edilmiş Log Dosyasında Sql Server Kullanarak DDOS, DOS, SQL injection ve XSS Saldırılarını Tespit Eden sistem
projeyi kullanabilmek için App_Code içindeki Log_Quarry.cs ve Web.config içindeki SQL server bağlantı yazılarını kendinize göre düzenlemeniz lazım.

=========
Log_Quarry.cs içinde
=========

SqlConnection con = new SqlConnection("Data Source=IHOCAN;Initial Catalog=log;Integrated Security=True");

=========
Web.config içinde
=========

 <connectionStrings>
    <add name="logConnectionString" connectionString="Data Source=IHOCAN;Initial Catalog=log;Integrated Security=True"
      providerName="System.Data.SqlClient" />
  </connectionStrings>
  =========
