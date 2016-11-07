using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyScreenz.JSON;
using System.ComponentModel.DataAnnotations;

namespace MyScreenz
{
	public partial class UserRoles : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        [WebMethod]
        public static string GetUsers()
        {
            string json = "{'users':[{'name':'Mary White','email':'mwhite@qtstorm.com'},{'name':'Jane Whitehall','email':'jmwhitehall@qtstorm.com'},{'name':'Mark Leeke','email':'mleeke@qtstorm.com'}]}";

            string kson = "'users':[{'id': '1','name: 'Person1'},{'id': '2,'name': 'Person2'},{'id':'3','name':'Person3'}]}";

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

        [System.Web.Services.WebMethod]
        public static string GetRoles()
        {
            List<Roles> appRoles = new List<Roles>
            {
                new Roles { active="1", rolename="Admin",roleid=1 },
                new Roles { active="1", rolename="Document Admin",roleid=2 },
                new Roles { active="1", rolename="Meeting Admin",roleid=3 },
                new Roles { active="1", rolename="User Admin",roleid=4 },
                new Roles { active="1", rolename="Settings Admin",roleid=5 },

            };

            return appRoles.ToJSON();
        }

        [System.Web.Services.WebMethod]
        public static string GetCategories()
        {
            List<Category> categorys = new List<Category>
            {
                new Category { active=false, catname="General",catid=1 },
                new Category { active=true, catname="Meeting",catid=2 },
                new Category { active=false, catname="Private",catid=3 },
                new Category { active=false, catname="Public",catid=4 },
                new Category { active=true, catname="Basic",catid=5 }
            };

            return categorys.ToJSON();
        }

        [System.Web.Services.WebMethod]
        public static string GetSettings()
        {
            List<Setting> settings = new List<Setting>
            {
                new Setting {  sname="ApplicationTitle",sid=1, stext="MCU Board Cloud Application"},
                new Setting {  sname="DocTabOne",sid=1, stext="Current Documents" },
                new Setting {  sname="DocTabTwo",sid=1 , stext="My Documents"},
                new Setting {  sname="DocPageTitle",sid=1 , stext="Available Documents"},
                new Setting {  sname="MeetingPageTitle",sid=1 , stext="Upcoming Meetings"},
                new Setting {  sname="MeetTabOneTitle",sid=1, stext="My Meetings" },
                new Setting {  sname="MeetTabTwoTitle",sid=1, stext="Recurring Meetings" }

            };

            return settings.ToJSON();
        }
    }

    public class User {

        public string username { get; set; }
        public int userid { get; set; }
        public string useremail { get; set; }
        public bool active { get; set; }
    }

    public class Category
    {
        public string catname { get; set; }
        public int catid { get; set; }
        public bool active { get; set; }
    }

    public class Setting
    {
        [Required(ErrorMessage ="The name field gre is a required field")]
        public string sname { get; set; }
        public string stext { get; set; }
        public int sid { get; set; }
        public bool active { get; set; }


    }

    public class Roles
    {

        public string rolename { get; set; }
        public int roleid { get; set; }
        public string active { get; set; }


    }
}