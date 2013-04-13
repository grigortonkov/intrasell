<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class VorgangKonvertieren
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim NummerLabel As System.Windows.Forms.Label
        Dim TypLabel As System.Windows.Forms.Label
        Dim KundNrLabel As System.Windows.Forms.Label
        Dim Label1 As System.Windows.Forms.Label
        Dim Label2 As System.Windows.Forms.Label
        Dim Label3 As System.Windows.Forms.Label
        Me.TableLayoutPanel1 = New System.Windows.Forms.TableLayoutPanel()
        Me.OK_Button = New System.Windows.Forms.Button()
        Me.Cancel_Button = New System.Windows.Forms.Button()
        Me.NummerTextBox = New System.Windows.Forms.TextBox()
        Me.TypComboBox = New System.Windows.Forms.ComboBox()
        Me.NummerNachTextBox = New System.Windows.Forms.TextBox()
        Me.TypNachComboBox = New System.Windows.Forms.ComboBox()
        Me.CheckBoxAbschliessen = New System.Windows.Forms.CheckBox()
        Me.KundNrNachAdressenControl = New IntraSell_Net.AdressenControl()
        Me.KundNrAdressenControl = New IntraSell_Net.AdressenControl()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        NummerLabel = New System.Windows.Forms.Label()
        TypLabel = New System.Windows.Forms.Label()
        KundNrLabel = New System.Windows.Forms.Label()
        Label1 = New System.Windows.Forms.Label()
        Label2 = New System.Windows.Forms.Label()
        Label3 = New System.Windows.Forms.Label()
        Me.TableLayoutPanel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'NummerLabel
        '
        NummerLabel.AutoSize = True
        NummerLabel.Location = New System.Drawing.Point(70, 84)
        NummerLabel.Name = "NummerLabel"
        NummerLabel.Size = New System.Drawing.Size(49, 13)
        NummerLabel.TabIndex = 15
        NummerLabel.Text = "Nummer:"
        '
        'TypLabel
        '
        TypLabel.AutoSize = True
        TypLabel.Location = New System.Drawing.Point(70, 57)
        TypLabel.Name = "TypLabel"
        TypLabel.Size = New System.Drawing.Size(28, 13)
        TypLabel.TabIndex = 16
        TypLabel.Text = "Typ:"
        '
        'KundNrLabel
        '
        KundNrLabel.AutoSize = True
        KundNrLabel.Location = New System.Drawing.Point(70, 30)
        KundNrLabel.Name = "KundNrLabel"
        KundNrLabel.Size = New System.Drawing.Size(41, 13)
        KundNrLabel.TabIndex = 17
        KundNrLabel.Text = "Kunde:"
        '
        'Label1
        '
        Label1.AutoSize = True
        Label1.Location = New System.Drawing.Point(70, 219)
        Label1.Name = "Label1"
        Label1.Size = New System.Drawing.Size(49, 13)
        Label1.TabIndex = 21
        Label1.Text = "Nummer:"
        '
        'Label2
        '
        Label2.AutoSize = True
        Label2.Location = New System.Drawing.Point(70, 192)
        Label2.Name = "Label2"
        Label2.Size = New System.Drawing.Size(28, 13)
        Label2.TabIndex = 22
        Label2.Text = "Typ:"
        '
        'Label3
        '
        Label3.AutoSize = True
        Label3.Location = New System.Drawing.Point(70, 165)
        Label3.Name = "Label3"
        Label3.Size = New System.Drawing.Size(41, 13)
        Label3.TabIndex = 23
        Label3.Text = "Kunde:"
        '
        'TableLayoutPanel1
        '
        Me.TableLayoutPanel1.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.TableLayoutPanel1.ColumnCount = 2
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.TableLayoutPanel1.Controls.Add(Me.OK_Button, 0, 0)
        Me.TableLayoutPanel1.Controls.Add(Me.Cancel_Button, 1, 0)
        Me.TableLayoutPanel1.Location = New System.Drawing.Point(277, 274)
        Me.TableLayoutPanel1.Name = "TableLayoutPanel1"
        Me.TableLayoutPanel1.RowCount = 1
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.TableLayoutPanel1.Size = New System.Drawing.Size(146, 29)
        Me.TableLayoutPanel1.TabIndex = 0
        '
        'OK_Button
        '
        Me.OK_Button.Anchor = System.Windows.Forms.AnchorStyles.None
        Me.OK_Button.Enabled = False
        Me.OK_Button.Location = New System.Drawing.Point(3, 3)
        Me.OK_Button.Name = "OK_Button"
        Me.OK_Button.Size = New System.Drawing.Size(67, 23)
        Me.OK_Button.TabIndex = 0
        Me.OK_Button.Text = "OK"
        '
        'Cancel_Button
        '
        Me.Cancel_Button.Anchor = System.Windows.Forms.AnchorStyles.None
        Me.Cancel_Button.DialogResult = System.Windows.Forms.DialogResult.Cancel
        Me.Cancel_Button.Location = New System.Drawing.Point(76, 3)
        Me.Cancel_Button.Name = "Cancel_Button"
        Me.Cancel_Button.Size = New System.Drawing.Size(67, 23)
        Me.Cancel_Button.TabIndex = 1
        Me.Cancel_Button.Text = "Cancel"
        '
        'NummerTextBox
        '
        Me.NummerTextBox.Enabled = False
        Me.NummerTextBox.Location = New System.Drawing.Point(128, 81)
        Me.NummerTextBox.Name = "NummerTextBox"
        Me.NummerTextBox.Size = New System.Drawing.Size(131, 20)
        Me.NummerTextBox.TabIndex = 14
        '
        'TypComboBox
        '
        Me.TypComboBox.Enabled = False
        Me.TypComboBox.FormattingEnabled = True
        Me.TypComboBox.Location = New System.Drawing.Point(128, 54)
        Me.TypComboBox.Name = "TypComboBox"
        Me.TypComboBox.Size = New System.Drawing.Size(131, 21)
        Me.TypComboBox.TabIndex = 13
        '
        'NummerNachTextBox
        '
        Me.NummerNachTextBox.Enabled = False
        Me.NummerNachTextBox.Location = New System.Drawing.Point(128, 216)
        Me.NummerNachTextBox.Name = "NummerNachTextBox"
        Me.NummerNachTextBox.Size = New System.Drawing.Size(131, 20)
        Me.NummerNachTextBox.TabIndex = 20
        '
        'TypNachComboBox
        '
        Me.TypNachComboBox.FormattingEnabled = True
        Me.TypNachComboBox.Location = New System.Drawing.Point(128, 189)
        Me.TypNachComboBox.Name = "TypNachComboBox"
        Me.TypNachComboBox.Size = New System.Drawing.Size(131, 21)
        Me.TypNachComboBox.TabIndex = 19
        '
        'CheckBoxAbschliessen
        '
        Me.CheckBoxAbschliessen.AutoSize = True
        Me.CheckBoxAbschliessen.Location = New System.Drawing.Point(128, 107)
        Me.CheckBoxAbschliessen.Name = "CheckBoxAbschliessen"
        Me.CheckBoxAbschliessen.Size = New System.Drawing.Size(87, 17)
        Me.CheckBoxAbschliessen.TabIndex = 24
        Me.CheckBoxAbschliessen.Text = "abschliessen"
        Me.CheckBoxAbschliessen.UseVisualStyleBackColor = True
        '
        'KundNrNachAdressenControl
        '
        Me.KundNrNachAdressenControl.IDNR = 0
        Me.KundNrNachAdressenControl.Location = New System.Drawing.Point(128, 158)
        Me.KundNrNachAdressenControl.Name = "KundNrNachAdressenControl"
        Me.KundNrNachAdressenControl.Size = New System.Drawing.Size(131, 25)
        Me.KundNrNachAdressenControl.TabIndex = 18
        '
        'KundNrAdressenControl
        '
        Me.KundNrAdressenControl.IDNR = 0
        Me.KundNrAdressenControl.Location = New System.Drawing.Point(128, 23)
        Me.KundNrAdressenControl.Name = "KundNrAdressenControl"
        Me.KundNrAdressenControl.Size = New System.Drawing.Size(131, 25)
        Me.KundNrAdressenControl.TabIndex = 12
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(12, 9)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(73, 13)
        Me.Label4.TabIndex = 25
        Me.Label4.Text = "VON Vorgang"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(12, 142)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(80, 13)
        Me.Label5.TabIndex = 26
        Me.Label5.Text = "NACH Vorgang"
        '
        'VorgangKonvertieren
        '
        Me.AcceptButton = Me.OK_Button
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.CancelButton = Me.Cancel_Button
        Me.ClientSize = New System.Drawing.Size(435, 315)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.CheckBoxAbschliessen)
        Me.Controls.Add(Me.KundNrNachAdressenControl)
        Me.Controls.Add(Label1)
        Me.Controls.Add(Me.NummerNachTextBox)
        Me.Controls.Add(Label2)
        Me.Controls.Add(Me.TypNachComboBox)
        Me.Controls.Add(Label3)
        Me.Controls.Add(Me.KundNrAdressenControl)
        Me.Controls.Add(NummerLabel)
        Me.Controls.Add(Me.NummerTextBox)
        Me.Controls.Add(TypLabel)
        Me.Controls.Add(Me.TypComboBox)
        Me.Controls.Add(KundNrLabel)
        Me.Controls.Add(Me.TableLayoutPanel1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "VorgangKonvertieren"
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent
        Me.Text = "Vorgang Konvertieren"
        Me.TableLayoutPanel1.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents TableLayoutPanel1 As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents OK_Button As System.Windows.Forms.Button
    Friend WithEvents Cancel_Button As System.Windows.Forms.Button
    Friend WithEvents KundNrAdressenControl As IntraSell_Net.AdressenControl
    Friend WithEvents NummerTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TypComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents KundNrNachAdressenControl As IntraSell_Net.AdressenControl
    Friend WithEvents NummerNachTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TypNachComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents CheckBoxAbschliessen As System.Windows.Forms.CheckBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label

End Class
