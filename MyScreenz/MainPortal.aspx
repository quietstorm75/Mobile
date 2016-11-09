<%@ Page Title="" Language="C#" MasterPageFile="~/Navigation.Master" AutoEventWireup="true" CodeBehind="MainPortal.aspx.cs" Inherits="MyScreenz.MainPortal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    
    <link href="Content/fullcalendar.min.css" rel="stylesheet" />
    <script src="Scripts/lib/moment.min.js"></script>
    <script src="Scripts/fullcalendar.min.js"></script>

    <script>       
        
        $(function () {
            $('#calendar').fullCalendar({
                // put your options and callbacks here
            })
        });

    </script>

    <div class="row">&nbsp;</div>
    <div class="mobilelook" style="color:#000;">
        <div id='calendar'></div>
      
    </div>
   
</asp:Content>
