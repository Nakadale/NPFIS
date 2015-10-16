using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Globalization;

/// <summary>
/// Summary description for Helper
/// </summary>
public static class Helper
{

    public static DataTable LoadDivisionLib()
    {
        DataTable dtu = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT * FROM DivisionLib";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dtu);
                if (dtu.Rows.Count > 0)
                {
                    return dtu;
                }
                else
                {
                    DataRow dru = dtu.NewRow();
                    dtu.Rows.Add(dru);

                    return dtu;
                }
            }
        }
    }

    public static DataTable LoadTotalAmount()
    {
        DataTable dtu = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT * FROM DivisionLib";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dtu);
                if (dtu.Rows.Count > 0)
                {
                    return dtu;
                }
                else
                {
                    DataRow dru = dtu.NewRow();
                    dtu.Rows.Add(dru);

                    return dtu;
                }
            }
        }
    }
    
    
    
    public static string[] Split(string concatenatedString)
    {
        string[] result = concatenatedString.Split('|');
        return result;
    }

    public static bool UpdateMembers(string empid, string address, string contactno, string birthdate, string firstname, string lastname, string midname, double salary, string perofshare, string divisionid)
    {
        DataTable dt = new DataTable();

        using (SqlConnection cnn = new SqlConnection())
        {
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = "INSERT INTO Member (empid, address, contactno, birthdate, firstname, lastname, midname, salary, perofshare, divisionid)  VALUES(@empid, @address, @contactno, @birthdate, @firstname, @lastname, @midname, @salary, @perofshare, @divisionid)";


            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.AddWithValue("@empid", empid);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@contactno", contactno);
                cmd.Parameters.AddWithValue("@birthdate", birthdate);
                cmd.Parameters.AddWithValue("@firstname", firstname);
                cmd.Parameters.AddWithValue("@lastname", lastname);
                cmd.Parameters.AddWithValue("@midname", midname);
                cmd.Parameters.AddWithValue("@salary", salary);
                cmd.Parameters.AddWithValue("@perofshare", perofshare);
                cmd.Parameters.AddWithValue("@divisionid", divisionid);
                //try
                //{
                cmd.ExecuteNonQuery();
                return true;

                //}

                //catch
                //{
                //    return false;


                //}
            }
        }
    }

    public static DataTable LoadDivisionLib2()
    {
        DataTable dtu = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT * FROM DivisionLib";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dtu);
                if (dtu.Rows.Count > 0)
                {
                    return dtu;
                }
                else
                {
                    DataRow dru = dtu.NewRow();
                    dtu.Rows.Add(dru);

                    return dtu;
                }
            }
        }
    }

    public static DataTable LoadMemberSummary()
    {
        DataTable dtu = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString))
        {
            conn.Open();
            string sql = @"Select Distinct(Member.empid), Member.empid + '|' + DivisionLib.divisionname + '|' +  isnull(cast(SUM(amount)as varchar),0) as ED, 
Member.firstname + ' ' + Member.midname + ' ' + Member.lastname as fullname
from Member
Left outer join DivisionLib ON Member.divisionid = DivisionLib.divisionid
Left outer join SharesDetail ON Member.empid = SharesDetail.empid
GROUP BY Member.empid, Member.firstname, Member.midname, Member.lastname, DivisionLib.divisionname; ";


            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dtu);
                if (dtu.Rows.Count > 0)
                {
                    return dtu;
                }
                else
                {
                    DataRow dru = dtu.NewRow();
                    dtu.Rows.Add(dru);

                    return dtu;
                }

            }

        }


    }
    public static bool InsertMemberMaintenance(string empid, string address, string contactno, string birthdate, string firstname, string lastname, string midname, double salary, string perofshare, string divisionid, string userid)
    {
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString))
        {
            conn.Open();
            string sql = @"INSERT INTO Member (empid,lastname,firstname,midname,divisionid,birthdate,contactno,address,salary,perofshare,userid) VALUES(@empid,@lastname,@firstname,@midname,@divisionid,@birthdate,@contactno,@address,@salary,@perofshare, @userid)";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@empid", empid);
                cmd.Parameters.AddWithValue("@lastname", lastname);
                cmd.Parameters.AddWithValue("@firstname", firstname);
                cmd.Parameters.AddWithValue("@midname", midname);
                cmd.Parameters.AddWithValue("@divisionid", divisionid);
                cmd.Parameters.AddWithValue("@birthdate", birthdate);
                cmd.Parameters.AddWithValue("@contactno", contactno);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@salary", salary);
                cmd.Parameters.AddWithValue("@perofshare", perofshare);
                cmd.Parameters.AddWithValue("@userid", userid);



                cmd.ExecuteNonQuery();
                return true;
            }

        }

    }


    //public static void LoadShareDetailGrid(string empid, string dateremit, string amount, string remarks, string salary, string perofshare)
    //{
    //    SqlConnection cnn = new SqlConnection();
    //    cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
    //    cnn.Open();

    //    string sql = @"select * from SharesDetail"
    //        using (SqlCommand CMD = new SqlCommand(sql, cnn))
    //        {
    //            CMD.CommandType = CommandType.Text

    //        }
    //}

    public static void LoadSearchedMember(string querystring, TextBox empid, TextBox lastname, TextBox firstname,
        TextBox midname, DropDownList divisionid, TextBox birthdate, TextBox contactno, TextBox address, 
        TextBox salary, TextBox perofshare)
    {
        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
        cnn.Open();

        string sql = @"select * from Member where empid=@empid";
        using (SqlCommand CMD = new SqlCommand(sql, cnn))
        {
            CMD.CommandType = CommandType.Text;
            CMD.Parameters.AddWithValue("@empid", querystring);
            //cnn.Open();
            try
            {
                SqlDataReader dr = CMD.ExecuteReader();
                while (dr.Read())
                {
                    empid.Text = dr["empid"].ToString();
                    lastname.Text = dr["lastname"].ToString();
                    firstname.Text = dr["firstname"].ToString();
                    midname.Text = dr["midname"].ToString();
                    divisionid.Text = dr["divisionid"].ToString();
                    birthdate.Text = ((DateTime)dr["birthdate"]).ToShortDateString();
                    contactno.Text = dr["contactno"].ToString();
                    address.Text = dr["address"].ToString();
                    salary.Text = ((decimal)dr["salary"]).ToString("N", CultureInfo.InvariantCulture);
                    perofshare.Text = dr["perofshare"].ToString();

                }
            }
            catch
            {

            }
        }
    } //LoadSearchedMember

    public static void LoadMemberShare(string empid, TextBox fullname, TextBox divisionname,
        TextBox branch, TextBox salary, TextBox perofshare, TextBox empid2)
    {
        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
        cnn.Open();

        string sql = @"select lastname + ', ' + firstname + ' ' + midname as fullname, divisionname, salary, branchname, perofshare, empid from member
            left outer join DivisionLib on divisionlib.divisionid = member.divisionid
            left outer join BranchLib on divisionlib.branchid = BranchLib.branchid
            where EMPID = @EMPID";
        using (SqlCommand CMD = new SqlCommand(sql, cnn))
        {
             CMD.CommandType = CommandType.Text;
                CMD.Parameters.AddWithValue("@EmpID", empid);
                //cnn.Open();
                try
                {
                    SqlDataReader dr = CMD.ExecuteReader();
                    while (dr.Read())
                    {

                        empid2.Text = dr["empid"].ToString();
                        fullname.Text = dr["fullname"].ToString();
                        branch.Text = dr["BranchName"].ToString();
                        divisionname.Text = dr["DivisionName"].ToString();
                        salary.Text = dr["salary"].ToString();
                        perofshare.Text = dr["perofshare"].ToString();
                    }
                }
                catch
                {

                }

        }
    
    }




    public static DataTable LoadMembers(string querystring)
    {


        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString))
        {
            conn.Open();

            string sql = @"SELECT * FROM member where firstname like @SearchKey or lastname like @SearchKey or midname like @SearchKey";

            SqlCommand cmd = new SqlCommand(sql, conn);

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

    }//LoadMembers

    public static bool DeleteMembers(string empid)
    {
        DataTable dt = new DataTable();

        using (SqlConnection cnn = new SqlConnection())
        {
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            // string sql = "Delete Member where empid=@empid, address=@address, contactno=@contactno, birthdate=@birthdate, firstname=@firstname, lastname=@lastname, midname=@midname, salary=@salary, perofshare=@perofshare, divisionid=@divisionid";
            string sql = "Delete Member where empid=@empid";

            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.AddWithValue("@empid", empid);
                //cmd.Parameters.AddWithValue("@address", address);
                //cmd.Parameters.AddWithValue("@contactno", contactno);
                //cmd.Parameters.AddWithValue("@birthdate", birthdate);
                //cmd.Parameters.AddWithValue("@firstname", firstname);
                //cmd.Parameters.AddWithValue("@lastname", lastname);
                //cmd.Parameters.AddWithValue("@midname", midname);
                //cmd.Parameters.AddWithValue("@salary", salary);
                //cmd.Parameters.AddWithValue("@perofshare", perofshare);
                //cmd.Parameters.AddWithValue("@divisionid", divisionid);

                try
                {
                    cmd.ExecuteNonQuery();
                    return true;

                }

                catch
                {
                    return false;


                }
            }
        }
    }//DeleteMembers

    public static bool UpdatingMembers(string empid, string address, string contactno, string birthdate, string firstname, string lastname, string midname, double salary, string perofshare, string divisionid)
    {
        DataTable dt = new DataTable();

        using (SqlConnection cnn = new SqlConnection())
        {
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = @"Update Member set address=@address, contactno=@contactno,
birthdate=@birthdate, firstname=@firstname, lastname=@lastname, midname=@midname,
salary=@salary, perofshare=@perofshare, divisionid=@divisionid WHERE empid=@empid";
            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.AddWithValue("@empid", empid);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@contactno", contactno);
                cmd.Parameters.AddWithValue("@birthdate", birthdate);
                cmd.Parameters.AddWithValue("@firstname", firstname);
                cmd.Parameters.AddWithValue("@lastname", lastname);
                cmd.Parameters.AddWithValue("@midname", midname);
                cmd.Parameters.AddWithValue("@salary", salary);
                cmd.Parameters.AddWithValue("@perofshare", perofshare);
                cmd.Parameters.AddWithValue("@divisionid", divisionid);

               
                try
                {
                    cmd.ExecuteNonQuery();
                    return true;

                }

                catch
                {
                    return false;


                }

            }
        }

    }//UpdatingMembers



    public static DataTable LoadShareDetails(string empid)
    {
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString))
        {


            conn.Open();

            string sql = @"SELECT * FROM SharesDetail WHERE empid=@empid";

            SqlCommand cmd = new SqlCommand(sql, conn);


            SqlDataAdapter da = new SqlDataAdapter(cmd);


            DataTable dt = new DataTable();

            cmd.Parameters.AddWithValue("@empid", empid);


            da.Fill(dt);

            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }

            return dt;


        }

    }//LoadShareDetails

    public static void LoadTotalContribution(string empid, Label lblTotalShareValue)
    {
        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;

        string sql = @"select empid,isnull(cast(SUM(amount)as varchar),0) as TotalContribution from SharesDetail where empid=@empid
group by empid ";

        using (SqlCommand CMD = new SqlCommand(sql, cnn))
        {
            CMD.CommandType = CommandType.Text;
            CMD.Parameters.AddWithValue("@empid", empid);
            cnn.Open();
            try
            {
                SqlDataReader dr = CMD.ExecuteReader();
                while (dr.Read())
                {
                   // lblTotalShareValue.Text = ((decimal)dr["TotalContribution"]).ToString("N", CultureInfo.InvariantCulture);
                    lblTotalShareValue.Text = dr["TotalContribution"].ToString();
                }// decimal cannot unbox
            }
            catch
            {

            }
        }
    } //LoadTotalContribution


  

}









