using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;
using System.Text;
using System.Net;
//using ExpertTexting_API_Sample_Csharp.com.experttexting.www;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Json;
using System.Runtime.Serialization;
using Telerik.Web.UI;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Net.Http;
using System.Web.Script.Serialization;
/// <summary>
/// Summary description for Helper
/// </summary>
public class MessageBox
{
    public MessageBox()
    {
        //
        // TODO: Add constructor logic here
        //
    }

  
  

    public static void Show(UpdatePanel updatepanel, string message)
    {
        ScriptManager.RegisterStartupScript(updatepanel, updatepanel.GetType(), "MessageBox", "alert('" + message + "')", true);
    }
    public static void Show(Page page, string message)
    {
        ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "MessageBox", "alert('" + message + "')", true);
    }

  


}