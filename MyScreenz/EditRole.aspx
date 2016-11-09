<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditRole.aspx.cs" Inherits="MyScreenz.EditRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
<script>               

    $(function () {
        var $select = $('#roleselect');

        //request the JSON data and parse into the select element
        $.ajax({
            url: "UserRoles.aspx/GetRoles",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (data) {
                $select.html('');
                $.each(JSON.parse(data.d), function (key, val) {
                    $select.append('<option id="' + val.roleid + '">' + val.rolename + '</option>');
                })
            },
            error: function (data) {
                $select.html('<option id="-1">none available</option>');
            }
        });
    });

</script>

    <div class="row">&nbsp;</div>
    <div class="mobilelook">
        <div class="row">
            <div class="form-group">
                 <div class="input-group ui-widget">
                     <div class="input-group-addon"><label>Role Name:</label></div>                     
                     <select name="roleselect" id="roleselect" class="form-control"></select>
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
        <div >
            <input type="submit" class="btn btn-primary" value="Update Role" />
        </div>
    </div>
      
</asp:Content>
