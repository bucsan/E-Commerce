using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Manage_Products_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void grdProducts_SelectedIndexChanged(object sender, EventArgs e)
    {
        winEdit.Hide = false;
    }

    /// <summary>
    /// After clicking Cancel, hide the WebWindow
    /// </summary>
    protected void frmAdd_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        winAdd.Hide = true;

    }

    /// <summary>
    /// After adding a product, hide the WebWindow
    /// </summary>
    protected void frmAdd_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        winAdd.Hide = true;

        saveImage();

        
    }

    private void saveImage()
    {

        FileUpload upload = (FileUpload)frmAdd.FindControl("upImage");

        String path = Server.MapPath("~/Images/" + upload.FileName);

        if (!File.Exists(path))
        {
            if (upload.HasFile)
            {

                // To enable this sample, grant Write permission to the ASP.NET process account 
                // for the Images subdirectory and uncomment below lines of code.
                upload.SaveAs(path);


                #region Imagem Maior
                using (Bitmap bitmap = new Bitmap(upload.PostedFile.InputStream, false))
                    if (bitmap.Width > bitmap.Height)
                    {
                        int wi = bitmap.Width;
                        int he = bitmap.Height;
                        int novaAltura = (wi * 140) / he;
                        CreateThumbnail(140, novaAltura, path, Server.MapPath("~/Images/Thumb424/" + upload.FileName));


                    }
                    else
                    {
                        int he = bitmap.Height;
                        int wi = bitmap.Width;
                        int novaLargura = (wi * 139) / he;
                        CreateThumbnail(novaLargura, 139, path, Server.MapPath("~/Images/Thumb424/" + upload.FileName));
                    }
                #endregion

                #region Imagem Menor
                using (Bitmap bitmap = new Bitmap(upload.PostedFile.InputStream, false))
                    if (bitmap.Width > bitmap.Height)
                    {
                        int wi = bitmap.Width;
                        int he = bitmap.Height;
                        int novaAltura = (he * 65) / wi;
                        CreateThumbnail(65, novaAltura, path, Server.MapPath("~/Images/Thumb65/" + upload.FileName));
                        
                    }
                    else
                    {
                        int he = bitmap.Height;
                        int wi = bitmap.Width;
                        int novaLargura = (wi * 65) / he;
                        CreateThumbnail(novaLargura, 65, path, Server.MapPath("~/Images/Thumb65/" + upload.FileName));
                    }
                #endregion

            }
           

        }
       

    }

    public void CreateThumbnail(int largura, int altura, string srcpath, string destpath)
    {
        System.Drawing.Image img = System.Drawing.Image.FromFile(srcpath);
        System.Drawing.Image imgthumb = img.GetThumbnailImage(largura, altura, null, new System.IntPtr(0));
        imgthumb.Save(destpath, ImageFormat.Jpeg);
        img.Dispose();
        imgthumb.Dispose();
    }


   

       
    
    protected void srcProducts_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {

    }


    /// <summary>
    /// Hide the Edit WebWindow after clicking Cancel or Update
    /// </summary>
    protected void frmEdit_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        winEdit.Hide = true;
    }
    protected void srcEditProducts_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {

    }
    protected void srcEditProducts_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        grdProducts.DataBind();
    }
   
}
