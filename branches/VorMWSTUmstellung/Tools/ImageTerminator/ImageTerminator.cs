using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO; 
namespace ImageTerminator
{
   public static class ImageTerminator
    {

        /// <summary>
        /// Reads data into a complete array, throwing an EndOfStreamException
        /// if the stream runs out of data first, or if an IOException
        /// naturally occurs.
        /// </summary>
        /// <param name="stream">The stream to read data from</param>
        /// <param name="data">The array to read bytes into. The array
        /// will be completely filled from the stream, so an appropriate
        /// size must be given.</param>
        public static String ReadFile(string filename)
        {
            System.IO.FileStream fs = System.IO.File.OpenRead(filename);
            byte[] data = new byte[fs.Length];
            fs.Read(data, 0, data.Length);

            string output = "";
            for (int i = 0; i < data.Length; i++)
                output += System.Convert.ToString(data[i]) + ";";

            return output;
        }
        /// <summary>
        /// Reads data into a complete array, throwing an EndOfStreamException
        /// if the stream runs out of data first, or if an IOException
        /// naturally occurs.
        /// </summary>
        /// <param name="filename">The filename read data from</param>
       public static byte[] ReadFileAsByteArray(string filename)
       {
           System.IO.FileStream fs = System.IO.File.OpenRead(filename);
           byte[] data = new byte[fs.Length];
           fs.Read(data, 0, data.Length);
           return data;
       }


        //return the image of the image  text 
        public static Image FromString(string imageString) {             

            if (imageString  == null ) 
                return null;  
         

            string[] parts = imageString.Split(';'); 

            byte[] bytes  = new byte[parts.Length]; 
            for(int i = 0; i< parts.Length-1; i++) 
                bytes[i] = System.Convert.ToByte(parts[i]);
            if (bytes.Length <= 256)
                return null; 
   
            Image imS = Bitmap.FromStream(new MemoryStream(bytes)); 

            return imS; 
        }

        //return the image of the image  text 
        public static Image FromByteArray(byte[] imageByteArray)
        {
            if ( imageByteArray.Length <= 0)
                return null;  
            return Bitmap.FromStream(new MemoryStream(imageByteArray));
        }

       //return the bytes of the image 
       public static Byte[] FromStringAsByteArray(string imageString)
       {

           if (imageString == null)
               return null;


           string[] parts = imageString.Split(';');

           byte[] bytes = new byte[parts.Length];
           for (int i = 0; i < parts.Length - 1; i++)
               bytes[i] = System.Convert.ToByte(parts[i]);
           if (bytes.Length <= 256)
               return null;

         
           return bytes;
       }


    }
}
