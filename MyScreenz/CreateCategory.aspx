<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateCategory.aspx.cs" Inherits="MyScreenz.CreateCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <link href="Content/themes/base/jquery-ui.min.css" rel="stylesheet" />
    <%--<script src="~/Scripts/jquery.validate.unobtrusive.min.js"></script>--%>
    <script>               
 var catLst =[];
        $(function () {
           
            $.ajax({
                url: "UserRoles.aspx/GetCategories",
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var i = 0;
                    $.each(JSON.parse(data.d), function (key, val) {
                        //roleLst.push({ role: val.rolename })
                        catLst[i] = val.catname;
                        i++;
                    });



                    $("#tags").autocomplete({
                        source: catLst, minLength: 3
                    })
                },
                error: function (data) {
                    alert("failed")}
            });

           
        });

    </script>

    <div class="row">&nbsp;</div>
    <div class="mobilelook">
        <div class="row">
            <div class="form-group">
                 <div class="input-group ui-widget">
                     <div class="input-group-addon"><label for="tags">Category Name:</label></div>
                     <input id="tags" data-val="true" data-val-required=" " class="form-control" placeholder="Enter New Category Name" />
                 </div>
            </div>            
        </div>
        <div class="row">&nbsp;</div>
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="Create Category" />
        </div>
    </div>
    <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
        
</asp:Content>
