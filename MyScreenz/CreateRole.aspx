<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateRole.aspx.cs" Inherits="MyScreenz.CreateRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
            <div class="form-group">
                 <div class="input-group ui-widget">
                     <div class="input-group-addon"><label>Role Name:</label></div>
                     <input id="tags" class="form-control" data-val='true' data-val-required='This is a required field' placeholder="Enter New Role Name" />
                 </div>
            </div>            
        </div>
        <div class="row">&nbsp;</div>
        <div class="">
            <input type="button" class="btn btn-primary" value="Create Role" />
        </div>
    </div>
          <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
</asp:Content>
