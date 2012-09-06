<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Main
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Main))
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.DateiToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.BeendenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.EintellungenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.DruckenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.KundenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.KundenToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.ListeToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.Liste2ToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ArtikellisteToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.FormKundenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.VorgängeToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.VorgangToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.VorganglisteToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.HilfeToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.WikiToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ÜberIntraSellToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SetupToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.UpdateToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.LogToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.DateiToolStripMenuItem, Me.KundenToolStripMenuItem, Me.VorgängeToolStripMenuItem, Me.HilfeToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(1008, 24)
        Me.MenuStrip1.TabIndex = 0
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'DateiToolStripMenuItem
        '
        Me.DateiToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.EintellungenToolStripMenuItem, Me.DruckenToolStripMenuItem, Me.BeendenToolStripMenuItem})
        Me.DateiToolStripMenuItem.Name = "DateiToolStripMenuItem"
        Me.DateiToolStripMenuItem.Size = New System.Drawing.Size(44, 20)
        Me.DateiToolStripMenuItem.Text = "&Datei"
        '
        'BeendenToolStripMenuItem
        '
        Me.BeendenToolStripMenuItem.Name = "BeendenToolStripMenuItem"
        Me.BeendenToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.BeendenToolStripMenuItem.Text = "&Beenden"
        '
        'EintellungenToolStripMenuItem
        '
        Me.EintellungenToolStripMenuItem.Name = "EintellungenToolStripMenuItem"
        Me.EintellungenToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.EintellungenToolStripMenuItem.Text = "&Einstellungen"
        '
        'DruckenToolStripMenuItem
        '
        Me.DruckenToolStripMenuItem.Enabled = False
        Me.DruckenToolStripMenuItem.Name = "DruckenToolStripMenuItem"
        Me.DruckenToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.DruckenToolStripMenuItem.Text = "&Drucken"
        '
        'KundenToolStripMenuItem
        '
        Me.KundenToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.KundenToolStripMenuItem1, Me.ListeToolStripMenuItem, Me.Liste2ToolStripMenuItem, Me.ArtikellisteToolStripMenuItem, Me.FormKundenToolStripMenuItem})
        Me.KundenToolStripMenuItem.Name = "KundenToolStripMenuItem"
        Me.KundenToolStripMenuItem.Size = New System.Drawing.Size(79, 20)
        Me.KundenToolStripMenuItem.Text = "&Stammdaten"
        '
        'KundenToolStripMenuItem1
        '
        Me.KundenToolStripMenuItem1.Name = "KundenToolStripMenuItem1"
        Me.KundenToolStripMenuItem1.Size = New System.Drawing.Size(158, 22)
        Me.KundenToolStripMenuItem1.Text = "&Kunden"
        '
        'ListeToolStripMenuItem
        '
        Me.ListeToolStripMenuItem.Name = "ListeToolStripMenuItem"
        Me.ListeToolStripMenuItem.Size = New System.Drawing.Size(158, 22)
        Me.ListeToolStripMenuItem.Text = "&Kundenliste"
        '
        'Liste2ToolStripMenuItem
        '
        Me.Liste2ToolStripMenuItem.Name = "Liste2ToolStripMenuItem"
        Me.Liste2ToolStripMenuItem.Size = New System.Drawing.Size(158, 22)
        Me.Liste2ToolStripMenuItem.Text = "&Artikel"
        '
        'ArtikellisteToolStripMenuItem
        '
        Me.ArtikellisteToolStripMenuItem.Name = "ArtikellisteToolStripMenuItem"
        Me.ArtikellisteToolStripMenuItem.Size = New System.Drawing.Size(158, 22)
        Me.ArtikellisteToolStripMenuItem.Text = "&Artikelliste"
        '
        'FormKundenToolStripMenuItem
        '
        Me.FormKundenToolStripMenuItem.Name = "FormKundenToolStripMenuItem"
        Me.FormKundenToolStripMenuItem.Size = New System.Drawing.Size(158, 22)
        Me.FormKundenToolStripMenuItem.Text = "Test FormKunden"
        '
        'VorgängeToolStripMenuItem
        '
        Me.VorgängeToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.VorgangToolStripMenuItem, Me.VorganglisteToolStripMenuItem})
        Me.VorgängeToolStripMenuItem.Name = "VorgängeToolStripMenuItem"
        Me.VorgängeToolStripMenuItem.Size = New System.Drawing.Size(65, 20)
        Me.VorgängeToolStripMenuItem.Text = "Vorgänge"
        '
        'VorgangToolStripMenuItem
        '
        Me.VorgangToolStripMenuItem.Name = "VorgangToolStripMenuItem"
        Me.VorgangToolStripMenuItem.Size = New System.Drawing.Size(133, 22)
        Me.VorgangToolStripMenuItem.Text = "Vorgang"
        '
        'VorganglisteToolStripMenuItem
        '
        Me.VorganglisteToolStripMenuItem.Name = "VorganglisteToolStripMenuItem"
        Me.VorganglisteToolStripMenuItem.Size = New System.Drawing.Size(133, 22)
        Me.VorganglisteToolStripMenuItem.Text = "Vorgangliste"
        '
        'HilfeToolStripMenuItem
        '
        Me.HilfeToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.WikiToolStripMenuItem, Me.ÜberIntraSellToolStripMenuItem, Me.SetupToolStripMenuItem, Me.UpdateToolStripMenuItem, Me.LogToolStripMenuItem})
        Me.HilfeToolStripMenuItem.Name = "HilfeToolStripMenuItem"
        Me.HilfeToolStripMenuItem.Size = New System.Drawing.Size(40, 20)
        Me.HilfeToolStripMenuItem.Text = "&Hilfe"
        '
        'WikiToolStripMenuItem
        '
        Me.WikiToolStripMenuItem.Name = "WikiToolStripMenuItem"
        Me.WikiToolStripMenuItem.Size = New System.Drawing.Size(140, 22)
        Me.WikiToolStripMenuItem.Text = "&Wiki"
        '
        'ÜberIntraSellToolStripMenuItem
        '
        Me.ÜberIntraSellToolStripMenuItem.Name = "ÜberIntraSellToolStripMenuItem"
        Me.ÜberIntraSellToolStripMenuItem.Size = New System.Drawing.Size(140, 22)
        Me.ÜberIntraSellToolStripMenuItem.Text = "&Über IntraSell"
        '
        'SetupToolStripMenuItem
        '
        Me.SetupToolStripMenuItem.Name = "SetupToolStripMenuItem"
        Me.SetupToolStripMenuItem.Size = New System.Drawing.Size(140, 22)
        Me.SetupToolStripMenuItem.Text = "&Setup"
        '
        'UpdateToolStripMenuItem
        '
        Me.UpdateToolStripMenuItem.Name = "UpdateToolStripMenuItem"
        Me.UpdateToolStripMenuItem.Size = New System.Drawing.Size(140, 22)
        Me.UpdateToolStripMenuItem.Text = "&Update"
        '
        'LogToolStripMenuItem
        '
        Me.LogToolStripMenuItem.Name = "LogToolStripMenuItem"
        Me.LogToolStripMenuItem.Size = New System.Drawing.Size(140, 22)
        Me.LogToolStripMenuItem.Text = "&Log"
        '
        'Main
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1008, 762)
        Me.Controls.Add(Me.MenuStrip1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.IsMdiContainer = True
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "Main"
        Me.Text = "IntraSell.Net 0.1 Alpha by Grigor Tonkov"
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents KundenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ListeToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents KundenToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents Liste2ToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FormKundenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ArtikellisteToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DateiToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents HilfeToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents WikiToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ÜberIntraSellToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents BeendenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents VorgängeToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents VorgangToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents VorganglisteToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SetupToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents EintellungenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UpdateToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents LogToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DruckenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem

End Class
