<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <title>Ana Sayfa</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="templatemo-content-wrapper">
        <div class="templatemo-content">

            <h1>Genel Özet</h1>
            <div class="row">
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                     <div class="panel-heading">Hit Sayıları</div>
  <div class="panel-body">
   
  </div>
                    <!-- List group -->
                    <ul class="list-group">
                        <li class="list-group-item">
                            <span class="badge"><% =toplamtik %></span>
                            Toplam Giriş Sayısı
                        </li>
                        <li class="list-group-item">
                            <span class="badge"><% =duzgungırıs %></span>
                            Hatasız Giriş Yapan Tekil İp Sayısı
                        </li>
                        <li class="list-group-item">
                            <span class="badge"><% =hatalitik %></span>
                            Hatalı Tık Sayısı
                        </li>
                        <li class="list-group-item">
                            <span class="badge"><% =bothit %></span>
                            Toplam Bot Hit Sayısı
                        </li>
                        <li class="list-group-item">
                            <span class="badge"><% =spiderhit %></span>
                            Toplam Spider Sayısı
                        </li>
                    </ul>
                </div>

            </div>
            <div class="row">
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading">Sayfa Görüntülenme</div>
                    <div class="panel-body">
   
  </div>
                    <!-- List group -->
                    <ul class="list-group">
                        <li class="list-group-item">
                            <span class="badge"><% =toplamsayfa %></span>
                            Toplam Sayfa Görüntülenme
                        </li>
                        <li class="list-group-item">
                            <span class="badge"><% =hatasayisi %></span>
                            Hatalı Sayfa Görme Olasılığı
                        </li>
                        <li class="list-group-item">
                            <span class="badge"><% =sayfagoruntulenmeort %></span>
                            Kullanıcların Sayfa Görüntüleme Ortalaması

                        </li>

                    </ul>
                </div>

            </div>

            <div class="row">
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading">Sayfa Veri Aktarımı</div>
                    <div class="panel-body">
   
  </div>
                    <!-- List group -->
                    <ul class="list-group">
                        <li class="list-group-item">
                            <span class="badge"><% =gelenveri %></span>
                            Toplam Gelen Veri
                        </li>
                        <li class="list-group-item">
                            <span class="badge"><% =gidenveri %></span>
                            Toplam Gönderilen Veri
                        </li>

                    </ul>
                </div>

            </div>

        </div>
    </div>


</asp:Content>

