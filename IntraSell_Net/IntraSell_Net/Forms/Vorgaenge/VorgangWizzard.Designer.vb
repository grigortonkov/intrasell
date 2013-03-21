<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class VorgangWizzard
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
        Dim DatumLabel As System.Windows.Forms.Label
        Me.TableLayoutPanel1 = New System.Windows.Forms.TableLayoutPanel()
        Me.OK_Button = New System.Windows.Forms.Button()
        Me.Cancel_Button = New System.Windows.Forms.Button()
        Me.NummerTextBox = New System.Windows.Forms.TextBox()
        Me.TypComboBox = New System.Windows.Forms.ComboBox()
        Me.DatumDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.KundNrAdressenControl = New IntraSell_Net.AdressenControl()
        Me.KundeAnlegenButton = New System.Windows.Forms.Button()
        NummerLabel = New System.Windows.Forms.Label()
        TypLabel = New System.Windows.Forms.Label()
        KundNrLabel = New System.Windows.Forms.Label()
        DatumLabel = New System.Windows.Forms.Label()
        Me.TableLayoutPanel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'NummerLabel
        '
        NummerLabel.AutoSize = True
        NummerLabel.Location = New System.Drawing.Point(20, 86)
        NummerLabel.Name = "NummerLabel"
        NummerLabel.Size = New System.Drawing.Size(49, 13)
        NummerLabel.TabIndex = 7
        NummerLabel.Text = "Nummer:"
        '
        'TypLabel
        '
        TypLabel.AutoSize = True
        TypLabel.Location = New System.Drawing.Point(20, 59)
        TypLabel.Name = "TypLabel"
        TypLabel.Size = New System.Drawing.Size(28, 13)
        TypLabel.TabIndex = 9
        TypLabel.Text = "Typ:"
        '
        'KundNrLabel
        '
        KundNrLabel.AutoSize = True
        KundNrLabel.Location = New System.Drawing.Point(20, 32)
        KundNrLabel.Name = "KundNrLabel"
        KundNrLabel.Size = New System.Drawing.Size(41, 13)
        KundNrLabel.TabIndex = 11
        KundNrLabel.Text = "Kunde:"
        '
        'DatumLabel
        '
        DatumLabel.AutoSize = True
        DatumLabel.Location = New System.Drawing.Point(20, 113)
        DatumLabel.Name = "DatumLabel"
        DatumLabel.Size = New System.Drawing.Size(41, 13)
        DatumLabel.TabIndex = 13
        DatumLabel.Text = "Datum:"
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
        Me.TableLayoutPanel1.TabIndex = 4
        '
        'OK_Button
        '
        Me.OK_Button.Anchor = System.Windows.Forms.AnchorStyles.None
        Me.OK_Button.Enabled = False
        Me.OK_Button.Location = New System.Drawing.Point(3, 3)
        Me.OK_Button.Name = "OK_Button"
        Me.OK_Button.Size = New System.Drawing.Size(67, 23)
        Me.OK_Button.TabIndex = 5
        Me.OK_Button.Text = "OK"
        '
        'Cancel_Button
        '
        Me.Cancel_Button.Anchor = System.Windows.Forms.AnchorStyles.None
        Me.Cancel_Button.DialogResult = System.Windows.Forms.DialogResult.Cancel
        Me.Cancel_Button.Location = New System.Drawing.Point(76, 3)
        Me.Cancel_Button.Name = "Cancel_Button"
        Me.Cancel_Button.Size = New System.Drawing.Size(67, 23)
        Me.Cancel_Button.TabIndex = 6
        Me.Cancel_Button.Text = "Cancel"
        '
        'NummerTextBox
        '
        Me.NummerTextBox.Enabled = False
        Me.NummerTextBox.Location = New System.Drawing.Point(134, 83)
        Me.NummerTextBox.Name = "NummerTextBox"
        Me.NummerTextBox.Size = New System.Drawing.Size(131, 20)
        Me.NummerTextBox.TabIndex = 2
        '
        'TypComboBox
        '
        Me.TypComboBox.FormattingEnabled = True
        Me.TypComboBox.Location = New System.Drawing.Point(134, 56)
        Me.TypComboBox.Name = "TypComboBox"
        Me.TypComboBox.Size = New System.Drawing.Size(131, 21)
        Me.TypComboBox.TabIndex = 1
        '
        'DatumDateTimePicker
        '
        Me.DatumDateTimePicker.Enabled = False
        Me.DatumDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.DatumDateTimePicker.Location = New System.Drawing.Point(134, 109)
        Me.DatumDateTimePicker.Name = "DatumDateTimePicker"
        Me.DatumDateTimePicker.Size = New System.Drawing.Size(131, 20)
        Me.DatumDateTimePicker.TabIndex = 3
        Me.DatumDateTimePicker.Value = New Date(2012, 9, 4, 0, 53, 17, 0)
        '
        'KundNrAdressenControl
        '
        Me.KundNrAdressenControl.IDNR = 0
        Me.KundNrAdressenControl.Location = New System.Drawing.Point(134, 25)
        Me.KundNrAdressenControl.Name = "KundNrAdressenControl"
        Me.KundNrAdressenControl.Size = New System.Drawing.Size(172, 25)
        Me.KundNrAdressenControl.TabIndex = 0
        '
        'KundeAnlegenButton
        '
        Me.KundeAnlegenButton.Location = New System.Drawing.Point(289, 25)
        Me.KundeAnlegenButton.Name = "KundeAnlegenButton"
        Me.KundeAnlegenButton.Size = New System.Drawing.Size(102, 23)
        Me.KundeAnlegenButton.TabIndex = 14
        Me.KundeAnlegenButton.Text = "Kunde anlegen"
        Me.KundeAnlegenButton.UseVisualStyleBackColor = True
        '
        'VorgangWizzard
        '
        Me.AcceptButton = Me.OK_Button
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.CancelButton = Me.Cancel_Button
        Me.ClientSize = New System.Drawing.Size(435, 315)
        Me.Controls.Add(Me.KundeAnlegenButton)
        Me.Controls.Add(DatumLabel)
        Me.Controls.Add(Me.DatumDateTimePicker)
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
        Me.Name = "VorgangWizzard"
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent
        Me.Text = "Vorgang Wizzard"
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
    Friend WithEvents DatumDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents KundeAnlegenButton As System.Windows.Forms.Button

End Class
