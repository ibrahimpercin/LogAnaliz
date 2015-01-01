<%@ Page Title="DOS Saldırıları" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dos.aspx.cs" Inherits="Dos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="templatemo-content">
        
          <h1 >Yapılan Dos Saldırıları</h1>
    <div class="row">
              <div class="col-md-12 col-sm-6 margin-bottom-30">
                <div class="panel panel-primary">
                  <div class="panel-heading"><h3 class="panel-title">Yapılan Dos Saldırıları</h3></div>
                  <div class="" style="overflow-y:auto;">
                      <asp:GridView ID="GridView1" runat="server" DataSourceID="Dosatak"></asp:GridView>
                      <asp:ObjectDataSource runat="server" ID="Dosatak" SelectMethod="dos" TypeName="LoQuarryname.LogQuarry"></asp:ObjectDataSource>
                  </div>
                    </div>
                  </div>
        </div>
        </div>
</asp:Content>

