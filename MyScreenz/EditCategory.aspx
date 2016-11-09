<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCategory.aspx.cs" Inherits="MyScreenz.EditCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script>
        var catLst =[]; var catChk=[];
        $(function () {
            $select = $('#categoryname');
            $checkbox = $("#cbActiveCat");

            var query = window.location.search.substring(1);
            var id = query.split("=");
            //request the JSON data and parse into the select element
            $.ajax({
                url: "UserRoles.aspx/GetCategories",                
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var i = 1;
                    $select.html('');
                    $.each(JSON.parse(data.d), function (key, val) {
                        catLst[i] = val.catname;
                        catChk[i] = val.active;
                        i++;
                    });
                    $select.val(catLst[id[1]]);
                    if (catChk[id[1]])
                        $checkbox.attr("checked", "checked");
                },
                error: function (data) {
                    $select.val('No data available');
                }
            });
            
            
        })
    </script>

    <div class="row">&nbsp;</div>
    <div class="mobilelook">
        <div class="row">
            <div class="form-group">
                <div class="input-group ui-widget">
                    <div class="input-group-addon"><label>Category Name:</label></div>
                    <input type="text" id="categoryname" name="categoryname" class="form-control" />
                   <%-- <select name="catselect" id="catselect" class="form-control"></select>--%>
                </div>
            </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">
            <div class="form-group">
               
                <div>                    
                    <input type="checkbox" name="cbActiveCat" id="cbActiveCat"  />
                    <label class="activate-text">Activate Category</label>
                </div>
            </div>
        </div>
        <div class="row">&nbsp;</div>
        <div>
            <input type="button" class="btn btn-primary" id="btnupdate" name="btnupdate" value="Update Category" />
        </div>
    </div>

</asp:Content>
