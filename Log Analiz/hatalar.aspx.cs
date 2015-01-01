using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LoQuarryname;

public partial class hatalar : System.Web.UI.Page
{
    protected string hata400, hata403, hata404, hata416, hata500;
    protected void Page_Load(object sender, EventArgs e)
    {
        LogQuarry log = new LogQuarry();
        hata400 = log.hata400();
        hata403 = log.hata403();
        hata404 = log.hata404();
        hata416 = log.hata416();
        hata500 = log.hata500();

    }
}