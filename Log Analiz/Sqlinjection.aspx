<%@ Page Title="Sql Açıkları" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sqlinjection.aspx.cs" Inherits="Sqlinjection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="templatemo-content-wrapper">
        <div class="templatemo-content">

            <h1>Sql Analizi</h1>
            <div class="row">
                <div class="col-md-12 col-sm-6 margin-bottom-30">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Denenen SQL Açıkları</h3>
                        </div>
                        <div class="" style="overflow-y: auto;">
                            <asp:GridView ID="GridView1" runat="server" DataSourceID="sqlaciklari"></asp:GridView>
                            <asp:ObjectDataSource runat="server" ID="sqlaciklari" SelectMethod="sqlacikleri" TypeName="LoQuarryname.LogQuarry"></asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-6 margin-bottom-30">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h3 class="panel-title">Bulunan SQL Açıkları</h3>
                        </div>
                        <asp:GridView ID="GridView2" runat="server" DataSourceID="sqlgecen"></asp:GridView>
                        <asp:ObjectDataSource runat="server" ID="sqlgecen" SelectMethod="gecensqlacikleri" TypeName="LoQuarryname.LogQuarry"></asp:ObjectDataSource>
                        <div class="" style="overflow-y: auto;">
                        </div>
                    </div>
                </div>
            </div>


        </div>

    </div>
</asp:Content>


