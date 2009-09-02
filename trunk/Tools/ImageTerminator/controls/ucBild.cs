using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;

namespace ImageTerminator
{
    public partial class ucBild : ucDSControl
    {
        private string mImageStream ;
        private byte[] mImageStreamAsByteArray;
        private bool mGenerateThumbnail = false ; 
        private int mMaxBytes  = 1024*1024; 
        public ucBild()
        {
            InitializeComponent();
        }

        public string ImageStream
        {
            get
            {
                return mImageStream; 
            }
            set
            {
                mImageStream = value;
                try
                {
                    picture.Image = ImageTerminator.FromString(mImageStream);
                }
                catch (Exception ex)
                {
 
                } 
            }
        }


        public byte[] ImageStreamAsByteArray
        {
            get
            {
                return mImageStreamAsByteArray;
            }
            set
            {
                 mImageStreamAsByteArray = value;
                try
                {
                    picture.Image = ImageTerminator.FromByteArray(mImageStreamAsByteArray);
                }
                catch (Exception ex)
                {
 
                } 

            }
        }


        public bool GenerateThumbnail
        {
            get
            {
                return mGenerateThumbnail;
            }
            set
            {
                mGenerateThumbnail = value; 
            }
        }

        public int MaxBytes
        {
            get
            {
                return mMaxBytes; 
            }
            set
            {
                mMaxBytes = value; 
            }
        }



        public void Reload(){
           this.picture.Image = null;
           bindingSource_CurrentChanged(null, null); 
        }

        private void ucBild_Load(object sender, EventArgs e)
        {
            mBindingSource = bindingSource;
            bindingSource.CurrentChanged += new EventHandler(bindingSource_CurrentChanged);
        }

        void bindingSource_CurrentChanged(object sender, EventArgs e)
        {
            if (mBindingSource != null && dset.Bild.Rows.Count > 0 && picture.Image == null )

            {
                BildDataSet.BildRow br = dset.Bild.FindById(mFiltId);
                if (br != null)
                {
                    string buffer = dset.Bild.FindById(mFiltId).ImageStream;
                    picture.Image = ImageTerminator.FromString(buffer);
                }
            }; 
        }

        public bool ThumbnailCallback()
        {
            return false;
        }


        private void btn_LoadCarPic_Click(object sender, EventArgs e)
        {
            try
            {
                openFileDialog.FileName = "";
                openFileDialog.ShowDialog();

                if (openFileDialog.FileName == "") return;

                string filename = openFileDialog.FileName;

                //convert to stream 
                Bitmap im = new Bitmap(filename);

                String buffer = String.Empty ;
                byte[] bufferAsBytes = new byte[0]; 

                if (mGenerateThumbnail)
                {
                    Image.GetThumbnailImageAbort myCallback = new Image.GetThumbnailImageAbort(ThumbnailCallback);
                    Image th = im.GetThumbnailImage(this.Width - 50, this.Height - 50,
                                                    myCallback, IntPtr.Zero);

                    string thumbFilename = filename + "tmp.jpg";
                    System.IO.FileStream stream = new System.IO.FileStream(thumbFilename, System.IO.FileMode.Create);
                    th.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                    th.Dispose();
                    stream.Close();
                    stream.Dispose();
                    buffer = ImageTerminator.ReadFile(thumbFilename);//  thumbnail
                }
                else
                {
                   // buffer = ImageTerminator.ReadFile (filename); //no thumbnail
                    bufferAsBytes  = ImageTerminator.ReadFileAsByteArray(filename); //no thumbnail
                }

                //trow event if max size 
                if (bufferAsBytes.Length > mMaxBytes)
                    throw new Exception("Image you try to attach is too bix. Max is :" + mMaxBytes); 


                BildDataSet.BildRow br = dset.Bild.FindById(mFiltId);

                if (br == null)
                    br = dset.Bild.AddBildRow(mFiltId, buffer, filename);

                br.Pfad = filename;
                br.ImageStream = buffer;
                //ImageStream = buffer;
                ImageStreamAsByteArray = bufferAsBytes; 

                //picture.Image = ImageTerminator.FromString(buffer);
                picture.Image = ImageTerminator.FromByteArray(bufferAsBytes);
            }
            catch (Exception ex) {
                MessageBox.Show(ex.ToString()); 
            }
        }

        private void txtPfad_TextChanged(object sender, EventArgs e)
        {

        }

        private void but_DelCarPic_Click(object sender, EventArgs e)
        {
            try {
            BildDataSet.BildRow br = dset.Bild.FindById(mFiltId);

            if (br == null)
                return;

            br.Pfad = null;
            br.ImageStream = null; 

            picture.Image = null;
            }
            catch (Exception ex) {
                MessageBox.Show(ex.ToString()); 
            }
        }
    }
}
