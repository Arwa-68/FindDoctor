using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Web.Security;
public partial class LognDB : System.Web.UI.MasterPage
{
    MenuItem X;
    protected void Page_Load(object sender, EventArgs e)
    {
        //return;
        //this.Context.User.Identity.IsAuthenticated
        if (!this.Context.User.Identity.IsAuthenticated)
        {
            string[] EI = Context.Request.Url.ToString().Split(new char[] { '/' });
            string MENI = "";
            try
            {
                MENI = EI[EI.Length - 1].Replace("#", "").Replace(" ", "");
                MENI = MENI.Substring(0, MENI.IndexOf("aspx") + 4);
            }
            catch { }
            //if (MENI != "Login.aspx" || MENI !="Login" )
            //    Response.Redirect(FormsAuthentication.LoginUrl); //+ ".aspx");
        }

        

    }
   
    
}
