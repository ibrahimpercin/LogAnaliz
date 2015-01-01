<%@ Page Title="Hata Sayıları" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="hatalar.aspx.cs" Inherits="hatalar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="templatemo-content-wrapper">
        <div class="templatemo-content">

            <h1>Hata Özeti</h1>
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">Hata Türleri</div>
  <div class="panel-body">
   
  </div>
                    <!-- Default panel contents -->
                    

                    <!-- List group -->
                    <ul class="list-group">
                        <li class="list-group-item">
                            <span class="badge"><% =hata400 %></span>
                            400 Hatası sayısı
                        </li>
                        <li class="list-group-item">
                            <span class="badge"><% =hata403 %></span>
                            403 Hatası sayısı
                        </li>
                        <li class="list-group-item">
                            <span class="badge"><% =hata404 %></span>
                            404 Hatası sayısı
                        </li>
                        <li class="list-group-item">
                            <span class="badge"><% =hata416 %></span>
                            416 Hatası sayısı
                        </li>
                        <li class="list-group-item">
                            <span class="badge"><% =hata500 %></span>
                            500 Hatası sayısı
                        </li>
                    </ul>
                </div>

            </div>
  
         
        <div class="row">
            <div class="panel panel-default">
                
                <div class="panel-heading">Hit Sayıları</div>
                <center>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2">
                    <Series>
                        <asp:Series Name="Series1" ChartType="Doughnut" CustomProperties="PieLineColor=Aqua, PieLabelStyle=Outside" IsValueShownAsLabel="True" XValueMember="scStatus" YValueMembers="Sayısı"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:logConnectionString %>' SelectCommand="SELECT scStatus, COUNT(*) AS Sayısı FROM Kayit WHERE (scStatus >= 400) GROUP BY scStatus"></asp:SqlDataSource>
            </center>
                    </div>
        </div>
             </div>
        </div>
    
</asp:Content>

