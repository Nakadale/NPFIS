using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;

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
        } //CreateBlankRecord

        public static DataTable LoadAmortizations(string TransactCode)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = "select TransactCode, AmortCode, PayDate,PayAmount,Balance,Paid from LoanAmortization where TransactCode = @TransactCode";

            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.AddWithValue("@TransactCode", TransactCode);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count == 0)
                {
                    //DataRow dr = dt.NewRow();
                    //dt.Rows.Add(dr);
                }
                return dt;

            }
        } //LoadAmortizations

        public static DataTable LoadSearchedMembers(string querystring)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = @"select lastname,firstname,midname,birthdate, empid from member 
            where firstname like @SearchKey or lastname like @SearchKey or midname like @SearchKey or empid like @SearchKey";

            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.AddWithValue("@SearchKey", querystring + "%");
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
        } //LoadSearchedMembers


        public static DataTable LoadSearchedMembersRemittance(string querystring)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = @"select lastname,firstname,midname,birthdate, empid, Branch from member
            left outer join DivisionLib on member.divisionid = DivisionLib.divisionid
            left outer join BranchLib on DivisionLib.branchid = BranchLib.branchid
            where firstname like @SearchKey or lastname like @SearchKey or midname like @SearchKey or empid like @SearchKey";

            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.AddWithValue("@SearchKey", querystring + "%");
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
        } //LoadSearchedMembers

        public static void LoadSearchedMember(string querystring, TextBox MemberName, TextBox BranchName, TextBox DivisionName)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = @"select lastname + ', ' + firstname + ' ' + midname as Member_name, BranchName, DivisionName from member
            left outer join DivisionLib on divisionlib.divisionid = member.divisionid
            left outer join BranchLib on divisionlib.branchid = BranchLib.branchid
            where EMPID = @EmpID";
            using (SqlCommand CMD = new SqlCommand(sql, cnn))
            {
                CMD.CommandType = CommandType.Text;
                CMD.Parameters.AddWithValue("@EmpID", querystring);
                //cnn.Open();
                try
                {
                    SqlDataReader dr = CMD.ExecuteReader();
                    while (dr.Read())
                    {
                        MemberName.Text = dr["Member_name"].ToString();
                        BranchName.Text = dr["BranchName"].ToString();
                        DivisionName.Text = dr["DivisionName"].ToString();
                    }
                }
                catch
                {

                }
            }
        } //LoadSearchedMember

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
        } //LoadMemberList

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
        } //LoadLoanType

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
                string sql = @"select Case when (Count(TransactCode) <> 0)
                then (select top 1 (TransactCode + 1) as TransactCode from LoanTransaction 
                where YEAR(GETDATE()) = SUBSTRING(TransactCode,0,5) and MONTH(GETDATE()) = SUBSTRING(TransactCode,5,2) 
                order by TransactCode DESC) else (cast(YEAR(GETDATE())as varchar) + 
                case when month(Getdate()) < 10 then '0' + Cast(MONTH(GETDATE())as varchar) 
                else Cast(MONTH(GETDATE())as varchar) end + '0001')
                end as TransactCode from LoanTransaction
                where YEAR(GETDATE()) = SUBSTRING(TransactCode,0,5) and MONTH(GETDATE()) = SUBSTRING(TransactCode,5,2)";

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

        public static DataTable LoadEmpTransactRecord(String EmpID)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;

                string sql = @"select LoanTransaction.TransactCode, LoanType, PrincipalAmount, DateFiled, ISNULL(LoanTransaction.Balance,PrincipalAmount) as Balance, LoanTransaction.Paid  from LoanTransaction 
                left outer join loanlib on loanlib.LoanId = LoanTransaction.LoanId
                left outer join (select TransactCode,Balance, AmortCode from LoanAmortization
                where Paid = 0 and SUBSTRING(AmortCode,6,4) = '0001') as LoanAmort on LoanAmort.TransactCode = LoanTransaction.TransactCode
                where LoanTransaction.EmpID = @EmpID";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.CommandType = CommandType.Text;
                    CMD.Parameters.AddWithValue("@EmpID", EmpID);
                    cnn.Open();
                    try
                    {
                        SqlDataAdapter da = new SqlDataAdapter(CMD);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count == 0)
                        {
                            DataRow dr = dt.NewRow();
                            dt.Rows.Add(dr);
                        }

                        return dt;
                    }
                    catch
                    {
                        DataTable dt = new DataTable();
                        return dt;
                    }
                }

            }
        } //LoadEmpTransactRecord

        public static bool InsertLoanTransaction(string TransactCode, string EmpId,
            string LoanID, string DivisionId, string ApplicationNum, string DateFiled,
            string ChequeNum, string ChequeDate, string DateRelease, string StartDate,
            string EndDate, double PrincipalAmount, int NumTerm, double InterestRate, double ProcessingFee, bool Paid, string UserID, double ChequeAmount)
        {

            DivisionId = GetDivisionID(DivisionId);

            double Amortization;

            Amortization = PrincipalAmount / NumTerm;

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = @"INSERT INTO LOANTRANSACTION(TRANSACTCODE,EMPID,LOANID,
                    DIVISIONID,APPLICATIONNUM,DATEFILED,CHEQUENUM,CHEQUEDATE,DATERELEASE,STARTDATE,
                    ENDDATE,PRINCIPALAMOUNT,NUMTERM,INTERESTRATE,PROCESSINGFEE,AMORTIZATION,PAID,UserID,BALANCE, CHEQUEAMOUNT) VALUES 
                    (@TRANSACTCODE,@EMPID,@LOANID,@DIVISIONID,@APPLICATIONNUM,
                    Convert(DateTime,@DATEFILED,101),@CHEQUENUM,
                    Convert(DateTime,@CHEQUEDATE,101),
                    Convert(DateTime,@DATERELEASE,101),
                    Convert(DateTime,@STARTDATE,101),
                    Convert(DateTime,@ENDDATE,101),
                    @PRINCIPALAMOUNT,@NUMTERM,@INTERESTRATE,
                    @PROCESSINGFEE,@AMORTIZATION,@PAID,@USERID,@BALANCE,@CHEQUEAMOUNT)";

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
                    CMD.Parameters.AddWithValue("@USERID", UserID);
                    CMD.Parameters.AddWithValue("@BALANCE", PrincipalAmount);
                    CMD.Parameters.AddWithValue("@CHEQUEAMOUNT", ChequeAmount);
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
        } //InsertLoanTransaction


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

            Amortization = Math.Round(PrincipalAmount / NumTerm, 2);

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
        } //UpdateLoanTransaction

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

        public static void GenerateAmortization(int NumberOfPayments, string StartDate, Double Balance, int Interest, double ServiceFee, GridView gvAmortizations, TextBox txtTxtEndAmort)
        {
            DataTable dtAmortization = new DataTable();

            dtAmortization.Columns.Add("PayDate", typeof(string));
            dtAmortization.Columns.Add("PayAmount", typeof(double));
            dtAmortization.Columns.Add("Balance", typeof(double));
            dtAmortization.Columns.Add("Paid", typeof(Boolean));

            string PaymentDate;
            double Amount;
            //double TLA = Balance + Interest + ServiceFee;
            double TLA = Balance;
            Amount = (TLA / NumberOfPayments);
            int dayPay;
            int monthPay;
            int yearPay;
            CultureInfo provider = CultureInfo.InvariantCulture;
            DateTime StartDatePayment = DateTime.ParseExact(StartDate, "MM/dd/yyyy", provider);
            for (int Counter = 0; Counter < NumberOfPayments; Counter++)
            {
                //StartDatePayment.AddMonths(Counter).Month;
                dayPay = StartDatePayment.AddMonths(Counter).Day;
                DateTime lastDay = new DateTime((StartDatePayment.AddMonths(Counter).Year), (StartDatePayment.AddMonths(Counter).Month), 1).AddMonths(1).AddDays(-1);

                if (dayPay == lastDay.Day)
                {
                    dayPay = DateTime.DaysInMonth((StartDatePayment.AddMonths(Counter).Year), (StartDatePayment.AddMonths(Counter).Month));
                }
                else
                { }


                monthPay = (StartDatePayment.AddMonths(Counter)).Month;

                yearPay = (StartDatePayment.AddMonths(Counter)).Year;

                PaymentDate = monthPay + "/" + dayPay + "/" + yearPay;

                if (Counter == 0)
                {
                    Balance = (TLA - Amount);
                }
                else
                {
                    Balance = (TLA - (Amount + (Amount * Counter)));
                }
                dtAmortization.Rows.Add(PaymentDate, String.Format("{0:#,0.00}", Amount), String.Format("{0:#,0.00}", Balance), false);

                txtTxtEndAmort.Text = PaymentDate;

            }

            gvAmortizations.DataSource = dtAmortization;
            gvAmortizations.DataBind();
            //DateTime StartAmort;
            //DateTime.TryParse(StartDate, out StartAmort);
            //int AddMonths;
            //int.TryParse(NumberOfPayments, out AddMonths);
            //txtTxtEndAmort.Text = StartAmort.AddMonths(NumberOfPayments).ToString("d");


        } //GenerateAmortization

        public static bool InsertLoanAmortization(string TransactCode, string EmpID, string AmortCode, double IntAmount, GridView dtAmortization, string UserID)
        {
            string PayDate;
            double Balance, Amortization;
            bool Paid;

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                foreach (GridViewRow dt in dtAmortization.Rows)
                {
                    PayDate = ((Label)dtAmortization.Rows[dt.RowIndex].FindControl("lblDateDisp")).Text;
                    double.TryParse(((Label)dtAmortization.Rows[dt.RowIndex].FindControl("lblAmountDisp")).Text, out Amortization);
                    double.TryParse(((Label)dtAmortization.Rows[dt.RowIndex].FindControl("lblBalance")).Text, out Balance);
                    Paid = ((CheckBox)dtAmortization.Rows[dt.RowIndex].FindControl("ckPaidAmort")).Checked;

                    string sql = @"INSERT INTO LOANAMORTIZATION(TRANSACTCODE,AMORTCODE, EMPID, PAYDATE, PAYAMOUNT, INTAMOUNT, BALANCE,PAID, USERID)
                    VALUES (@TRANSACTCODE,@AMORTCODE, @EMPID, @PAYDATE, @PAYAMOUNT, @INTAMOUNT, @BALANCE, @PAID, @USERID);";

                    using (SqlCommand CMD = new SqlCommand(sql, cnn))
                    {
                        CMD.Parameters.AddWithValue("@TRANSACTCODE", TransactCode);
                        CMD.Parameters.AddWithValue("@AMORTCODE", AmortCode.Trim() + (dt.RowIndex + 1).ToString("0000"));
                        CMD.Parameters.AddWithValue("@EMPID", EmpID);
                        CMD.Parameters.AddWithValue("@PAYDATE", PayDate);
                        CMD.Parameters.AddWithValue("@PAYAMOUNT", Amortization);
                        CMD.Parameters.AddWithValue("@INTAMOUNT", IntAmount);
                        CMD.Parameters.AddWithValue("@BALANCE", Balance);
                        CMD.Parameters.AddWithValue("@PAID", Paid);
                        CMD.Parameters.AddWithValue("@USERID", UserID);
                        try
                        {
                            CMD.ExecuteNonQuery();
                            //return true;
                        }
                        catch
                        {
                            return false;
                        }
                    }
                }



            }

            return true;
        } //InsertLoanAmortization


        public static void LoadTransactInfo(string TransactID, TextBox DDLLoanType, TextBox TxtMember, TextBox TxtDivision, TextBox TxtBranch, TextBox TxtLoanApp, TextBox TxtLoanDate, TextBox TxtIssuedCheque,
            TextBox IssuedChequeDate, TextBox ChequeReleasedDate, TextBox TxtPrincipalAmount, TextBox TxtInterestRate, TextBox TxtServiceFee, TextBox TxtPaymentTerms,
            TextBox TxtStartAmort, TextBox TxtEndAmort, CheckBox ChPaidUpLoad, HyperLink ScannedApp)
        {

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;

                string sql = @"select LoanTransaction.*, lastname + ', ' + firstname + ' ' + midname as FullName, branchname, divisionname, LoanLib.Description, isnull(ScannedAppForm.filepath,'\upload\404-no-file.png') as filepath from LoanTransaction
                            left outer join Member on Member.empid = LoanTransaction.EmpId
                            left outer join DivisionLib on DivisionLib.divisionid = LoanTransaction.DivisionId
                            left outer join BranchLib on DivisionLib.branchid = BranchLib.branchid
                            left outer join LoanLib on LoanTransaction.LoanId = LoanLib.LoanId
                            left outer join ScannedAppForm on ScannedAppForm.TransactionCode = LoanTransaction.TransactCode
                            where TransactCode = @TransactID";
                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.CommandType = CommandType.Text;
                    CMD.Parameters.AddWithValue("@TransactID", TransactID);
                    cnn.Open();
                    try
                    {
                        SqlDataReader dr = CMD.ExecuteReader();
                        while (dr.Read())
                        {
                            DDLLoanType.Text = dr["Description"].ToString();
                            TxtMember.Text = dr["FullName"].ToString();
                            TxtDivision.Text = dr["DivisionName"].ToString();
                            TxtBranch.Text = dr["BranchName"].ToString();
                            TxtLoanApp.Text = dr["ApplicationNum"].ToString();
                            TxtLoanDate.Text = ((DateTime)dr["DateFiled"]).ToShortDateString();
                            TxtIssuedCheque.Text = dr["ChequeNum"].ToString();
                            IssuedChequeDate.Text = ((DateTime)dr["ChequeDate"]).ToShortDateString();
                            ChequeReleasedDate.Text = ((DateTime)dr["DateRelease"]).ToShortDateString();
                            TxtPrincipalAmount.Text = ((decimal)dr["PrincipalAmount"]).ToString("N", CultureInfo.InvariantCulture);
                            TxtInterestRate.Text = ((decimal)dr["InterestRate"]).ToString("N", CultureInfo.InvariantCulture);
                            TxtServiceFee.Text = ((decimal)dr["ProcessingFee"]).ToString("N", CultureInfo.InvariantCulture);
                            TxtPaymentTerms.Text = dr["NumTerm"].ToString();
                            TxtStartAmort.Text = ((DateTime)dr["StartDate"]).ToShortDateString();
                            TxtEndAmort.Text = ((DateTime)dr["EndDate"]).ToShortDateString();
                            if (dr["Paid"].ToString() == "0")
                            {
                                ChPaidUpLoad.Checked = false;
                            }
                            else
                            {
                                ChPaidUpLoad.Checked = true;
                            }
                            ScannedApp.NavigateUrl = dr["filepath"].ToString();
                        }
                    }
                    catch
                    {

                    }
                }

            }
        } //LoadTransactInfo

        public static void CreateEntryScannedApp(string TransactID, string File)
        {
            string FilePath = @"\uploads\";
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = @"INSERT INTO ScannedAppForm(TransactionCode,FilePath) VALUES (@TRANSACTID,@FilePath);";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@TRANSACTID", TransactID);
                    CMD.Parameters.AddWithValue("@FilePath", FilePath + File);
                    try
                    {
                        CMD.ExecuteNonQuery();
                    }
                    catch
                    {
                    }
                }
            }
        } //CreateEntryScannedApp

        public static bool UpdateLoanAmortization(string TransactCode, string LoanAmortCode, bool ChkPaid)
        {

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = @"Update LoanAmortization set Paid = @Paid
                where TransactCode= @TRANSACTCODE and AmortCode = @AmortCode";
                
                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@TRANSACTCODE", TransactCode);
                    CMD.Parameters.AddWithValue("@AmortCode", LoanAmortCode);
                    CMD.Parameters.AddWithValue("@Paid", ChkPaid);

                    try
                    {
                        CMD.ExecuteNonQuery();
                        //update balance in LoanTransaction
                        if (ChkPaid == true)
                        {
                            CMD.CommandText = @"update LoanTransaction set LoanTransaction.Balance = LoanAmortization.Balance from LoanTransaction
                                            inner join LoanAmortization on LoanAmortization.AmortCode = @AmortCode and LoanAmortization.TransactCode=@TRANSACTCODE
                                            where LoanTransaction.TransactCode=@TRANSACTCODE";
                        }
                        else
                        {
                            CMD.CommandText = @"update LoanTransaction set LoanTransaction.Balance = LoanAmortization.Balance from LoanTransaction
                                                inner join LoanAmortization on Right(LoanAmortization.AmortCode,5) = 
                                                (select CASE 
                                                WHEN (RIGHT(AmortCode,3) = 01) then
                                                (cast(replicate('0',4-LEN(RIGHT(AmortCode,5))) as nvarchar)) + cast((RIGHT(AmortCode,5)) as nvarchar)
                                                WHEN (RIGHT(AmortCode,3) > 10) then
                                                (cast(replicate('0',6-LEN(RIGHT(AmortCode,5))) as nvarchar)) + cast((RIGHT(AmortCode,5)-1) as nvarchar)
                                                WHEN (RIGHT(AmortCode,3) <= 10) then
                                                (cast(replicate('0',7-LEN(RIGHT(AmortCode,5))) as nvarchar)) + cast((RIGHT(AmortCode,5)-1) as nvarchar)
                                                end as NumberCode from LoanAmortization
                                                where LoanAmortization.TransactCode=@TRANSACTCODE and Right(LoanAmortization.AmortCode,3) = Right(RTRIM(@AmortCode),2))
                                                where LoanTransaction.TransactCode=@TRANSACTCODE";
                        }
                        CMD.ExecuteNonQuery();
                        return true;
                    }
                    catch
                    {
                        return false;
                    }
                }
            }
        } //UpdateLoanAmortization

    } //helpers
} // namespace