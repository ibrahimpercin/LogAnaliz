<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="browserler.aspx.cs" Inherits="browserler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="templatemo-content">

        <h1>Bulunan Browserler</h1>
        <div class="row">
            <div class="col-md-12 col-sm-6 margin-bottom-30">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title"></h3>
                    </div>
                    <div class="" style="overflow-y: auto;">
                        <center>
                           <asp:Chart Width="600px" Height="600px" ID="Chart1" runat=server DataSourceID="browsersql"><Series><asp:Series Name="Series1" ChartType="Pie" XValueMember="browser" YValueMembers="Total" CustomProperties="PieLineColor=Aqua, PieLabelStyle=Outside"></asp:Series></Series><ChartAreas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></ChartAreas></asp:Chart>
                     <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:logConnectionString %>' SelectCommand="SELECT CASE WHEN [csUserAgent] LIKE '%Chrome%' THEN 'Chrome' WHEN [csUserAgent] LIKE '%Firefox%' THEN 'Firefox' WHEN [csUserAgent] LIKE '%IE+%' THEN 'Internet Explorer' WHEN [csUserAgent] LIKE '%+rv:11%' THEN 'Internet Explorer' WHEN [csUserAgent] LIKE '%Opera%' THEN 'Opera' WHEN [csUserAgent] LIKE '%Safari%' THEN 'Safari' WHEN [csUserAgent] LIKE '%iPhone%' THEN 'Safari' WHEN [csUserAgent] LIKE '%CPU+OS+6%' THEN 'Safari' WHEN [csUserAgent] LIKE '%iTunes%' THEN 'iTunes' ELSE 'Kayıtlı Olmayan Tarayıcı' END AS browser, COUNT(DISTINCT cIp) AS Total FROM Kayit GROUP BY CASE WHEN [csUserAgent] LIKE '%Chrome%' THEN 'Chrome' WHEN [csUserAgent] LIKE '%Firefox%' THEN 'Firefox' WHEN [csUserAgent] LIKE '%IE+%' THEN 'Internet Explorer' WHEN [csUserAgent] LIKE '%+rv:11%' THEN 'Internet Explorer' WHEN [csUserAgent] LIKE '%Opera%' THEN 'Opera' WHEN [csUserAgent] LIKE '%Safari%' THEN 'Safari' WHEN [csUserAgent] LIKE '%iPhone%' THEN 'Safari' WHEN [csUserAgent] LIKE '%CPU+OS+6%' THEN 'Safari' WHEN [csUserAgent] LIKE '%iTunes%' THEN 'iTunes' ELSE 'Kayıtlı Olmayan Tarayıcı' END ORDER BY Total DESC"></asp:SqlDataSource>
<asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:logConnectionString %>' SelectCommand="SELECT CASE WHEN [csUserAgent] LIKE '%Chrome%' THEN 'Chrome' WHEN [csUserAgent] LIKE '%Firefox%' THEN 'Firefox' WHEN [csUserAgent] LIKE '%IE+%' THEN 'Internet Explorer' WHEN [csUserAgent] LIKE '%+rv:11%' THEN 'Internet Explorer' WHEN [csUserAgent] LIKE '%Opera%' THEN 'Opera' WHEN [csUserAgent] LIKE '%Safari%' THEN 'Safari' WHEN [csUserAgent] LIKE '%iPhone%' THEN 'Safari' WHEN [csUserAgent] LIKE '%CPU+OS+6%' THEN 'Safari' WHEN [csUserAgent] LIKE '%iTunes%' THEN 'iTunes' ELSE 'Kayıtlı Olmayan Tarayıcı' END AS browser, COUNT(DISTINCT cIp) AS Total FROM Kayit GROUP BY CASE WHEN [csUserAgent] LIKE '%Chrome%' THEN 'Chrome' WHEN [csUserAgent] LIKE '%Firefox%' THEN 'Firefox' WHEN [csUserAgent] LIKE '%IE+%' THEN 'Internet Explorer' WHEN [csUserAgent] LIKE '%+rv:11%' THEN 'Internet Explorer' WHEN [csUserAgent] LIKE '%Opera%' THEN 'Opera' WHEN [csUserAgent] LIKE '%Safari%' THEN 'Safari' WHEN [csUserAgent] LIKE '%iPhone%' THEN 'Safari' WHEN [csUserAgent] LIKE '%CPU+OS+6%' THEN 'Safari' WHEN [csUserAgent] LIKE '%iTunes%' THEN 'iTunes' ELSE 'Kayıtlı Olmayan Tarayıcı' END ORDER BY Total DESC"></asp:SqlDataSource>
</center>

                        <asp:SqlDataSource runat="server" ID="browsersql" ConnectionString='<%$ ConnectionStrings:logConnectionString %>' SelectCommand="SELECT CASE WHEN [csUserAgent] LIKE '%Chrome%' THEN 'Chrome' WHEN [csUserAgent] LIKE '%Firefox%' THEN 'Firefox' WHEN [csUserAgent] LIKE '%IE+%' THEN 'Internet Explorer' WHEN [csUserAgent] LIKE '%+rv:11%' THEN 'Internet Explorer' WHEN [csUserAgent] LIKE '%Opera%' THEN 'Opera' WHEN [csUserAgent] LIKE '%Safari%' THEN 'Safari' WHEN [csUserAgent] LIKE '%iPhone%' THEN 'Safari' WHEN [csUserAgent] LIKE '%CPU+OS+6%' THEN 'Safari' WHEN [csUserAgent] LIKE '%iTunes%' THEN 'iTunes' ELSE 'Kayıtlı Olmayan Tarayıcı' END AS browser, COUNT(DISTINCT cIp) AS Total FROM Kayit GROUP BY CASE WHEN [csUserAgent] LIKE '%Chrome%' THEN 'Chrome' WHEN [csUserAgent] LIKE '%Firefox%' THEN 'Firefox' WHEN [csUserAgent] LIKE '%IE+%' THEN 'Internet Explorer' WHEN [csUserAgent] LIKE '%+rv:11%' THEN 'Internet Explorer' WHEN [csUserAgent] LIKE '%Opera%' THEN 'Opera' WHEN [csUserAgent] LIKE '%Safari%' THEN 'Safari' WHEN [csUserAgent] LIKE '%iPhone%' THEN 'Safari' WHEN [csUserAgent] LIKE '%CPU+OS+6%' THEN 'Safari' WHEN [csUserAgent] LIKE '%iTunes%' THEN 'iTunes' ELSE 'Kayıtlı Olmayan Tarayıcı' END ORDER BY Total DESC"></asp:SqlDataSource>
                        <asp:ObjectDataSource runat="server" ID="browsers"></asp:ObjectDataSource>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-sm-6 margin-bottom-30">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title"></h3>
                    </div>
                    <div class="" style="overflow-y: auto;">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="browsersql" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="browser" HeaderText="Browserler" ReadOnly="True" SortExpression="browser"></asp:BoundField>
                                <asp:BoundField DataField="Total" HeaderText="Toplam Kullanım Sayısı" ReadOnly="True" SortExpression="Total"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>

