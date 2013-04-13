Public Class m
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Write("isMobileBrowser=" & isMobileBrowser())
    End Sub


    Public Function isMobileBrowser() As Boolean

        ' GETS THE CURRENT USER CONTEXT
        Dim context As HttpContext = HttpContext.Current

        'FIRST TRY BUILT IN ASP.NT CHECK
        If (context.Request.Browser.IsMobileDevice) Then
            Return True
        End If

        ' THEN TRY CHECKING FOR THE HTTP_X_WAP_PROFILE HEADER
        If Not IsNothing(context.Request.ServerVariables("HTTP_X_WAP_PROFILE")) Then
            Return True
        End If

        ' THEN TRY CHECKING THAT HTTP_ACCEPT EXISTS AND CONTAINS WAP
        If Not IsNothing(context.Request.ServerVariables("HTTP_ACCEPT")) And context.Request.ServerVariables("HTTP_ACCEPT").ToLower().Contains("wap") Then
            Return True
        End If

        Return False
    End Function

End Class