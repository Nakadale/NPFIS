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
    public class BranchHelper
    {
        public static DataTable LoadBranchID()
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = "select BranchName, BranchID from BranchLib";

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

        public static DataTable LoadDivision()
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = "select * from DivisionLib";

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

        public static void LoadBranch(string BranchID, TextBox txtBranchName)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;

            string sql = "select * from BranchLib where BranchID = @BranchID";

            using (SqlCommand CMD = new SqlCommand(sql, cnn))
            {
                CMD.CommandType = CommandType.Text;
                CMD.Parameters.AddWithValue("@BranchID", BranchID);
                cnn.Open();
                try
                {
                    SqlDataReader dr = CMD.ExecuteReader();
                    while (dr.Read())
                    {
                        txtBranchName.Text = dr["BranchName"].ToString();
                    }
                }
                catch
                {

                }
            }
        } //

        public static DataTable LoadDivisionByBranch(string BranchID)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = "select * from DivisionLib where BranchID = @BranchID";
            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.AddWithValue("@BranchID", BranchID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count == 0)
                {
                    DataRow dr = dt.NewRow();
                    dt.Rows.Add(dr);
                }

                return dt;
            }
        } //

        public static bool InsertBranch(string txtBranchID, string TxtBranchName)
        {

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = @"INSERT INTO BranchLib(BranchID,BranchName) VALUES (@BranchID,@BranchName)";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@BranchID", txtBranchID);
                    CMD.Parameters.AddWithValue("@BranchName", TxtBranchName);
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
        } //InsertBranch

        public static string GetLastBranchID()
        {
            string value;

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                // this query will get the last entered BranchID. if there is no branch it will output 101 as the branchID for the first branch
                string sql = @"select top 1 isnull(branchId+1,'101') as branchID from BranchLib order by branchid DESC ";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    cnn.Open();
                    try
                    {
                        object o = CMD.ExecuteScalar();
                        if (o != null)
                        {
                            value = o.ToString();
                            return value;
                        }
                        else
                        {
                            value = "NaN";
                            return value;
                        }
                    }
                    catch
                    {
                        value = "NaN";
                        return value;
                    }
                }

            }

        } //

        public static bool InsertDivision(string txtBranchID, string txtDivisionID, string TxtDivisionName)
        {

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = @"INSERT INTO DivisionLib(BranchID,DivisionID,DivisionName) VALUES (@BranchID,@DivisionID,@DivisionName)";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@BranchID", txtBranchID);
                    CMD.Parameters.AddWithValue("@DivisionID", txtDivisionID);
                    CMD.Parameters.AddWithValue("@DivisionName", TxtDivisionName);

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
        } //InsertBranch

        public static bool CheckDivisionIDandDivisionName(string DivisionID,string DivisionName)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = "select isnull(count(DivisionID),0) as DivisionIDExist from DivisionLib WHERE DivisionID=@DivisionId";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@DivisionId", DivisionID);
                    try
                    {
                        object o = CMD.ExecuteScalar();
                        if (o.ToString() == "0")
                        {
                            CMD.CommandText = "select isnull(count(DivisionID),0) as DivisionNameExist from DivisionLib WHERE DivisionName=@DivisionName";
                            CMD.Parameters.AddWithValue("@DivisionName", DivisionName);
                            try
                            {
                                o = CMD.ExecuteScalar();
                                if (o.ToString() == "0")
                                {
                                    return true;
                                }
                                else
                                {
                                    return false;
                                }
                            }
                            catch
                            {
                                return false;
                            }
                        }
                        else
                        {
                            return false;
                           
                        }
                    }
                    catch
                    {
                        return false;
                    }
                }
            }
        } //CheckDivisionIDandDivisionName

        public static bool DeleteDivision(string DivisionID)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = "Delete from DivisionLib WHERE DivisionID=@DivisionID";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@DivisionID", DivisionID);
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

        } //DeleteDivision

        public static bool UpdateBranch(string txtBranchID, string TxtBranchName)
        {

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = @"Update BranchLib set BranchName = @BranchName where BranchID=@BranchID";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@BranchID", txtBranchID);
                    CMD.Parameters.AddWithValue("@BranchName", TxtBranchName);
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
        } //InsertBranch
    }
}