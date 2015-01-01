<%@ Page Title="Erişim Özellikleri" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Erisimvaktitleri.aspx.cs" Inherits="Erişimaktiveteleri" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="templatemo-content-wrapper">
        <div class="templatemo-content">

            <h1>Erişim Analizi</h1>
            <div class="row">
                <div class="col-md-12 col-sm-6 margin-bottom-30">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">En Çok Giriş Alan Sayfalar</h3>
                        </div>
                        <div class="" style="overflow-y: auto;">
                            <asp:GridView ID="Sayfaerişim" runat="server" RowStyle-BorderStyle="None" Width="100%" BackColor="White" CellPadding="3" DataSourceID="sayfaerisimsource">
                                <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

                                <HeaderStyle BackColor="#428bca" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>

                                <RowStyle ForeColor="#000066"></RowStyle>

                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                                <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                                <SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

                                <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                                <SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
                            </asp:GridView>
                            <asp:ObjectDataSource runat="server" ID="sayfaerisimsource" SelectMethod="Encokgirilensayfa" TypeName="LoQuarryname.LogQuarry"></asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 margin-bottom-30">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">En Çok Giriş Alan Sayfalar İstatistik</h3>
                        </div>
                        <div class="" style="overflow-y: auto; vertical-align: central">
                            <center>
                            <asp:Chart ID="Chart1" runat="server" DataSourceID="charsql" Height="400px" Width="500px">
                                <Series>
                                    <asp:Series Name="Series1" XValueMember="Sayfa Adresi" YValueMembers="Toplam Hit" Font="Arial Narrow, 21.75pt, style=Bold" ChartType="StackedBar">
                                        <SmartLabelStyle AllowOutsidePlotArea="Yes" />
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                        <Area3DStyle Enable3D="True" LightStyle="Realistic" WallWidth="3" Inclination="25" Rotation="40" />
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                                </center>
                            <asp:SqlDataSource ID="charsql" runat="server" ConnectionString="<%$ ConnectionStrings:logConnectionString %>" SelectCommand="SELECT TOP (6) csUriStem AS [Sayfa Adresi], COUNT(*) AS [Toplam Hit] FROM Kayit WHERE (csUriStem NOT LIKE '%jpg') AND (csUriStem NOT LIKE '%png') AND (csUriStem NOT LIKE '%gif') AND (csUriStem NOT LIKE '%ico') AND (csUriStem NOT LIKE '%js') AND (csUriStem NOT LIKE '%css') AND (csUriStem NOT LIKE '%ttf') AND (csUriStem NOT LIKE '%woff') GROUP BY csUriStem ORDER BY [Toplam Hit] DESC"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-sm-6 margin-bottom-30" style="float:right">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Saatlik Giriş İstatistiği</h3>
                        </div>
                        <div class="" style="overflow-y: auto; vertical-align: central">
                            <center>
                            <asp:Chart ID="Chart2" runat="server" DataSourceID="saatlikgirissource" Height="400px" Width="500px">
                                <Series>
                                    <asp:Series Name="Series1" XValueMember="Başlangıç Zamanı" YValueMembers="Giriş Sayısı" Font="Arial Narrow, 21.75pt, style=Bold" ChartType="Line" CustomProperties="EmptyPointValue=Zero" IsXValueIndexed="True" MarkerSize="1" XValueType="Time" YValuesPerPoint="20">
                                        <SmartLabelStyle AllowOutsidePlotArea="Yes" />
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                        <Area3DStyle LightStyle="Realistic" WallWidth="3" Inclination="25" Rotation="40" />
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                                <asp:SqlDataSource ID="saatlikgirissource" runat="server" ConnectionString="<%$ ConnectionStrings:logConnectionString %>" SelectCommand="SELECT CONVERT (varchar(10), CAST(DATEADD(hh, FLOOR(DATEDIFF(hh, 0, CAST(Datetime AS TIME)) / 1) * 1, 0) AS time), 120) AS [Başlangıç Zamanı], COUNT(DISTINCT cIp) AS [Giriş Sayısı] FROM Kayit GROUP BY CONVERT  (varchar(10),CAST(DATEADD(hh, FLOOR(DATEDIFF(hh, 0, CAST(Datetime AS TIME)) / 1) * 1, 0) AS time),120) ORDER BY [Başlangıç Zamanı]"></asp:SqlDataSource>
                                </center>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:logConnectionString %>" SelectCommand="SELECT TOP (6) csUriStem AS [Sayfa Adresi], COUNT(*) AS [Toplam Hit] FROM Kayit WHERE (csUriStem NOT LIKE '%jpg') AND (csUriStem NOT LIKE '%png') AND (csUriStem NOT LIKE '%gif') AND (csUriStem NOT LIKE '%ico') AND (csUriStem NOT LIKE '%js') AND (csUriStem NOT LIKE '%css') AND (csUriStem NOT LIKE '%ttf') AND (csUriStem NOT LIKE '%woff') GROUP BY csUriStem ORDER BY [Toplam Hit] DESC"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-6 margin-bottom-30">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">En Çok Giriş Alan Sayfalar</h3>
                        </div>
                        <div class="" style="overflow-y: auto;">
                            <asp:GridView ID="top20giris" runat="server" RowStyle-BorderStyle="None" Width="100%" BackColor="White" CellPadding="3" DataSourceID="top20girissource">
                                <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

                                <HeaderStyle BackColor="#428bca" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>

                                <RowStyle ForeColor="#000066"></RowStyle>

                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                                <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                                <SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

                                <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                                <SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
                            </asp:GridView>
                            <asp:ObjectDataSource runat="server" ID="top20girissource" SelectMethod="top20giris" TypeName="LoQuarryname.LogQuarry"></asp:ObjectDataSource>
                            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="Encokgirilensayfa" TypeName="LoQuarryname.LogQuarry"></asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</asp:Content>

