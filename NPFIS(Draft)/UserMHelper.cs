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
    public class UserMHelper
    {
        public static DataTable LoadSearchedMembers(string querystring)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = @"select UserID, Name, LastDate from Users
            where UserID like @SearchKey or Name like @SearchKey";

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

        public static void LoadUserInformation(string userID, TextBox TxtUserID, TextBox TxtUserName, TextBox TxtPassword, 
            TextBox TxtVerifyPassword , CheckBox ChkAllow, CheckBox ChkActive)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
            cnn.Open();

            string sql = @"select * from Users where USERID = @UserID";
            using (SqlCommand CMD = new SqlCommand(sql, cnn))
            {
                CMD.CommandType = CommandType.Text;
                CMD.Parameters.AddWithValue("@UserID", userID);
                try
                {
                    SqlDataReader dr = CMD.ExecuteReader();
                    while (dr.Read())
                    {
                        TxtUserName.Text = dr["NAME"].ToString();
                        TxtPassword.Text = dr["Password"].ToString();
                        TxtVerifyPassword.Text = dr["Password"].ToString();
                        TxtUserID.Text = dr["UserID"].ToString();
                        if (((bool)dr["allow"]) == true)
                        {
                            ChkAllow.Checked = true;
                        }
                        else
                        {
                            ChkAllow.Checked = false;
                        }

                        if (((bool)dr["active"]) == true)
                        {
                            ChkActive.Checked = true;
                        }
                        else
                        {
                            ChkActive.Checked = false;
                        }

                    }
                }
                catch
                {

                }
            }
        } // LoadUserInformation

        public static bool InsertUser(string UserID, string UserName, string Password, bool ChkAllow, bool ChkActive)
        {

            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = @"INSERT INTO Users(UserId, Name, Password, Allow, Active) VALUES 
                    (@UserID,@Name,@Password,@Allow,@Active)";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@UserID", UserID);
                    CMD.Parameters.AddWithValue("@Name", UserName);
                    CMD.Parameters.AddWithValue("@Password", Password);
                    CMD.Parameters.AddWithValue("@Allow", ChkAllow);
                    CMD.Parameters.AddWithValue("@Active", ChkActive);
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
        } //InsertUser

        public static bool DeleteUser(string UserID)
        {
            using (SqlConnection cnn = new SqlConnection())
            {
                cnn.ConnectionString = ConfigurationManager.ConnectionStrings["NPFISCS"].ConnectionString;
                cnn.Open();

                string sql = "Delete from Users WHERE UserID=@UserID";

                using (SqlCommand CMD = new SqlCommand(sql, cnn))
                {
                    CMD.Parameters.AddWithValue("@UserID", UserID);
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
        } //DeleteUser
    }
}