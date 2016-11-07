<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateSetting.aspx.cs" Inherits="MyScreenz.CreateSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Content/themes/base/jquery-ui.min.css" rel="stylesheet" />
    <script>               
 var settingLst =[];
        $(function () {
           
            $.ajax({
                url: "UserRoles.aspx/GetSettings",
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var i = 0;
                    $.each(JSON.parse(data.d), function (key, val) {
                        //roleLst.push({ role: val.rolename })
                        settingLst[i] = val.sname;
                        i++;
                    });



                    $("#tags").autocomplete({
                        source: settingLst, minLength: 3
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
                     <div class="input-group-addon">Setting Name:</div>
                     <input id="tags" class="form-control" data-val="true" data-val-required="The name field is required" placeholder="Enter New Setting Name" />
                 </div>
            </div>            
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">
            <div class="form-group">
                <div class="input-group ui-widget">
                    <div class="input-group-addon">Setting Value:</div>
                    <div>
                        <input type="text" name="settingtext" data-val="true" data-val-required="The value field is required" class="form-control" placeholder="Enter Value for Setting" /></div>
                </div>
            </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="Create Setting" />
        </div>
    </div>
         <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
    
</asp:Content>
