<%@ Page Title="XSS Açıkları" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="xssaciklari.aspx.cs" Inherits="xssaciklari" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
        
          <h1 >XSS Açığı Analizi</h1>
          <div class="row">
              <div class="col-md-12 col-sm-6 margin-bottom-30">
                <div class="panel panel-primary">
                  <div class="panel-heading"><h3 class="panel-title">Denenen XSS Açıkları</h3></div>
                  <div class="" style="overflow-y:auto;">
                      <asp:GridView ID="XSSdeneme" runat="server" DataSourceID="xssacik" RowStyle-BorderStyle="None" Width="100%" BackColor="White" CellPadding="3">
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
                      <asp:ObjectDataSource runat="server" ID="xssacik" SelectMethod="xssaciklari" TypeName="LoQuarryname.LogQuarry"></asp:ObjectDataSource>
                  </div>
                </div>
              </div>   
          </div>
            <div class="row">
              <div class="col-md-12 col-sm-6 margin-bottom-30">
                <div class="panel panel-danger">
                  <div class="panel-heading"><h3 class="panel-title">Bulunan XSS Açıkları</h3></div>
                  <div class="" style="overflow-y:auto;">
                      <asp:GridView ID="gecenxss" runat="server" Width="100%" DataSourceID="gecenxssaciklari" RowStyle-BorderStyle="None" BackColor="White" CellPadding="3">
                          <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

                          <HeaderStyle BackColor="#f2dede" Font-Bold="True" ForeColor="White"></HeaderStyle>

                          <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>

                          <RowStyle ForeColor="#000066"></RowStyle>

                          <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                          <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                          <SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

                          <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                          <SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
                      </asp:GridView>

                      <asp:ObjectDataSource runat="server" ID="gecenxssaciklari" SelectMethod="gecenxssaciklari" TypeName="LoQuarryname.LogQuarry"></asp:ObjectDataSource>
                  </div>
                </div>
                
              </div>   
        </div>
      </div>
     
</div>
</asp:Content>

