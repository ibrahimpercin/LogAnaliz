using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using LoQuarryname;
using System.Web.Configuration;

public partial class index : System.Web.UI.Page
{
    public string toplamtik, duzgungırıs,hatalitik,bothit,spiderhit,toplamsayfa, sayfagoruntulenmeort, hatasayisi,gelenveri,gidenveri;
    protected void Page_Load(object sender, EventArgs e){
        LogQuarry log1 = new LoQuarryname.LogQuarry();
         toplamtik = log1.toplamtik();
        duzgungırıs = log1.duzgungiris();
        hatalitik = log1.hatalitik();
        bothit = log1.bothit();
        spiderhit = log1.spiderhit();
        toplamsayfa = log1.toplamsayfa();
        sayfagoruntulenmeort = (float.Parse(toplamsayfa) / float.Parse(duzgungırıs)).ToString();
        hatasayisi = log1.hatasayisi();
        gelenveri = log1.gelenveri()+ " Byte";
        gidenveri = log1.gidenveri() + " Byte";
    }
}