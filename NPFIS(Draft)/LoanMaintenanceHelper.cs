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
    public class LoanMaintenanceHelper
    {
        public static DataTable LoadLoanID()
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = "select LoanID from LoanLib";

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
        } // LoadLoanID

        public static void LoadLoanInformation(string LoanID, TextBox txtLoanType, TextBox txtDescription, TextBox txtInterestRate)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;

                string sql = "select * from LoanLib where LoanID = @LoanID";
                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.CommandType = CommandType.Text;
                    CMD.Parameters.AddWithValue("@LoanId", LoanID);
                    cnn.Open();
                    try
                    {
                        SqlDataReader dr = CMD.ExecuteReader();
                        while (dr.Read())
                        {
                            txtLoanType.Text = dr["LoanType"].ToString();
                            txtDescription.Text = dr["Description"].ToString();
                            txtInterestRate.Text = dr["InterestRate"].ToString();
                        }
                    }
                    catch
                    {

                    }
                }

            }

        } //LoadLoanInformation

        public static bool DeleteRecord(string LoanID)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = "Delete from LoanLib WHERE LoanID=@LoanID";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@LoanID", LoanID);
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

        public static bool InsertLoanType(string LoanID, string LoanType,
            string Description, string InterestRate)
        {

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = @"INSERT INTO LOANLIB(LoanID,LoanType,InterestRate,Description) VALUES 
                    (@LoanID,@LoanType,@InterestRate,@Description)";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@LoanID", LoanID);
                    CMD.Parameters.AddWithValue("@LoanType", LoanType);
                    CMD.Parameters.AddWithValue("@InterestRate", InterestRate);
                    CMD.Parameters.AddWithValue("@Description", Description);
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
        } //InsertLoanType

        public static bool UpdateLoanType(string LoanID, string LoanType,
            string Description , string InterestRate)
        {

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = @"Update LoanLib set LoanType = @LoanType, InterestRate = @InterestRate, Description = @Description where LoanID = @LoanID";
                //add userid to be updated also
                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@LoanID", LoanID);
                    CMD.Parameters.AddWithValue("@LoanType", LoanType);
                    CMD.Parameters.AddWithValue("@InterestRate", InterestRate);
                    CMD.Parameters.AddWithValue("@Description", Description);
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

        public static String GetLastLoanID()
        {
            string value;

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                // this query will get the last LoanID and will add 1 to it. if there is no LoanID found it will default to L0001
                string sql = @"Select top 1 ISNULL((select top 1 'L' + REPLICATE('0', 4-LEN(CAST((Substring(LoanId,2,4)+1) as varchar(9)))) 
                            + CAST((Substring(LoanId,2,4)+1) as varchar(9)) as LoanID from LoanLib order by LoanId DESC),'L0001') as LoanId from LoanLib";

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

        } //GetLastLoanID

        public static bool CheckIfExist(string LoanID)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = "select isnull(count(LoanID),0) as LoanID from LoanLib WHERE LoanID=@LoanID";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@LoanID", LoanID);
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
    }
}