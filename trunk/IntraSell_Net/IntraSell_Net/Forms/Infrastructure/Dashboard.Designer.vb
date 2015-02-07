<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Dashboard
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
        Me.RechnungButton = New System.Windows.Forms.Button()
        Me.AngebotButton = New System.Windows.Forms.Button()
        Me.AnrufenButton = New System.Windows.Forms.Button()
        Me.MahnungenButton = New System.Windows.Forms.Button()
        Me.KundenButton = New System.Windows.Forms.Button()
        Me.AnzahlAngeboteLabel = New System.Windows.Forms.Label()
        Me.AnzahlRechnungenLabel = New System.Windows.Forms.Label()
        Me.AnzahlMahnugnenLabel = New System.Windows.Forms.Label()
        Me.AnzahlAnrufeLabel = New System.Windows.Forms.Label()
        Me.AnzahlKundenLabel = New System.Windows.Forms.Label()
        Me.ArtikelAnlegenLabel = New System.Windows.Forms.Label()
        Me.ArtikelAnlegenButton = New System.Windows.Forms.Button()
        Me.BarrechnungButton = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'RechnungButton
        '
        Me.RechnungButton.Location = New System.Drawing.Point(12, 42)
        Me.RechnungButton.Name = "RechnungButton"
        Me.RechnungButton.Size = New System.Drawing.Size(147, 23)
        Me.RechnungButton.TabIndex = 1
        Me.RechnungButton.Text = "Rechnung schreiben"
        Me.RechnungButton.UseVisualStyleBackColor = True
        '
        'AngebotButton
        '
        Me.AngebotButton.Location = New System.Drawing.Point(12, 12)
        Me.AngebotButton.Name = "AngebotButton"
        Me.AngebotButton.Size = New System.Drawing.Size(147, 23)
        Me.AngebotButton.TabIndex = 0
        Me.AngebotButton.Text = "Angebot schreiben"
        Me.AngebotButton.UseVisualStyleBackColor = True
        '
        'AnrufenButton
        '
        Me.AnrufenButton.Location = New System.Drawing.Point(12, 126)
        Me.AnrufenButton.Name = "AnrufenButton"
        Me.AnrufenButton.Size = New System.Drawing.Size(147, 23)
        Me.AnrufenButton.TabIndex = 3
        Me.AnrufenButton.Text = "Anrufen"
        Me.AnrufenButton.UseVisualStyleBackColor = True
        '
        'MahnungenButton
        '
        Me.MahnungenButton.Location = New System.Drawing.Point(12, 97)
        Me.MahnungenButton.Name = "MahnungenButton"
        Me.MahnungenButton.Size = New System.Drawing.Size(147, 23)
        Me.MahnungenButton.TabIndex = 2
        Me.MahnungenButton.Text = "Mahnungen"
        Me.MahnungenButton.UseVisualStyleBackColor = True
        '
        'KundenButton
        '
        Me.KundenButton.Location = New System.Drawing.Point(12, 155)
        Me.KundenButton.Name = "KundenButton"
        Me.KundenButton.Size = New System.Drawing.Size(147, 23)
        Me.KundenButton.TabIndex = 4
        Me.KundenButton.Text = "Kunde anlegen"
        Me.KundenButton.UseVisualStyleBackColor = True
        '
        'AnzahlAngeboteLabel
        '
        Me.AnzahlAngeboteLabel.AutoSize = True
        Me.AnzahlAngeboteLabel.Cursor = System.Windows.Forms.Cursors.Hand
        Me.AnzahlAngeboteLabel.Location = New System.Drawing.Point(165, 17)
        Me.AnzahlAngeboteLabel.Name = "AnzahlAngeboteLabel"
        Me.AnzahlAngeboteLabel.Size = New System.Drawing.Size(13, 13)
        Me.AnzahlAngeboteLabel.TabIndex = 5
        Me.AnzahlAngeboteLabel.Text = "0"
        '
        'AnzahlRechnungenLabel
        '
        Me.AnzahlRechnungenLabel.AutoSize = True
        Me.AnzahlRechnungenLabel.Cursor = System.Windows.Forms.Cursors.Hand
        Me.AnzahlRechnungenLabel.Location = New System.Drawing.Point(165, 47)
        Me.AnzahlRechnungenLabel.Name = "AnzahlRechnungenLabel"
        Me.AnzahlRechnungenLabel.Size = New System.Drawing.Size(13, 13)
        Me.AnzahlRechnungenLabel.TabIndex = 6
        Me.AnzahlRechnungenLabel.Text = "0"
        '
        'AnzahlMahnugnenLabel
        '
        Me.AnzahlMahnugnenLabel.AutoSize = True
        Me.AnzahlMahnugnenLabel.Cursor = System.Windows.Forms.Cursors.Hand
        Me.AnzahlMahnugnenLabel.Location = New System.Drawing.Point(165, 102)
        Me.AnzahlMahnugnenLabel.Name = "AnzahlMahnugnenLabel"
        Me.AnzahlMahnugnenLabel.Size = New System.Drawing.Size(13, 13)
        Me.AnzahlMahnugnenLabel.TabIndex = 7
        Me.AnzahlMahnugnenLabel.Text = "0"
        '
        'AnzahlAnrufeLabel
        '
        Me.AnzahlAnrufeLabel.AutoSize = True
        Me.AnzahlAnrufeLabel.Cursor = System.Windows.Forms.Cursors.Hand
        Me.AnzahlAnrufeLabel.Location = New System.Drawing.Point(165, 131)
        Me.AnzahlAnrufeLabel.Name = "AnzahlAnrufeLabel"
        Me.AnzahlAnrufeLabel.Size = New System.Drawing.Size(13, 13)
        Me.AnzahlAnrufeLabel.TabIndex = 8
        Me.AnzahlAnrufeLabel.Text = "0"
        '
        'AnzahlKundenLabel
        '
        Me.AnzahlKundenLabel.AutoSize = True
        Me.AnzahlKundenLabel.Cursor = System.Windows.Forms.Cursors.Hand
        Me.AnzahlKundenLabel.Location = New System.Drawing.Point(165, 160)
        Me.AnzahlKundenLabel.Name = "AnzahlKundenLabel"
        Me.AnzahlKundenLabel.Size = New System.Drawing.Size(13, 13)
        Me.AnzahlKundenLabel.TabIndex = 9
        Me.AnzahlKundenLabel.Text = "0"
        '
        'ArtikelAnlegenLabel
        '
        Me.ArtikelAnlegenLabel.AutoSize = True
        Me.ArtikelAnlegenLabel.Cursor = System.Windows.Forms.Cursors.Hand
        Me.ArtikelAnlegenLabel.Location = New System.Drawing.Point(165, 189)
        Me.ArtikelAnlegenLabel.Name = "ArtikelAnlegenLabel"
        Me.ArtikelAnlegenLabel.Size = New System.Drawing.Size(13, 13)
        Me.ArtikelAnlegenLabel.TabIndex = 11
        Me.ArtikelAnlegenLabel.Text = "0"
        '
        'ArtikelAnlegenButton
        '
        Me.ArtikelAnlegenButton.Location = New System.Drawing.Point(12, 184)
        Me.ArtikelAnlegenButton.Name = "ArtikelAnlegenButton"
        Me.ArtikelAnlegenButton.Size = New System.Drawing.Size(147, 23)
        Me.ArtikelAnlegenButton.TabIndex = 5
        Me.ArtikelAnlegenButton.Text = "Artikel anlegen"
        Me.ArtikelAnlegenButton.UseVisualStyleBackColor = True
        '
        'BarrechnungButton
        '
        Me.BarrechnungButton.Location = New System.Drawing.Point(12, 68)
        Me.BarrechnungButton.Name = "BarrechnungButton"
        Me.BarrechnungButton.Size = New System.Drawing.Size(147, 23)
        Me.BarrechnungButton.TabIndex = 12
        Me.BarrechnungButton.Text = "Barrechnung"
        Me.BarrechnungButton.UseVisualStyleBackColor = True
        '
        'Dashboard
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(355, 222)
        Me.Controls.Add(Me.BarrechnungButton)
        Me.Controls.Add(Me.ArtikelAnlegenLabel)
        Me.Controls.Add(Me.ArtikelAnlegenButton)
        Me.Controls.Add(Me.AnzahlKundenLabel)
        Me.Controls.Add(Me.AnzahlAnrufeLabel)
        Me.Controls.Add(Me.AnzahlMahnugnenLabel)
        Me.Controls.Add(Me.AnzahlRechnungenLabel)
        Me.Controls.Add(Me.AnzahlAngeboteLabel)
        Me.Controls.Add(Me.KundenButton)
        Me.Controls.Add(Me.MahnungenButton)
        Me.Controls.Add(Me.AnrufenButton)
        Me.Controls.Add(Me.AngebotButton)
        Me.Controls.Add(Me.RechnungButton)
        Me.Name = "Dashboard"
        Me.Text = "Dashboard"
        Me.TransparencyKey = System.Drawing.Color.FromArgb(CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer))
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents RechnungButton As System.Windows.Forms.Button
    Friend WithEvents AngebotButton As System.Windows.Forms.Button
    Friend WithEvents AnrufenButton As System.Windows.Forms.Button
    Friend WithEvents MahnungenButton As System.Windows.Forms.Button
    Friend WithEvents KundenButton As System.Windows.Forms.Button
    Friend WithEvents AnzahlAngeboteLabel As System.Windows.Forms.Label
    Friend WithEvents AnzahlRechnungenLabel As System.Windows.Forms.Label
    Friend WithEvents AnzahlMahnugnenLabel As System.Windows.Forms.Label
    Friend WithEvents AnzahlAnrufeLabel As System.Windows.Forms.Label
    Friend WithEvents AnzahlKundenLabel As System.Windows.Forms.Label
    Friend WithEvents ArtikelAnlegenLabel As System.Windows.Forms.Label
    Friend WithEvents ArtikelAnlegenButton As System.Windows.Forms.Button
    Friend WithEvents BarrechnungButton As System.Windows.Forms.Button
End Class
