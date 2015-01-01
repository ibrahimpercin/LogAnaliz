<%@ Page Title="DDOS Saldırıları" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ddos.aspx.cs" Inherits="ddos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="templatemo-content">

        <h1>Yapılan DDOS saldırılar</h1>
        <div class="row">
            <div class="col-md-12 col-sm-6 margin-bottom-30">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Denenen DDOS Saldırıları</h3>
                    </div>
                    <div class="" style="overflow-y: auto;">
                        <asp:GridView ID="GridView1" runat="server" DataSourceID="ddoss" Width="100%"></asp:GridView>
                        <asp:ObjectDataSource runat="server" ID="ddoss" SelectMethod="ddos" TypeName="LoQuarryname.LogQuarry"></asp:ObjectDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

