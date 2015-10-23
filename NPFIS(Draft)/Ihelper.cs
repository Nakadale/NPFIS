using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;

namespace NPFIS_Draft_
{
    public class Ihelper
    {
        public static bool UpdatePaidLoanAmotization(string EmpID, string Month, string Year)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = @"update LoanAmortization set Paid = 1 from Payroll_Loan where LoanAmortization.EmpID = @EmpID and YEAR(PayDate) = @Year and MONTH(PayDate) = @Month";
                //add userid to be updated also
                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@EmpID", EmpID);
                    CMD.Parameters.AddWithValue("@Year", Year);
                    CMD.Parameters.AddWithValue("@Month", Month);

                    try
                    {
                        int RowsAffected = CMD.ExecuteNonQuery();
                        if (RowsAffected == 1)
                        {
                            return true;
                        }
                        else if (RowsAffected == 0)
                        {
                            return false;
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
        } //UpdatePaidLoanAmotization 

        public static bool InsertContribution(string EmpID, string DateRemit, decimal Amount)
        {
            if (VerifyContribution(EmpID, DateRemit, Amount))
            {
                using (SqlConnection cnn = new SqlConnection())
                {
                    cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                    cnn.Open();

                    string sql = @"insert into SharesDetail(EmpID,DateRemit, Amount,PerOfShareBasis,UserID) values(@EmpID,@DateRemit,@Amount,@Amount/10,'Import')";

                    using (SqlCommand CMD = new SqlCommand(sql, cnn))
                    {
                        CMD.Parameters.AddWithValue("@EmpID", EmpID);
                        CMD.Parameters.AddWithValue("@DateRemit", DateRemit);
                        CMD.Parameters.AddWithValue("@Amount", Amount);

                        try
                        {
                            int RowsAffected = CMD.ExecuteNonQuery();
                            if (RowsAffected == 1)
                            {
                                return true;
                            }
                            else if (RowsAffected == 0)
                            {
                                return false;
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
            }
            else
            {
                return false;
            }

        } //InsertContribution 

        public static bool VerifyContribution(string EmpID, string DateRemit, decimal Amount)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = "select isnull(count(EmpID),0) as ContributionExist from SharesDetail WHERE EmpID = @EmpID and DateRemit = @DateRemit and Amount = @Amount";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@EmpID", EmpID);
                    CMD.Parameters.AddWithValue("@DateRemit", DateRemit);
                    CMD.Parameters.AddWithValue("@Amount", Amount);
                    try
                    {
                        object o = CMD.ExecuteScalar();
                        if (o.ToString() == "0")
                        {
                            return true;
                        }
                        else
                        {
                            return false; ;
                        }
                    }
                    catch
                    {
                        return false;
                    }
                }
            }
        } //VerifyContribution

    }
}