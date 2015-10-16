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
    public static class helpers
    {
        public static DataTable CreateBlankRecord()
        {
            DataTable dt = new DataTable();

            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }

            return dt;
        }

        public static DataTable LoadAmortizations(string TransactCode)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = "select PayDate,PayAmount,IntAmount,Balance from LoanAmortization where TransactCode = @TransactCode";

            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.AddWithValue("@TransactCode", TransactCode);
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
        }

        public static DataTable LoadMemberList()
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = "select lastname + ', ' + firstname + ' ' + midname as Member_name, EmpId from Member";

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
        }

        public static DataTable LoadLoanType()
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = "select LoanID, Description from LoanLib";

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
        }

        public static String GetDivisionName(string DivID)
        {
            string value;

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;

                string sql = "select divisionid from Member where EmpID = @DivID";
                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.CommandType = CommandType.Text;
                    CMD.Parameters.AddWithValue("@DivID", DivID);
                    cnn.Open();
                    try
                    {
                        object o = CMD.ExecuteScalar();
                        if (o != null)
                        {
                            CMD.CommandText = "select DivisionName from DivisionLib where DivisionID = @DivisionID";
                            CMD.Parameters.AddWithValue("@DivisionID", o.ToString());

                            o = CMD.ExecuteScalar();

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
        } //GetDivisionName

        public static String GetBranchName(string DivID)
        {
            string value;

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;

                string sql = "select divisionid from Member where EmpID = @DivID";
                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.CommandType = CommandType.Text;
                    CMD.Parameters.AddWithValue("@DivID", DivID);
                    cnn.Open();
                    try
                    {
                        object o = CMD.ExecuteScalar();
                        if (o != null)
                        {
                            CMD.CommandText = "select BranchID from DivisionLib where DivisionID = @DivisionID";
                            CMD.Parameters.AddWithValue("@DivisionID", o.ToString());

                            o = CMD.ExecuteScalar();

                            if (o != null)
                            {
                                CMD.CommandText = "select BranchName from BranchLib where BranchID = @BranchID";
                                CMD.Parameters.AddWithValue("@BranchID", o.ToString());

                                o = CMD.ExecuteScalar();

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
                            else
                            {
                                value = "NaN";
                                return value;
                            }
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
        } //GetBranchName

        public static String GetInterestRate(string LoanID)
        {
            string value;

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;

                string sql = "select InterestRate from LoanLib where LoanID = @LoanID";
                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.CommandType = CommandType.Text;
                    CMD.Parameters.AddWithValue("@LoanID", LoanID);
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
        } //GetBranchName

        public static String GetLastTranCode()
        {
            string value;

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                // this query will get the last entered transaction code for the month. if on a new month with no records yet entered. 
                //it will generate a transact code <year><month> 0001 to signify it is the first record entered for the month.
                string sql = @"select top 1 ISNULL((select top 1 (TransactCode + 1) as TransactCode from LoanTransaction 
                where YEAR(GETDATE()) = SUBSTRING(TransactCode,0,5) and MONTH(GETDATE()) = SUBSTRING(TransactCode,5,2) 
                order by TransactCode DESC),cast(YEAR(GETDATE())as varchar) + 
                case when month(Getdate()) < 10 then '0' + Cast(MONTH(GETDATE())as varchar) 
                else Cast(MONTH(GETDATE())as varchar) end + '0001') as TransactCode 
                from LoanTransaction ";

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

        } // getLastTranCode

        public static DataTable LoadEmpTransactions(String EmpID)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = "select TransactCode from LoanTransaction where EmpID = @EmpID and Paid = 'false'";

            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.AddWithValue("@EmpID", EmpID);

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
        } //LoadEmpTransactions

        public static void LoadEmpTransactRecord(String TransactCode, TextBox TxtLoanAppNo, TextBox TxtLoanDate, TextBox TxtIssuedCheque, TextBox TxtIssuedChequeDate, TextBox TxtChequeReleasedDate, TextBox TxtPrincipalAmount, TextBox TxtInterestRate, TextBox TxtServiceFee, TextBox TxtPaymentTerms, TextBox TxtStartAmort, TextBox TxtEndAmort, CheckBox CkPaidUpLoan, DropDownList DDLLoanType)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;

                string sql = "select * from LoanTransaction where TransactCode = @TransactCode";
                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.CommandType = CommandType.Text;
                    CMD.Parameters.AddWithValue("@TransactCode", TransactCode);
                    cnn.Open();
                    try
                    {
                        SqlDataReader dr = CMD.ExecuteReader();
                        while (dr.Read())
                        {
                            DateTime ChequeDate = (DateTime)dr["ChequeDate"];
                            DateTime DateRelease = (DateTime)dr["DateRelease"];
                            DateTime StartDate = (DateTime)dr["StartDate"];
                            DateTime EndDate = (DateTime)dr["EndDate"];
                            DateTime LoanDate = (DateTime)dr["DateFiled"];
                            TxtLoanAppNo.Text = dr["ApplicationNum"].ToString();
                            TxtLoanDate.Text = LoanDate.ToShortDateString();
                            TxtIssuedCheque.Text = dr["ChequeNum"].ToString();
                            TxtIssuedChequeDate.Text = ChequeDate.ToShortDateString();
                            TxtChequeReleasedDate.Text = DateRelease.ToShortDateString();
                            TxtPrincipalAmount.Text = dr["PrincipalAmount"].ToString();
                            TxtInterestRate.Text = dr["InterestRate"].ToString();
                            TxtServiceFee.Text = dr["ProcessingFee"].ToString();
                            TxtPaymentTerms.Text = dr["NumTerm"].ToString();
                            TxtStartAmort.Text = StartDate.ToShortDateString();
                            TxtEndAmort.Text = EndDate.ToShortDateString();
                            if (dr["Paid"].ToString() == "False")
                            {
                                CkPaidUpLoan.Checked = false;
                            }
                            else
                            {
                                CkPaidUpLoan.Checked = true;
                            }
                            DDLLoanType.SelectedValue = dr["LoanId"].ToString();
                        }
                    }
                    catch
                    {

                    }
                }

            }
        } //LoadEmpTransactRecord

        public static bool InsertLoanTransaction(string TransactCode, string EmpId, 
            string LoanID, string DivisionId, string ApplicationNum, string DateFiled,
            string ChequeNum, string ChequeDate, string DateRelease, string StartDate,
            string EndDate, double PrincipalAmount, int NumTerm, double InterestRate, double ProcessingFee, bool Paid)
        {

            double Amortization;

            Amortization = PrincipalAmount / NumTerm;

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

//                string sql = @"INSERT INTO LOANTRANSACTION VALUES 
//                    (@TRANSACTCODE,@EMPID,@LOANID,@DIVISIONID,@APPLICATIONNUM,
//                    @DATEFILED,@CHEQUENUM,@CHEQUEDATE,@DATERELEASE,@STARTDATE,
//                    @ENDDATE,@PRINCIPALAMOUNT,@NUMTERM,@INTERESTRATE,
//                    @PROCESSINGFEE,@AMORTIZATION,@PAID,@USERID)";
                string sql = @"INSERT INTO LOANTRANSACTION VALUES 
                    (@TRANSACTCODE,@EMPID,@LOANID,@DIVISIONID,@APPLICATIONNUM,
                    @DATEFILED,@CHEQUENUM,@CHEQUEDATE,@DATERELEASE,@STARTDATE,
                    @ENDDATE,@PRINCIPALAMOUNT,@NUMTERM,@INTERESTRATE,
                    @PROCESSINGFEE,@AMORTIZATION,@PAID)";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@TRANSACTCODE", TransactCode);
                    CMD.Parameters.AddWithValue("@EMPID", EmpId);
                    CMD.Parameters.AddWithValue("@LOANID", LoanID);
                    CMD.Parameters.AddWithValue("@DIVISIONID", DivisionId);
                    CMD.Parameters.AddWithValue("@APPLICATIONNUM", ApplicationNum);
                    CMD.Parameters.AddWithValue("@DATEFILED", DateFiled);
                    CMD.Parameters.AddWithValue("@CHEQUENUM", ChequeNum);
                    CMD.Parameters.AddWithValue("@CHEQUEDATE", ChequeDate);
                    CMD.Parameters.AddWithValue("@DATERELEASE", DateRelease);
                    CMD.Parameters.AddWithValue("@STARTDATE", StartDate);
                    CMD.Parameters.AddWithValue("@ENDDATE", EndDate);
                    CMD.Parameters.AddWithValue("@PRINCIPALAMOUNT", PrincipalAmount);
                    CMD.Parameters.AddWithValue("@NUMTERM", NumTerm);
                    CMD.Parameters.AddWithValue("@INTERESTRATE", InterestRate);
                    CMD.Parameters.AddWithValue("@PROCESSINGFEE", ProcessingFee);
                    CMD.Parameters.AddWithValue("@AMORTIZATION", Amortization);
                    CMD.Parameters.AddWithValue("@PAID", Paid);
                    //CMD.Parameters.AddWithValue("@USERID", UserID);
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
        }


        public static bool DeleteRecord(string TransactID)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = "Delete from LoanTransaction WHERE TransactCode=@TransactCode";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@TransactCode", TransactID);
                    try
                    {
                        int rowsAffected = CMD.ExecuteNonQuery();
                        if (rowsAffected == 0)
                        {
                            return false;
                        }
                        else
                        {
                            CMD.CommandText = "Delete from LoanAmortization WHERE Transactcode = @TransactCode";
                            CMD.Parameters.AddWithValue("@TransactCode", TransactID);
                            CMD.ExecuteNonQuery();                            
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

        public static bool UpdateLoanTransaction(string TransactCode, string EmpId,
            string LoanID, string DivisionId, string ApplicationNum, string DateFiled,
            string ChequeNum, string ChequeDate, string DateRelease, string StartDate,
            string EndDate, double PrincipalAmount, int NumTerm, double InterestRate, double ProcessingFee, bool Paid)
        {

            double Amortization;

            Amortization = Math.Round(PrincipalAmount / NumTerm,2);

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = @"Update LOANTRANSACTION set LoanId = @LOANID, DivisionID = @DIVISIONID, ApplicationNum = @APPLICATIONNUM,
                    DateFiled = @DATEFILED, ChequeNum = @CHEQUENUM, ChequeDate = @CHEQUEDATE, DateRelease = @DATERELEASE, StartDate = @STARTDATE,
                    EndDate = @ENDDATE, PrincipalAmount = @PRINCIPALAMOUNT, Numterm = @NUMTERM, InterestRate = @INTERESTRATE,
                    ProcessingFee = @PROCESSINGFEE, Amortization = @AMORTIZATION,Paid = @PAID where TransactCode= @TRANSACTCODE and EmpID = @EmpID";
                //add userid to be updated also
                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@TRANSACTCODE", TransactCode);
                    CMD.Parameters.AddWithValue("@EMPID", EmpId);
                    CMD.Parameters.AddWithValue("@LOANID", LoanID);
                    CMD.Parameters.AddWithValue("@DIVISIONID", GetDivisionID(DivisionId));
                    CMD.Parameters.AddWithValue("@APPLICATIONNUM", ApplicationNum);
                    CMD.Parameters.AddWithValue("@DATEFILED", DateFiled);
                    CMD.Parameters.AddWithValue("@CHEQUENUM", ChequeNum);
                    CMD.Parameters.AddWithValue("@CHEQUEDATE", ChequeDate);
                    CMD.Parameters.AddWithValue("@DATERELEASE", DateRelease);
                    CMD.Parameters.AddWithValue("@STARTDATE", StartDate);
                    CMD.Parameters.AddWithValue("@ENDDATE", EndDate);
                    CMD.Parameters.AddWithValue("@PRINCIPALAMOUNT", PrincipalAmount);
                    CMD.Parameters.AddWithValue("@NUMTERM", NumTerm);
                    CMD.Parameters.AddWithValue("@INTERESTRATE", InterestRate);
                    CMD.Parameters.AddWithValue("@PROCESSINGFEE", ProcessingFee);
                    CMD.Parameters.AddWithValue("@AMORTIZATION", Amortization);
                    CMD.Parameters.AddWithValue("@PAID", Paid);
                    //add userid to be updated also

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
        }

        private static string GetDivisionID(string DivisionId)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = "select DivisionID from DivisionLib WHERE DivisionName=@DivisionName";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@DivisionName", DivisionId);
                    try
                    {
                        object o = CMD.ExecuteScalar();
                        return o.ToString();
                    }
                    catch
                    {
                        string value = "NaN";
                        return value;
                    }
                }
            }
        } //get Division ID

        public static bool CheckIfExist(string TransactCode)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = "select isnull(count(TransactCode),0) as TransactIDExist from LoanTransaction WHERE TransactCode=@TransactCode";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@TransactCode", TransactCode);
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

        public static bool InsertLoanAmortization(string TransactCode, string AmortCode, string EmpID, string Paydate, double PayAmount, double IntAmount, double Balance, bool Paid)
        {

            Balance = Balance - (PayAmount + IntAmount);

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

//                string sql = @"INSERT INTO LOANTRANSACTION VALUES 
//                    (@TRANSACTCODE,@EMPID,@LOANID,@DIVISIONID,@APPLICATIONNUM,
//                    @DATEFILED,@CHEQUENUM,@CHEQUEDATE,@DATERELEASE,@STARTDATE,
//                    @ENDDATE,@PRINCIPALAMOUNT,@NUMTERM,@INTERESTRATE,
//                    @PROCESSINGFEE,@AMORTIZATION,@PAID)";

                //using (SqlCommand CMD = new SqlCommand(sql, cnn))
                //{
                //    //CMD.Parameters.AddWithValue("@TRANSACTCODE", TransactCode);
                //    //CMD.Parameters.AddWithValue("@EMPID", EmpId);
                //    //CMD.Parameters.AddWithValue("@LOANID", LoanID);
                //    //CMD.Parameters.AddWithValue("@DIVISIONID", DivisionId);
                //    //CMD.Parameters.AddWithValue("@APPLICATIONNUM", ApplicationNum);
                //    //CMD.Parameters.AddWithValue("@DATEFILED", DateFiled);
                //    //CMD.Parameters.AddWithValue("@CHEQUENUM", ChequeNum);
                //    //CMD.Parameters.AddWithValue("@CHEQUEDATE", ChequeDate);
                //    //CMD.Parameters.AddWithValue("@DATERELEASE", DateRelease);
                //    //CMD.Parameters.AddWithValue("@STARTDATE", StartDate);
                //    //CMD.Parameters.AddWithValue("@ENDDATE", EndDate);
                //    //CMD.Parameters.AddWithValue("@PRINCIPALAMOUNT", PrincipalAmount);
                //    //CMD.Parameters.AddWithValue("@NUMTERM", NumTerm);
                //    //CMD.Parameters.AddWithValue("@INTERESTRATE", InterestRate);
                //    //CMD.Parameters.AddWithValue("@PROCESSINGFEE", ProcessingFee);
                //    //CMD.Parameters.AddWithValue("@AMORTIZATION", Amortization);
                //    //CMD.Parameters.AddWithValue("@PAID", Paid);
                //    //CMD.Parameters.AddWithValue("@USERID", UserID);
                //    try
                //    {
                //        CMD.ExecuteNonQuery();
                //        return true;
                //    }
                //    catch
                //    {
                //        return false;
                //    }
                //}
            }

            return false;
        }
    } //helpers
} // namespace