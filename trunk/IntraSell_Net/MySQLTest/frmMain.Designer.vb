' ++++++++++++++++++++++++++++++++++++++++++++++++++
' This code is generated by a tool and is provided "as is", without warranty of any kind,
' express or implied, including but not limited to the warranties of merchantability,
' fitness for a particular purpose and non-infringement.
' In no event shall the authors or copyright holders be liable for any claim, damages or
' other liability, whether in an action of contract, tort or otherwise, arising from,
' out of or in connection with the software or the use or other dealings in the software.
' ++++++++++++++++++++++++++++++++++++++++++++++++++
' 

Namespace MySQLTest

<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmMain
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
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.FormsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
      Me.frmbuchvorgangToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
      Me.frmgrartikelToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SuspendLayout()
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.FormsToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(284, 24)
        Me.MenuStrip1.TabIndex = 0
        Me.MenuStrip1.Text = "MenuStrip1"

      Me.menuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() { Me.formsToolStripMenuItem })
      ' 
      ' formsToolStripMenuItem
      ' 
      Me.formsToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() { 
      Me.frmbuchvorgangToolStripMenuItem ,       Me.frmgrartikelToolStripMenuItem       })
      Me.formsToolStripMenuItem.Name = "formsToolStripMenuItem"
      Me.formsToolStripMenuItem.Size = New System.Drawing.Size(52, 20)
      Me.formsToolStripMenuItem.Text = "Forms"
      ' 
      ' frmbuchvorgangToolStripMenuItem
      ' 
      Me.frmbuchvorgangToolStripMenuItem.Name = "frmbuchvorgangToolStripMenuItem"
      Me.frmbuchvorgangToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
      Me.frmbuchvorgangToolStripMenuItem.Text = "buchvorgang"
      ' 
      ' frmgrartikelToolStripMenuItem
      ' 
      Me.frmgrartikelToolStripMenuItem.Name = "frmgrartikelToolStripMenuItem"
      Me.frmgrartikelToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
      Me.frmgrartikelToolStripMenuItem.Text = "grartikel"

        '
        'frmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 261)
        Me.Controls.Add(Me.MenuStrip1)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "frmMain"
        Me.Text = "Main Form"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents FormsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents frmbuchvorgangToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents frmgrartikelToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem

End Class
End Namespace