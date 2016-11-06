<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserRoles.aspx.cs" Inherits="MyScreenz.UserRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script>

        

        $(function () {
            //does not work yet
            $checkboxItem = $(".rolechecked");
            $.each($(".rolechecked"),function(){
                $(this).click(function (e) {
                    alert("hello")
                    if ($(this).checked) {                   
                        $(this).addClass("checked");
                    }
                    else {
                        $(this).removeClass("checked");
                    }

                });
            });

            $select = $('#userselect');
            $roles = $('#roleitems');
            //request the JSON data and parse into the select element
            $.ajax({
                url: "UserRoles.aspx/GetUsers",
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {

                    $select.html('');

                    $.each(JSON.parse(data.d), function (key, val) {

                        $select.append('<option id="' + key.userid + '">' + val.username + '</option>');
                    })
                },
                error: function (data) {
                    $select.html('<option id="-1">none available</option>');
                }
            });


            $.ajax({
                url: "UserRoles.aspx/GetRoles",
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $roles.html('');
                    $.each(JSON.parse(data.d), function (key, val) {
                        $roles.append('<li class="listset"><label class="control-label">' + val.rolename + '</label><input class="cblayout rolechecked" type="checkbox" name=""></li>');
                    });

                    //$.each(data.user, function(key, val){
                    //    $select.append(('<option>').text(value).attr('value', value));
                    //   // $('#userselect').append(optionHtml);


                    // });
                },
                error: function (response) {
                    alert("not cool");
                }

            });

        });

        function BindSelect(p) {



        }

    </script>

    <div class="row">&nbsp;</div>
    <div class="mobilelook">
        <div class="row">
             <div class="input-group">
                    <div class="input-group-addon">Select User:</div>
                    <select name="userselect" id="userselect" class="form-control">
                    </select>
                 </div>
        </div>

        <div class="row">
            <label class="control-label">Roles:(check user roles)</label>
        </div>

        <div id="roleschoice" class="row">
            <div id="roles" class="roles">
                <div>
                    <ul id="roleitems"></ul>
                </div>
            </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="col-offset-lg-8">
            <input type="submit" class="btn btn-primary" value="Add User Roles" />
        </div>
    </div>

</asp:Content>
