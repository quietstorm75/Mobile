<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCategories.aspx.cs" Inherits="MyScreenz.ManageCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>


        $(function () {
            var $table = $("#row-display");
            var altclass = "";

            $.ajax({
                url: "UserRoles.aspx/GetCategories",
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var str = "";

                    $.each(JSON.parse(data.d), function (key, val) {
                        if (key % 2 === 0) {
                            altclass = 'rowsel';
                        }
                        else
                            altclass = 'altrow';

                        if (val.active)
                            str = "De-activate";
                        else
                            str = "Activate";

                        $table.append("<div class='row'>" +
                            //"<div class='" + altclass + "'>" +
                            "<div class='" + altclass + " col-md-2 col-sm-4 hidden-sm hidden-xs'>" + val.catid + "</div>" +
                            "<div class='" + altclass + " col-md-6 col-sm-6 col-xs-6'>" + val.catname + "</div>" +
                            "<div class='" + altclass + " col-md-2 col-sm-4 col-xs-2 hidden-sm hidden-xs'><a href='#' class='c_active'>" + str + "</a></div>" +
                            "<div class='" + altclass + " col-md-2 col-sm-6 col-xs-6'><a href='EditCategory.aspx?id=" + val.catid + "' class='c_edit'>Edit</a></div>" +
                            //"</div>" +
                            "</div>");
                    });

                },
                error: function (data) {
                    alert("failed")
                }
            });


        });

    </script>

    <div class="row">&nbsp;</div>
    <div class="mobilelook">
        <div class="table-hedge">
            <div class="row">
                <div class="table-header">
                    <div class="table-col-hdr col-md-2 col-sm-4 hidden-sm hidden-xs">ID</div>
                    <div class="table-col-hdr col-md-6 col-sm-6 col-xs-6 ">Name</div>                                   
                    <div class="table-col-hdr col-md-2 col-sm-4 col-xs-2 hidden-sm hidden-xs">Action</div>
                    <div class="table-col-hdr col-md-2 col-sm-6 col-xs-6">Edit</div>
                </div>
            </div>
            <div class="row">
               <div id="row-display"></div>
             </div>
        </div>
    </div>


</asp:Content>
