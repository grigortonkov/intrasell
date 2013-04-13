<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IntraSell._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <p>
        Welcome to the IntraSell WebShop Web Services!</p>
    <form id="form1" runat="server">
    <asp:Button ID="btnStartWorkflow" runat="server" OnClick="btnStart_Click" Text="Start Workflow" />
    <asp:Button ID="btnGetCount" runat="server" OnClick="btnGetCount_Click" Text="Get Workflow Count" />
    <asp:Button ID="btnRelease" runat="server" OnClick="btnRelease_Click" Text="Freigabe Event" />
    <p>
        GUID:
        <asp:TextBox ID="txtProcessId" runat="server" Width="297px"></asp:TextBox>
    </p>
    </form>
</body>
</html>
