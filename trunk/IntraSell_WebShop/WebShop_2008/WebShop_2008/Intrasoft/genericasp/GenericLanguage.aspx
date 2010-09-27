<%
    
    Dim bgcolor
    Dim QUOTE, LT, GT
   
    Dim strEditor As String, strType As String, strConn As String, strDisplay As String, strSearchFields As String
    Dim strFields As String, strTable As String, strWhere As String, strGroupBy As String, strOrderBy As String, strFieldNames As String, strFont As String
    Dim intAllowSort As Integer, intOrderBy As Integer, intPrimary As Integer, intFontSize As Integer
    Dim strBorderColor As String, strMenuColor As String, strMenuTextColor As String
    Dim strKey As String
    Dim strKeyField As String, IsSubTable As Boolean, IsSearch As Boolean, FormAction
    Dim SubmitValue, CaseUpdateValue, CaseAddValue
    
    
    Dim txtAdd, txtAddRecord, txtAdvancedSearch, txtAnyOfTheseWords, txtBackToList, txtDelete, txtDeletePrompt, txtDontCare, txtEdit, txtEditMode, txtError
    Dim txtErrorMsg1, txtErrorMsg2, txtErrorMsg3, txtErrorMsg4, txtErrorMsg5, txtErrorMsg6, txtErrorMsg7, txtErrorMsg8
    Dim txtExactPhrase, txtExit, txtFalse, txtInfo, txtList, txtNextPage, txtNo, txtOf, txtPreviousPage, txtRecords, txtRefresh, txtReset
    Dim txtSearch, txtSearchFailMsgA, txtSearchFailMsgB, txtSearchFor, txtSearchSubmit, txtTo, txtTotal, txtTrue, txtUpdate, txtView, txtYes

    'Generic Exit 
    Dim doGoSub As Boolean
    Dim doReset As Boolean
    Dim dbGoSub As Boolean
    Dim subkey As String
    Dim strCmd As String
    Dim xConn, xrs
    Dim strsql As String
    Dim intFieldCount As Integer
    ' Generic Database - German Language File
    ' Translator - Sven Hacker and Thomas Raoul
    ' Last Updated: 06 July 1999
 
    ' Submit button in Editor
    txtAdd = "Hinzufügen"
    ' New record link
    txtAddRecord = "Neuen Eintrag hinzufügen"
    ' Link back to lister
    txtBackToList = "Zurück zur Tabelle"
    ' Delete record link
    txtDelete = "Löschen"
    ' Prompt to confirm deletion
    txtDeletePrompt = "Diesen Datensatz löschen?"
    ' Edit record link
    txtEdit = "Bearbeiten"
    ' Appears in titlebar of Edit screens
    txtEditMode = "Bearbeiten"
    ' Error message text
    txtError = "Fehler"
    txtErrorMsg1 = "Ein Fehler ist aufgetreten"
    txtErrorMsg2 = "Mögliche Ursachen:"
    txtErrorMsg3 = "Sie besitzen keine Rechte, diese Seite anzuzeigen."
    txtErrorMsg4 = "Ihre 'Session' ist abgelaufen."
    txtErrorMsg5 = "Wenn dieses Problem wiederholt auftritt, benachrichtigen Sie bitte Ihren System-Administrator. "
    txtErrorMsg6 = "Bitte melden Sie obigen Fehler Ihrem System-Administrator. "
    txtErrorMsg7 = "Ihr System-Administrator wird wissen wollen, was Sie zuletzt gemacht haben, um diese Meldung zu erhalten."
    txtErrorMsg8 = "Laufzeit-Fehler."
    ' Link to ExitPage, can also be set with dbExitPageText
    txtExit = "Zurück"
    ' Used to display boolean fields
    txtFalse = "Nein"
    ' The link to GenericInfo.asp
    txtInfo = "db Info"
    ' Appears in titlebar of Lister
    txtList = "Tabelle"
    ' Next page link
    txtNextPage = "Nächste Seite"
    ' For confirm delete Yes/No, see txtTrue/txtFalse for boolean field display
    txtNo = "Nein"
    ' Of, as in "Records 1 to 10 of 34"
    txtOf = "von"
    ' Previous page link
    txtPreviousPage = "Vorige Seite"
    ' Records, as in "Records 1 to 10 of 34"
    txtRecords = "Datensätze"
    ' Refresh link
    txtRefresh = "Aktualisieren"
    ' Reset link and used with txtToSearchAgain
    txtReset = "Zurücksetzen"
    ' The first part of "Your search did not return any results. Press Reset to Search Again"
    txtSearchFailMsgA = "Es wurden keine passenden Einträge gefunden. Suche"
    ' The last part of "Your search did not return any results. Press Reset to Search Again"
    txtSearchFailMsgB = "und erneut suchen."
    txtSearchFor = "Nach"
    ' Search submit button text
    txtSearchSubmit = "Suchen"
    ' To, as in "Records 1 to 10 of 34"
    txtTo = "bis"
    ' Header for total row
    txtTotal = "Total:"
    ' Used to display boolean fields
    txtTrue = "Ja"
    ' Submit button to submit changes to a record
    txtUpdate = "Aktualisieren"
    ' Link to view record, also titlebar of Viewer
    txtView = "Ansicht"
    ' For confirm delete Yes/No
    txtYes = "Ja"
%>