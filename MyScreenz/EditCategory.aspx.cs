using MyScreenz.JSON;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyScreenz
{
    public partial class EditCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static string GetUsers()
        {
            List<User> appUsers = new List<User> {
                new MyScreenz.User { useremail="dlawrence@qstorm.com", userid=1, username="dlawrence"},
                new MyScreenz.User { useremail="jreston@qstorm.com", userid=2, username="jreston"},
                new MyScreenz.User { useremail="ndennis@qstorm.com", userid=3, username="ndennis"},
                new MyScreenz.User { useremail="nmartin@qstorm.com", userid=4, username="nmartin"}
            };
            string jsonString = appUsers.ToJSON();

            return jsonString;
            //HttpContext.Current.Response.Write(json);
        }

    }
}