<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class AdresseWeitere
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
        Me.components = New System.ComponentModel.Container()
        Dim TypLabel As System.Windows.Forms.Label
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(AdresseWeitere))
        Me.Ofadressen_weitereBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorAddNewItem = New System.Windows.Forms.ToolStripButton()
        Me.Ofadressen_weitereBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsAdressen = New IntraSell_Net.dsAdressen()
        Me.BindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorDeleteItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.Ofadressen_weitereBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.Ofadressen_weitereTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_weitereTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager()
        Me.OfAdressenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressenTableAdapter()
        Me.AdressenDetailControl = New IntraSell_Net.AdressenDetailControl()
        Me.TypComboBox = New System.Windows.Forms.ComboBox()
        TypLabel = New System.Windows.Forms.Label()
        CType(Me.Ofadressen_weitereBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Ofadressen_weitereBindingNavigator.SuspendLayout()
        CType(Me.Ofadressen_weitereBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'TypLabel
        '
        TypLabel.AutoSize = True
        TypLabel.Location = New System.Drawing.Point(29, 31)
        TypLabel.Name = "TypLabel"
        TypLabel.Size = New System.Drawing.Size(43, 13)
        TypLabel.TabIndex = 11
        TypLabel.Text = "Zweck:"
        '
        'Ofadressen_weitereBindingNavigator
        '
        Me.Ofadressen_weitereBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.Ofadressen_weitereBindingNavigator.BindingSource = Me.Ofadressen_weitereBindingSource
        Me.Ofadressen_weitereBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.Ofadressen_weitereBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.Ofadressen_weitereBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.Ofadressen_weitereBindingNavigatorSaveItem})
        Me.Ofadressen_weitereBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.Ofadressen_weitereBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.Ofadressen_weitereBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.Ofadressen_weitereBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.Ofadressen_weitereBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.Ofadressen_weitereBindingNavigator.Name = "Ofadressen_weitereBindingNavigator"
        Me.Ofadressen_weitereBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.Ofadressen_weitereBindingNavigator.Size = New System.Drawing.Size(662, 25)
        Me.Ofadressen_weitereBindingNavigator.TabIndex = 1
        Me.Ofadressen_weitereBindingNavigator.Text = "BindingNavigator1"
        '
        'BindingNavigatorAddNewItem
        '
        Me.BindingNavigatorAddNewItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorAddNewItem.Image = CType(resources.GetObject("BindingNavigatorAddNewItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorAddNewItem.Name = "BindingNavigatorAddNewItem"
        Me.BindingNavigatorAddNewItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorAddNewItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorAddNewItem.Text = "Add new"
        '
        'Ofadressen_weitereBindingSource
        '
        Me.Ofadressen_weitereBindingSource.DataMember = "ofadressen-weitere"
        Me.Ofadressen_weitereBindingSource.DataSource = Me.DsAdressen
        '
        'DsAdressen
        '
        Me.DsAdressen.DataSetName = "dsAdressen"
        Me.DsAdressen.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'BindingNavigatorCountItem
        '
        Me.BindingNavigatorCountItem.Name = "BindingNavigatorCountItem"
        Me.BindingNavigatorCountItem.Size = New System.Drawing.Size(36, 22)
        Me.BindingNavigatorCountItem.Text = "of {0}"
        Me.BindingNavigatorCountItem.ToolTipText = "Total number of items"
        '
        'BindingNavigatorDeleteItem
        '
        Me.BindingNavigatorDeleteItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorDeleteItem.Image = CType(resources.GetObject("BindingNavigatorDeleteItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorDeleteItem.Name = "BindingNavigatorDeleteItem"
        Me.BindingNavigatorDeleteItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorDeleteItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorDeleteItem.Text = "Delete"
        '
        'BindingNavigatorMoveFirstItem
        '
        Me.BindingNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveFirstItem.Image = CType(resources.GetObject("BindingNavigatorMoveFirstItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveFirstItem.Name = "BindingNavigatorMoveFirstItem"
        Me.BindingNavigatorMoveFirstItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveFirstItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveFirstItem.Text = "Move first"
        '
        'BindingNavigatorMovePreviousItem
        '
        Me.BindingNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMovePreviousItem.Image = CType(resources.GetObject("BindingNavigatorMovePreviousItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMovePreviousItem.Name = "BindingNavigatorMovePreviousItem"
        Me.BindingNavigatorMovePreviousItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMovePreviousItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMovePreviousItem.Text = "Move previous"
        '
        'BindingNavigatorSeparator
        '
        Me.BindingNavigatorSeparator.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorPositionItem
        '
        Me.BindingNavigatorPositionItem.AccessibleName = "Position"
        Me.BindingNavigatorPositionItem.AutoSize = False
        Me.BindingNavigatorPositionItem.Name = "BindingNavigatorPositionItem"
        Me.BindingNavigatorPositionItem.Size = New System.Drawing.Size(50, 23)
        Me.BindingNavigatorPositionItem.Text = "0"
        Me.BindingNavigatorPositionItem.ToolTipText = "Current position"
        '
        'BindingNavigatorSeparator1
        '
        Me.BindingNavigatorSeparator1.Name = "BindingNavigatorSeparator1"
        Me.BindingNavigatorSeparator1.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorMoveNextItem
        '
        Me.BindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveNextItem.Image = CType(resources.GetObject("BindingNavigatorMoveNextItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveNextItem.Name = "BindingNavigatorMoveNextItem"
        Me.BindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveNextItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveNextItem.Text = "Move next"
        '
        'BindingNavigatorMoveLastItem
        '
        Me.BindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveLastItem.Image = CType(resources.GetObject("BindingNavigatorMoveLastItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveLastItem.Name = "BindingNavigatorMoveLastItem"
        Me.BindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveLastItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveLastItem.Text = "Move last"
        '
        'BindingNavigatorSeparator2
        '
        Me.BindingNavigatorSeparator2.Name = "BindingNavigatorSeparator2"
        Me.BindingNavigatorSeparator2.Size = New System.Drawing.Size(6, 25)
        '
        'Ofadressen_weitereBindingNavigatorSaveItem
        '
        Me.Ofadressen_weitereBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.Ofadressen_weitereBindingNavigatorSaveItem.Image = CType(resources.GetObject("Ofadressen_weitereBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.Ofadressen_weitereBindingNavigatorSaveItem.Name = "Ofadressen_weitereBindingNavigatorSaveItem"
        Me.Ofadressen_weitereBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.Ofadressen_weitereBindingNavigatorSaveItem.Text = "Save Data"
        '
        'Ofadressen_weitereTableAdapter
        '
        Me.Ofadressen_weitereTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.grtransportmethodeTableAdapter = Nothing
        Me.TableAdapterManager.grzahlungsbedingungTableAdapter = Nothing
        Me.TableAdapterManager.grzahlungsmethodeTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_kundengruppenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_settingsTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_transportmethodenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_weitereTableAdapter = Me.Ofadressen_weitereTableAdapter
        Me.TableAdapterManager.ofadressen_zahlungsbedingungenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_zahlungsmethodenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressenTableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'OfAdressenTableAdapter
        '
        Me.OfAdressenTableAdapter.ClearBeforeFill = True
        '
        'AdressenDetailControl
        '
        Me.AdressenDetailControl.Adresse = ""
        Me.AdressenDetailControl.Anrede = Nothing
        Me.AdressenDetailControl.Branche = Nothing
        Me.AdressenDetailControl.Briefanrede = Nothing
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Adresse", Me.Ofadressen_weitereBindingSource, "Adresse", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Anrede", Me.Ofadressen_weitereBindingSource, "Anrede", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Email", Me.Ofadressen_weitereBindingSource, "Email", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Fax", Me.Ofadressen_weitereBindingSource, "Fax", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Firma", Me.Ofadressen_weitereBindingSource, "Firma", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.Ofadressen_weitereBindingSource, "IDNR", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Land", Me.Ofadressen_weitereBindingSource, "Land", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Mobil", Me.Ofadressen_weitereBindingSource, "Mobil", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Name1", Me.Ofadressen_weitereBindingSource, "Name1", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("NameFamilie", Me.Ofadressen_weitereBindingSource, "Name", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Ort", Me.Ofadressen_weitereBindingSource, "Ort", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("PLZ", Me.Ofadressen_weitereBindingSource, "PLZ", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Tel", Me.Ofadressen_weitereBindingSource, "Tel", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Tel2", Me.Ofadressen_weitereBindingSource, "Tel2", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Titel", Me.Ofadressen_weitereBindingSource, "Titel", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Vorname", Me.Ofadressen_weitereBindingSource, "Vorname", True))
        Me.AdressenDetailControl.DataBindings.Add(New System.Windows.Forms.Binding("Web", Me.Ofadressen_weitereBindingSource, "Web", True))
        Me.AdressenDetailControl.Email = ""
        Me.AdressenDetailControl.Fax = ""
        Me.AdressenDetailControl.Fax2 = ""
        Me.AdressenDetailControl.Firma = ""
        Me.AdressenDetailControl.Geburtstag = New Date(2013, 3, 22, 22, 50, 23, 656)
        Me.AdressenDetailControl.IDNR = ""
        Me.AdressenDetailControl.Land = Nothing
        Me.AdressenDetailControl.Location = New System.Drawing.Point(12, 55)
        Me.AdressenDetailControl.Mobil = ""
        Me.AdressenDetailControl.Name = "AdressenDetailControl"
        Me.AdressenDetailControl.Name1 = ""
        Me.AdressenDetailControl.NameFamilie = ""
        Me.AdressenDetailControl.Ort = ""
        Me.AdressenDetailControl.PLZ = Nothing
        Me.AdressenDetailControl.Size = New System.Drawing.Size(637, 305)
        Me.AdressenDetailControl.TabIndex = 3
        Me.AdressenDetailControl.Tel = ""
        Me.AdressenDetailControl.Tel2 = ""
        Me.AdressenDetailControl.Titel = Nothing
        Me.AdressenDetailControl.Vorname = ""
        Me.AdressenDetailControl.Web = ""
        '
        'TypComboBox
        '
        Me.TypComboBox.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.Ofadressen_weitereBindingSource, "Typ", True))
        Me.TypComboBox.FormattingEnabled = True
        Me.TypComboBox.Location = New System.Drawing.Point(94, 28)
        Me.TypComboBox.Name = "TypComboBox"
        Me.TypComboBox.Size = New System.Drawing.Size(199, 21)
        Me.TypComboBox.TabIndex = 10
        '
        'AdresseWeitere
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(662, 373)
        Me.Controls.Add(TypLabel)
        Me.Controls.Add(Me.TypComboBox)
        Me.Controls.Add(Me.Ofadressen_weitereBindingNavigator)
        Me.Controls.Add(Me.AdressenDetailControl)
        Me.Name = "AdresseWeitere"
        Me.Text = "Adresse"
        CType(Me.Ofadressen_weitereBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Ofadressen_weitereBindingNavigator.ResumeLayout(False)
        Me.Ofadressen_weitereBindingNavigator.PerformLayout()
        CType(Me.Ofadressen_weitereBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents AdressenDetailControl As IntraSell_Net.AdressenDetailControl
    Friend WithEvents DsAdressen As IntraSell_Net.dsAdressen
    Friend WithEvents Ofadressen_weitereBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Ofadressen_weitereTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressen_weitereTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager
    Friend WithEvents Ofadressen_weitereBindingNavigator As System.Windows.Forms.BindingNavigator
    Friend WithEvents BindingNavigatorAddNewItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorCountItem As System.Windows.Forms.ToolStripLabel
    Friend WithEvents BindingNavigatorDeleteItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMoveFirstItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem As System.Windows.Forms.ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator2 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents Ofadressen_weitereBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents OfAdressenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressenTableAdapter
    Friend WithEvents TypComboBox As System.Windows.Forms.ComboBox
End Class
