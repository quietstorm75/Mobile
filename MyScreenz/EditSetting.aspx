<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditSetting.aspx.cs" Inherits="MyScreenz.EditSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script>
        $(function () {
            $select = $('#settingselect');

            //request the JSON data and parse into the select element
            $.ajax({
                url: "UserRoles.aspx/GetSettings",
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $select.html('');
                    $.each(JSON.parse(data.d), function (key, val) {
                        $select.append('<option id="' + val.sid + '">' + val.sname + '</option>');
                    })
                },
                error: function (data) {
                    $select.html('<option id="-1">none available</option>');
                }
            });
        })
    </script>

    <div class="row">&nbsp;</div>
    <div class="mobilelook">
        <div class="row">
            <div class="form-group">
                <div class="input-group ui-widget">
                    <div class="input-group-addon">Setting Name:</div>
                    <select name="settingselect" id="settingselect" class="form-control"></select>
                </div>
            </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">
            <div class="form-group">
                <div class="input-group ui-widget">
                    <div class="input-group-addon">Setting Value:</div>
                    <div>
                        <input type="text" name="settingtext" class="form-control" placeholder="Enter Value for Setting" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">&nbsp;</div>

  <div class="row">
            <div class="form-group">
               
                <div>                    
                    <input type="checkbox" name="cbActiveCat" id="cbActiveCat"  />
                    <label class="activate-text">Activate Setting</label>
                </div>
            </div>
        </div>
        <div class="row">&nbsp;</div>
        <div>
            <input type="button" class="btn btn-primary" value="Update Setting" />
        </div>
    </div>

</asp:Content>
