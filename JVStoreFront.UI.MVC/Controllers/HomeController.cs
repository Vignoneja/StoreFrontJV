using JVStoreFront.UI.MVC.Models;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;

namespace JVStoreFront.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]        
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [HttpPost]
        public JsonResult ContactAjax(ContactViewModel cvm)
        {
            if (!ModelState.IsValid)
            {
                return Json(cvm);
            }
            string body = $"You have received an email from <strong>{cvm.Name}</strong>. The email address given was <strong>{cvm.Email}</strong>.<br/><strong>The following message was sent:</strong> {cvm.Message}";
            string EmailUser = ConfigurationManager.AppSettings["EmailUser"].ToString();
            string EmailClient = ConfigurationManager.AppSettings["EmailClient"].ToString();
            string EmailPassword = ConfigurationManager.AppSettings["EmailPassword"].ToString();
            string EmailTo = ConfigurationManager.AppSettings["EmailTo"].ToString();

            MailMessage mm = new MailMessage(EmailUser, EmailTo, "GameStore.Vignonetech.com", body);

            mm.IsBodyHtml = true;
            mm.ReplyToList.Add(cvm.Email);

            SmtpClient smtp = new SmtpClient(EmailClient);
            //NetworkCredential cred = new NetworkCredential(EmailUser, EmailPassword);
            smtp.Port = 8889;

            smtp.Credentials = new NetworkCredential(EmailUser, EmailPassword);
            smtp.Send(mm);
            return Json(cvm);
        }
        public PartialViewResult ContactConfirmation(string name, string email)
        {
            ViewBag.Name = name;
            ViewBag.Email = email;
            return PartialView("ContactConfirmation");
        }
    }
}
