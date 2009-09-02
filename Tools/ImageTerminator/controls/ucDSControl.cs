using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;

namespace ImageTerminator
{
    public  partial class ucDSControl : UserControl
    {
        public ucDSControl()
        {
            InitializeComponent();
        }

        protected Guid mFiltId;
        protected BindingSource mBindingSource; 


        public Guid Id
        {
            get {
                return mFiltId; 
            }
            set
            {
                mFiltId = value;
                if (mBindingSource!=null)
                mBindingSource.Filter = "Id='" + mFiltId + "'";
            }
        }

        public BildDataSet DS
        {
            get
            {
                return dset; 
            }
            set
            {
                dset = value;
                if (mBindingSource != null)
                mBindingSource.DataSource = dset;
            }
        }


 
        //rebinds data 
        public void Bind(BildDataSet ds)
        {
             this.dset = ds;
             if (mBindingSource != null)
             mBindingSource.DataSource = dset;
        }



    
    }
}
