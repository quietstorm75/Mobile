<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageSettings.aspx.cs" Inherits="MyScreenz.ManageSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>


        $(function () {
            var $table = $("#row-display");
            var altclass = "";

            $.ajax({
                url: "UserRoles.aspx/GetUsers",
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
                            "<div class='" + altclass + " col-md-2 col-sm-4 hidden-sm hidden-xs'>" + val.userid + "</div>" +
                            "<div class='" + altclass + " col-md-4 col-sm-10 col-xs-6'>" + val.username + "</div>" +
                            "<div class='" + altclass + " col-md-3 col-sm-5 col-xs-3 hidden-sm hidden-xs'>" + val.useremail + "</div>" +
                            "<div class='" + altclass + " col-md-2 col-sm-4 col-xs-2 hidden-sm hidden-xs'><a href='#' class='c_active'>" + str + "</a></div>" +
                            "<div class='" + altclass + " col-md-1 col-sm-2 col-xs-6'>[<a href='EditSetting.aspx?id=" + val.userid + "' class='c_edit'>Edit</a>]</div>" +
                           
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
        <div class="row">
            <div class="sectionhdr">Manage User</div>
        </div>
        <div class="table-hedge">
            <div class="row">
                <div class="table-header">
                    <div class="table-col-hdr col-md-2 col-sm-4 hidden-sm hidden-xs">ID</div>
                    <div class="table-col-hdr col-md-4 col-sm-10 col-xs-6 ">Name</div>
                    <div class="table-col-hdr col-md-3 col-sm-5 hidden-sm hidden-xs">Email</div>
                    <div class="table-col-hdr col-md-2 col-sm-4 hidden-sm hidden-xs">Action</div>
                    <div class="table-col-hdr col-md-1 col-sm-2 col-xs-6">Edit</div>
                </div>
            </div>
            <div class="row">
                <div id="row-display"></div>
            </div>
        </div>
    </div>


</asp:Content>
