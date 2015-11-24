using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace NPFIS_Draft_
{
    public class SignatoryHelper
    {
        public static DataTable LoadSignatoryNumber()
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = "select SigNum from Signatories";

            SqlCommand cmd = new SqlCommand(sql, cnn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }

            return dt;
        } //

        public static void LoadSignatory(String SigNum, TextBox TxtAdministrator, TextBox TxtPosition, TextBox TxtNotedBy, TextBox TxtNotedByPosition, TextBox TxtPreparedBy,
        TextBox TxtPrepareByPosition, TextBox TxtEncodedBy, TextBox TxtEncodedByPosition)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;

                string sql = "select * from Signatories where SigNum = @SigNum";
                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.CommandType = CommandType.Text;
                    CMD.Parameters.AddWithValue("@SigNum", SigNum);
                    cnn.Open();
                    try
                    {
                        SqlDataReader dr = CMD.ExecuteReader();
                        while (dr.Read())
                        {
                            TxtAdministrator.Text = dr["AdminName"].ToString();
                            TxtPosition.Text = dr["AdminPosition"].ToString();
                            TxtNotedBy.Text = dr["NotedName"].ToString();
                            TxtNotedByPosition.Text = dr["NotedPosition"].ToString();
                            TxtPreparedBy.Text = dr["PreparedName"].ToString();
                            TxtPrepareByPosition.Text = dr["PreparedPosition"].ToString();
                            TxtEncodedBy.Text = dr["EncodedName"].ToString();
                            TxtEncodedByPosition.Text = dr["EncodedPosition"].ToString();
                        }
                    }
                    catch
                    {

                    }
                }

            }
        } //LoadEmpTransactRecord

        public static bool DeleteRecord(string SigNum)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = "Delete from Signatories WHERE SigNum=@SigNum";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@SigNum", SigNum);
                    try
                    {
                        int rowsAffected = CMD.ExecuteNonQuery();
                        if (rowsAffected == 0)
                        {
                            return false;
                        }
                        else
                        {
                            return true;
                        }
                    }
                    catch
                    {
                        return false;
                    }
                }
            }

        } // deleterecord

        public static bool CheckIfExist(string SigNum)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = "select isnull(count(SigNum),0) as SigNum from Signatories WHERE SigNum=@SigNum";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@SigNum", SigNum);
                    try
                    {
                        object o = CMD.ExecuteScalar();
                        if (o.ToString() == "0")
                        {
                            return false;
                        }
                        else
                        {
                            return true;
                        }
                    }
                    catch
                    {
                        return false;
                    }
                }
            }
        } // check if exist

        public static bool InsertSignatory(string ddlSignatoryNum, string TxtAdministrator, string TxtPosition, string TxtNotedBy, string TxtNotedByPosition, string TxtPreparedBy,
            string TxtPrepareByPosition, string TxtEncodedBy, string TxtEncodedByPosition)
        {

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = @"INSERT INTO Signatories(SigNum,AdminName,AdminPosition,NotedName,PreparedName,PreparedPosition,EncodedName,EncodedPosition) VALUES 
                    (@SigNum,@TxtAdministrator,@TxtPosition,@TxtNotedBy,@TxtNotedByPosition,@TxtPreparedBy,@TxtPrepareByPosition,@TxtEncodedBy,@TxtEncodedByPosition)";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@SigNum", ddlSignatoryNum);
                    CMD.Parameters.AddWithValue("@TxtAdministrator", TxtAdministrator);
                    CMD.Parameters.AddWithValue("@TxtPosition", TxtPosition);
                    CMD.Parameters.AddWithValue("@TxtNotedBy", TxtNotedBy);
                    CMD.Parameters.AddWithValue("@TxtNotedByPosition", TxtNotedByPosition);
                    CMD.Parameters.AddWithValue("@TxtPreparedBy", TxtPrepareByPosition);
                    CMD.Parameters.AddWithValue("@TxtPrepareByPosition", TxtPrepareByPosition);
                    CMD.Parameters.AddWithValue("@TxtEncodedBy", TxtEncodedBy);
                    CMD.Parameters.AddWithValue("@TxtEncodedByPosition", TxtEncodedByPosition);
                    try
                    {
                        CMD.ExecuteNonQuery();
                        return true;
                    }
                    catch
                    {
                        return false;
                    }
                }
            }
        } //InsertSignatory

        public static bool UpdateSignatory(string ddlSignatoryNum, string TxtAdministrator, string TxtPosition, string TxtNotedBy,string TxtNotedByPosition,string TxtPreparedBy,
            string TxtPrepareByPosition, string TxtEncodedBy, string TxtEncodedByPosition)
        {

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = @"Update Signatories set AdminName = @TxtAdministrator, AdminPosition = @TxtPosition, NotedName = @TxtNotedBy, PreparedName = @TxtPreparedBy,
                PreparedPosition = @TxtPrepareByPosition, EncodedName = @TxtEncodedBy, EncodedPosition = @TxtEncodedByPosition where SigNum = @SigNum";
                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@SigNum", ddlSignatoryNum);
                    CMD.Parameters.AddWithValue("@TxtAdministrator", TxtAdministrator);
                    CMD.Parameters.AddWithValue("@TxtPosition", TxtPosition);
                    CMD.Parameters.AddWithValue("@TxtNotedBy", TxtNotedBy);
                    CMD.Parameters.AddWithValue("@TxtNotedByPosition", TxtNotedByPosition);
                    CMD.Parameters.AddWithValue("@TxtPreparedBy", TxtPreparedBy);
                    CMD.Parameters.AddWithValue("@TxtPrepareByPosition", TxtPrepareByPosition);
                    CMD.Parameters.AddWithValue("@TxtEncodedBy", TxtEncodedBy);
                    CMD.Parameters.AddWithValue("@TxtEncodedByPosition", TxtEncodedByPosition);
                    try
                    {
                        CMD.ExecuteNonQuery();
                        return true;
                    }
                    catch
                    {
                        return false;
                    }
                }
            }
        } //UpdateLoanType
    }
}