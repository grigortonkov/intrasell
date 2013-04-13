<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class VorgangDruck
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
        Me.TableLayoutPanel1 = New System.Windows.Forms.TableLayoutPanel()
        Me.OK_Button = New System.Windows.Forms.Button()
        Me.Cancel_Button = New System.Windows.Forms.Button()
        Me.NummerTextBox = New System.Windows.Forms.TextBox()
        Me.TypComboBox = New System.Windows.Forms.ComboBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.VorlageListBox = New System.Windows.Forms.ListBox()
        Me.SofortSenden_CheckBox = New System.Windows.Forms.CheckBox()
        Me.WORD_RadioButton = New System.Windows.Forms.RadioButton()
        Me.PDF_RadioButton = New System.Windows.Forms.RadioButton()
        Me.ENGINE_GroupBox = New System.Windows.Forms.GroupBox()
        Me.XML_RadioButton = New System.Windows.Forms.RadioButton()
        Me.EMAILATTACHMENT_RadioButton = New System.Windows.Forms.RadioButton()
        Me.EMAIL_RadioButton = New System.Windows.Forms.RadioButton()
        Me.KundNrAdressenControl = New IntraSell_Net.AdressenControl()
        NummerLabel = New System.Windows.Forms.Label()
        TypLabel = New System.Windows.Forms.Label()
        KundNrLabel = New System.Windows.Forms.Label()
        Me.TableLayoutPanel1.SuspendLayout()
        Me.ENGINE_GroupBox.SuspendLayout()
        Me.SuspendLayout()
        '
        'NummerLabel
        '
        NummerLabel.AutoSize = True
        NummerLabel.Location = New System.Drawing.Point(22, 85)
        NummerLabel.Name = "NummerLabel"
        NummerLabel.Size = New System.Drawing.Size(49, 13)
        NummerLabel.TabIndex = 15
        NummerLabel.Text = "Nummer:"
        '
        'TypLabel
        '
        TypLabel.AutoSize = True
        TypLabel.Location = New System.Drawing.Point(22, 58)
        TypLabel.Name = "TypLabel"
        TypLabel.Size = New System.Drawing.Size(28, 13)
        TypLabel.TabIndex = 16
        TypLabel.Text = "Typ:"
        '
        'KundNrLabel
        '
        KundNrLabel.AutoSize = True
        KundNrLabel.Location = New System.Drawing.Point(22, 31)
        KundNrLabel.Name = "KundNrLabel"
        KundNrLabel.Size = New System.Drawing.Size(41, 13)
        KundNrLabel.TabIndex = 17
        KundNrLabel.Text = "Kunde:"
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
        Me.NummerTextBox.Location = New System.Drawing.Point(80, 82)
        Me.NummerTextBox.Name = "NummerTextBox"
        Me.NummerTextBox.Size = New System.Drawing.Size(131, 20)
        Me.NummerTextBox.TabIndex = 14
        '
        'TypComboBox
        '
        Me.TypComboBox.Enabled = False
        Me.TypComboBox.FormattingEnabled = True
        Me.TypComboBox.Location = New System.Drawing.Point(80, 55)
        Me.TypComboBox.Name = "TypComboBox"
        Me.TypComboBox.Size = New System.Drawing.Size(131, 21)
        Me.TypComboBox.TabIndex = 13
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(22, 112)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(46, 13)
        Me.Label4.TabIndex = 25
        Me.Label4.Text = "Vorlage:"
        '
        'VorlageListBox
        '
        Me.VorlageListBox.FormattingEnabled = True
        Me.VorlageListBox.Location = New System.Drawing.Point(80, 112)
        Me.VorlageListBox.Name = "VorlageListBox"
        Me.VorlageListBox.Size = New System.Drawing.Size(340, 82)
        Me.VorlageListBox.TabIndex = 26
        '
        'SofortSenden_CheckBox
        '
        Me.SofortSenden_CheckBox.AutoSize = True
        Me.SofortSenden_CheckBox.Location = New System.Drawing.Point(80, 275)
        Me.SofortSenden_CheckBox.Name = "SofortSenden_CheckBox"
        Me.SofortSenden_CheckBox.Size = New System.Drawing.Size(90, 17)
        Me.SofortSenden_CheckBox.TabIndex = 30
        Me.SofortSenden_CheckBox.Text = "sofort senden"
        Me.SofortSenden_CheckBox.UseVisualStyleBackColor = True
        '
        'WORD_RadioButton
        '
        Me.WORD_RadioButton.AutoSize = True
        Me.WORD_RadioButton.Checked = True
        Me.WORD_RadioButton.Location = New System.Drawing.Point(6, 21)
        Me.WORD_RadioButton.Name = "WORD_RadioButton"
        Me.WORD_RadioButton.Size = New System.Drawing.Size(70, 17)
        Me.WORD_RadioButton.TabIndex = 31
        Me.WORD_RadioButton.TabStop = True
        Me.WORD_RadioButton.Text = "MS Word"
        Me.WORD_RadioButton.UseVisualStyleBackColor = True
        '
        'PDF_RadioButton
        '
        Me.PDF_RadioButton.AutoSize = True
        Me.PDF_RadioButton.Location = New System.Drawing.Point(78, 21)
        Me.PDF_RadioButton.Name = "PDF_RadioButton"
        Me.PDF_RadioButton.Size = New System.Drawing.Size(46, 17)
        Me.PDF_RadioButton.TabIndex = 32
        Me.PDF_RadioButton.Text = "PDF"
        Me.PDF_RadioButton.UseVisualStyleBackColor = True
        '
        'ENGINE_GroupBox
        '
        Me.ENGINE_GroupBox.Controls.Add(Me.XML_RadioButton)
        Me.ENGINE_GroupBox.Controls.Add(Me.EMAILATTACHMENT_RadioButton)
        Me.ENGINE_GroupBox.Controls.Add(Me.EMAIL_RadioButton)
        Me.ENGINE_GroupBox.Controls.Add(Me.WORD_RadioButton)
        Me.ENGINE_GroupBox.Controls.Add(Me.PDF_RadioButton)
        Me.ENGINE_GroupBox.Location = New System.Drawing.Point(80, 206)
        Me.ENGINE_GroupBox.Name = "ENGINE_GroupBox"
        Me.ENGINE_GroupBox.Size = New System.Drawing.Size(340, 48)
        Me.ENGINE_GroupBox.TabIndex = 33
        Me.ENGINE_GroupBox.TabStop = False
        Me.ENGINE_GroupBox.Text = "Öffne mit"
        '
        'XML_RadioButton
        '
        Me.XML_RadioButton.AutoSize = True
        Me.XML_RadioButton.Location = New System.Drawing.Point(276, 22)
        Me.XML_RadioButton.Name = "XML_RadioButton"
        Me.XML_RadioButton.Size = New System.Drawing.Size(47, 17)
        Me.XML_RadioButton.TabIndex = 35
        Me.XML_RadioButton.Text = "XML"
        Me.XML_RadioButton.UseVisualStyleBackColor = True
        '
        'EMAILATTACHMENT_RadioButton
        '
        Me.EMAILATTACHMENT_RadioButton.AutoSize = True
        Me.EMAILATTACHMENT_RadioButton.Location = New System.Drawing.Point(186, 21)
        Me.EMAILATTACHMENT_RadioButton.Name = "EMAILATTACHMENT_RadioButton"
        Me.EMAILATTACHMENT_RadioButton.Size = New System.Drawing.Size(86, 17)
        Me.EMAILATTACHMENT_RadioButton.TabIndex = 34
        Me.EMAILATTACHMENT_RadioButton.Text = "Email Anlage"
        Me.EMAILATTACHMENT_RadioButton.UseVisualStyleBackColor = True
        '
        'EMAIL_RadioButton
        '
        Me.EMAIL_RadioButton.AutoSize = True
        Me.EMAIL_RadioButton.Location = New System.Drawing.Point(130, 21)
        Me.EMAIL_RadioButton.Name = "EMAIL_RadioButton"
        Me.EMAIL_RadioButton.Size = New System.Drawing.Size(50, 17)
        Me.EMAIL_RadioButton.TabIndex = 33
        Me.EMAIL_RadioButton.Text = "Email"
        Me.EMAIL_RadioButton.UseVisualStyleBackColor = True
        '
        'KundNrAdressenControl
        '
        Me.KundNrAdressenControl.Enabled = False
        Me.KundNrAdressenControl.IDNR = 0
        Me.KundNrAdressenControl.Location = New System.Drawing.Point(80, 24)
        Me.KundNrAdressenControl.Name = "KundNrAdressenControl"
        Me.KundNrAdressenControl.Size = New System.Drawing.Size(174, 25)
        Me.KundNrAdressenControl.TabIndex = 12
        '
        'VorgangDruck
        '
        Me.AcceptButton = Me.OK_Button
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.CancelButton = Me.Cancel_Button
        Me.ClientSize = New System.Drawing.Size(435, 315)
        Me.Controls.Add(Me.ENGINE_GroupBox)
        Me.Controls.Add(Me.SofortSenden_CheckBox)
        Me.Controls.Add(Me.VorlageListBox)
        Me.Controls.Add(Me.Label4)
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
        Me.Name = "VorgangDruck"
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent
        Me.Text = "Vorgang Exportieren"
        Me.TableLayoutPanel1.ResumeLayout(False)
        Me.ENGINE_GroupBox.ResumeLayout(False)
        Me.ENGINE_GroupBox.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents TableLayoutPanel1 As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents OK_Button As System.Windows.Forms.Button
    Friend WithEvents Cancel_Button As System.Windows.Forms.Button
    Friend WithEvents KundNrAdressenControl As IntraSell_Net.AdressenControl
    Friend WithEvents NummerTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TypComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents VorlageListBox As System.Windows.Forms.ListBox
    Friend WithEvents SofortSenden_CheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents WORD_RadioButton As System.Windows.Forms.RadioButton
    Friend WithEvents PDF_RadioButton As System.Windows.Forms.RadioButton
    Friend WithEvents ENGINE_GroupBox As System.Windows.Forms.GroupBox
    Friend WithEvents XML_RadioButton As System.Windows.Forms.RadioButton
    Friend WithEvents EMAILATTACHMENT_RadioButton As System.Windows.Forms.RadioButton
    Friend WithEvents EMAIL_RadioButton As System.Windows.Forms.RadioButton

End Class
