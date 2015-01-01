<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Yukleme.aspx.cs" Inherits="Yukleme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>Dosya Yükleyin</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width">        
  <link rel="stylesheet" href="css/templatemo_main.css">
     <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/Chart.min.js"></script>
    <script src="js/templatemo_script.js"></script>
</head>
     <script type="text/javascript">

         function openModal() {
             $('#confirmModal').modal({ show: true });
         }
 </script>
<body>
  

    <div id="main-wrapper">
        <div class="navbar navbar-inverse" role="navigation">
          <div class="navbar-header">
            <div class="logo"><h1>Log Analiz - Dosya Yükleme</h1></div>
          </div>   
        </div>
        <div class="template-page-wrapper">
          <form id="form1"  class="form-horizontal templatemo-signin-form" runat="server" >
            <div class="form-group" style="margin-top:175px">
                 <asp:PlaceHolder ID="MyPlaceholder" runat="server"></asp:PlaceHolder>
              <div class="alert alert-info alert-dismissible">
                  <div class="row">
                    <div class="col-md-12 margin-bottom-30">
                      <label for="exampleInputFile">Dosya Girişi</label>

                      <input type="file" id="InputFile" runat="server" accept=".log"/>
                      <p class="help-block">     
                      <asp:button  class="btn btn-primary" style="float:right"  text="Yolla"  runat="server" UseSubmitBehavior="true" data-backdrop="static" data-keyboard="false"  data-toggle="modal" data-target="#confirmModal" OnClick="upload_Click" ID="upload" CausesValidation="True" />
                 
                          .log Dosyanızı Buradan Yükleyebilirsiniz.</p>     
                 
                    </div>                  
                  
                  </div>
              </div> 
            </div>                 

            </form>
   
        </div>

        <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" id="myModalLabel">İşlem Yapılıyor Lütfen Bekleyin</h4>
            </div>
              <div class="modal-body">
            <img src="css/loading.gif" class="img-responsive">
        </div>
          
          </div>
        </div>
      </div>
  </div>
  
</body>

</html>
