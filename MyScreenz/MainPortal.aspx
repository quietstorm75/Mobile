<%@ Page Title="" Language="C#" MasterPageFile="~/Navigation.Master" AutoEventWireup="true" CodeBehind="MainPortal.aspx.cs" Inherits="MyScreenz.MainPortal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

        <link href="Content/themes/base/jquery-ui.min.css" rel="stylesheet" />
    <script>               
 var roleLst =[];
        $(function () {
           
            $.ajax({
                url: "UserRoles.aspx/GetRoles",
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var i = 0;
                    $.each(JSON.parse(data.d), function (key, val) {
                        //roleLst.push({ role: val.rolename })
                        roleLst[i] = val.rolename;
                        i++;
                    });



                    $("#tags").autocomplete({
                        source: roleLst, minLength:3
                    })
                },
                error: function (data) { }
            });

           
        });

    </script>

    <div class="row">&nbsp;</div>
    <div class="mobilelook">
        <div class="row">
            <div class="form-group col-md-4">
                 <div >                     
                     <div><input id="btnMeeting" class="btn-tablet" type="button" value="Upcoming Meetings" /></div>
                 </div>
            </div>     
            
            <div class="form-group  col-md-4">
                 <div >                     
                     <div><input id="btnCalendar" class="btn-tablet" type="button" value="View Calendar" /></div>
                 </div>
            </div>     
            
            <div class="form-group  col-md-4">
                 <div >                     
                     <div><input id="btnDirectory" class="btn-tablet" type="button" value="View Directory" /></div>
                 </div>
            </div>            
        </div>
        <div class="row">&nbsp;</div>
     
    </div>
          <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
</asp:Content>
