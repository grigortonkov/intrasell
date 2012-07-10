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
        Me.KundenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.KundenToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.ListeToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.Liste2ToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.KundenToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(1008, 24)
        Me.MenuStrip1.TabIndex = 0
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'KundenToolStripMenuItem
        '
        Me.KundenToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.KundenToolStripMenuItem1, Me.ListeToolStripMenuItem, Me.Liste2ToolStripMenuItem})
        Me.KundenToolStripMenuItem.Name = "KundenToolStripMenuItem"
        Me.KundenToolStripMenuItem.Size = New System.Drawing.Size(87, 20)
        Me.KundenToolStripMenuItem.Text = "&Stammdaten"
        '
        'KundenToolStripMenuItem1
        '
        Me.KundenToolStripMenuItem1.Name = "KundenToolStripMenuItem1"
        Me.KundenToolStripMenuItem1.Size = New System.Drawing.Size(115, 22)
        Me.KundenToolStripMenuItem1.Text = "&Kunden"
        '
        'ListeToolStripMenuItem
        '
        Me.ListeToolStripMenuItem.Name = "ListeToolStripMenuItem"
        Me.ListeToolStripMenuItem.Size = New System.Drawing.Size(115, 22)
        Me.ListeToolStripMenuItem.Text = "&Liste"
        '
        'Liste2ToolStripMenuItem
        '
        Me.Liste2ToolStripMenuItem.Name = "Liste2ToolStripMenuItem"
        Me.Liste2ToolStripMenuItem.Size = New System.Drawing.Size(115, 22)
        Me.Liste2ToolStripMenuItem.Text = "Liste2"
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

End Class
