using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void SaveFile(HttpPostedFile file)
        {
            // Specify the path to save the uploaded file to.
            string savePath = Server.MapPath(".") + @"\Import\";

            // Get the name of the file to upload.
            string fileName = fuScannedForm.FileName;

            // Create the path and file name to check for duplicates.
            string pathToCheck = savePath + fileName;

            // Create a temporary file name to use for checking duplicates.
            string tempfileName = "";

            // Check to see if a file already exists with the
            // same name as the file to upload.        
            if (System.IO.File.Exists(pathToCheck))
            {
                int counter = 2;
                while (System.IO.File.Exists(pathToCheck))
                {
                    // if a file with this name already exists,
                    // prefix the filename with a number.
                    tempfileName = counter.ToString() + fileName;
                    pathToCheck = savePath + tempfileName;
                    counter++;
                }

                fileName = tempfileName;

                // Notify the user that the file name was changed.
                //UploadStatusLabel.Text = "A file with the same name already exists." +
                //"<br />Your file was saved as " + fileName;
            }
            else
            {
                // Notify the user that the file was saved successfully.
                //UploadStatusLabel.Text = "Your file was uploaded successfully.";
            }

            // Append the name of the file to upload to the path.
            savePath += fileName;

            // Call the SaveAs method to save the uploaded
            // file to the specified directory.
            fuScannedForm.SaveAs(savePath);

            string ext = System.IO.Path.GetExtension(this.fuScannedForm.PostedFile.FileName);
            Import_To_Grid(savePath, ext, "Yes");


        }
        private void Import_To_Grid(string FilePath, string Extension, string isHDR)
        {
            string conStr = "";
            switch (Extension.ToLower())
            {
                case ".xls": //Excel 97-03
                    conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"]
                             .ConnectionString;
                    break;
                case ".xlsx": //Excel 07
                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]
                              .ConnectionString;
                    break;
            }
            conStr = String.Format(conStr, @FilePath, isHDR);
            OleDbConnection connExcel = new OleDbConnection(conStr);
            OleDbCommand cmdExcel = new OleDbCommand();
            OleDbDataAdapter oda = new OleDbDataAdapter();
            DataTable dt = new DataTable();
            cmdExcel.Connection = connExcel;

            //Get the name of First Sheet
            connExcel.Open();
            DataTable dtExcelSchema;
            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
            connExcel.Close();

            //Read Data from First Sheet
            connExcel.Open();
            cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
            oda.SelectCommand = cmdExcel;
            oda.Fill(dt);

            string EmpID, TYear, TMonth, DedC, TDate;
            decimal Amort;

            int SuccessPaid = 0;

            for (int Counter = 0; Counter < dt.Rows.Count; Counter++)
            {
                EmpID = dt.Rows[Counter]["emp_id"].ToString();
                TYear = dt.Rows[Counter]["covyear"].ToString();
                TMonth = dt.Rows[Counter]["covmonth"].ToString();
                Amort = System.Convert.ToDecimal(dt.Rows[Counter]["ded_a"].ToString());
                DedC = dt.Rows[Counter]["ded_c"].ToString();
                TDate = dt.Rows[Counter]["T_date"].ToString();

                if (Ihelper.InsertContribution(EmpID, TDate, Amort))
                {
                    SuccessPaid++;
                }
                else
                {
         
                }
            }

            if (SuccessPaid == dt.Rows.Count)
            {
                lblStatus.Text = "Import Success! All Records has been Updated.";
            }
            else if ((SuccessPaid != dt.Rows.Count) && (SuccessPaid != 0))
            {
                lblStatus.Text = "Import Error! Some records has not been Updated.";
            }
            else
            {
                lblStatus.Text = "Import Error! Records has not been Updated.";
            }

            connExcel.Close();

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fuScannedForm.HasFile)
            {    // Call a helper method routine to save the file.
                SaveFile(fuScannedForm.PostedFile);
                //CreateEntry(DDLTransactCode, fuScannedForm.PostedFile);
            }
            else
            {
                // Notify the user that a file was not uploaded.
                //UploadStatusLabel.Text = "You did not specify a file to upload."; 
            }
        }
    }
}