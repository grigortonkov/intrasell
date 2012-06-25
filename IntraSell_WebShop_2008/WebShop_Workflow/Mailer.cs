using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mail;
using log4net;
using System.Configuration;
namespace IntraSell
{
    public class Mailer
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(Mailer));

        public static void TestMail()
        {
            string from = "grigor.tonkov@griton.eu";
            string to = "grigor.tonkov@gmail.com";
            string subject = "Start Workflow";
            string body = "How are you?";

            SmtpMail.SmtpServer = "localhost"; 

            SmtpMail.Send(from, to, subject, body);
        }

        /// <summary>
        /// Mailer Function
        /// </summary>
        /// <param name="from"></param>
        /// <param name="to"></param>
        /// <param name="subject"></param>
        /// <param name="body"></param>
        /// <returns>Message containg info if mail send.</returns>
        public static string Mail(string from, string to, string subject, string body)
        {

            //string from = "grigor.tonkov@griton.eu";
            //string to = "grigor.tonkov@gmail.com";
            //string subject = "Start Workflow";

            //string body = "How are you?";
            log.Debug("Send Mail");
            log.Debug("From: " + from);
            log.Debug("To: " + to);
            log.Debug("Subject: " + subject);
           


            string smtp_server = "localhost";
            string workflow_email = "donotrespond@griton.eu";

            try
            {
                smtp_server = ConfigurationManager.AppSettings.Get("SMTP_SERVER");
                workflow_email = ConfigurationManager.AppSettings.Get("EMAIL_WORKFLOW");
            }
            catch (Exception ex)
            {
                log.Error("Mail:" + ex);
                SmtpMail.SmtpServer = smtp_server;
                from = workflow_email;
            }
            log.Debug("smtp_server: " + smtp_server);
            log.Debug("workflow_email: " + workflow_email);


            SmtpMail.SmtpServer = smtp_server; // "www.griton.eu"; // "92.51.136.233"; // 
            MailMessage message = new MailMessage();
            message.BodyFormat = MailFormat.Html;
            message.Body = body.Replace("&", "&amp;").Replace("\t", "&nbsp;&nbsp;&nbsp;&nbsp;");
            message.From = from;
            message.To = to;
            message.Subject = subject;


            log.Debug("Mailtext: " + message.Body);

            try
            {
                SmtpMail.Send(message);
                //SmtpMail.Send(from, to, subject, body);
            }
            catch (Exception ex)
            {
                log.Error("Error sending mail: " + ex);
                log.Error("Error sending mail stack: " + ex.StackTrace);
                return ex.Message;
            }
            return "OK";
        }
    }
}
