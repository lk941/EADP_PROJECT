// using SendGrid's C# Library
// https://github.com/sendgrid/sendgrid-csharp
using SendGrid;
using SendGrid.Helpers.Mail;
using System;
using System.Threading.Tasks;
using EADProj.BLL;

namespace EADProj.Email 
{
    public class SendGridEmail
    {
        public static void Main()
        {
            
        }

        public void sendEmail(string email, string name, string content)
        {
            Execute(email, name, content);
        }

        public static async Task Execute(string email, string name, string content)
        {
            //var apiKey = Environment.GetEnvironmentVariable("API_KEY");
            var apiKey = "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";
            var client = new SendGridClient(apiKey);
            var from = new EmailAddress("likey@likey.com", "Likey (Please Do Reply)");
            var subject = "Just to verify that it's you.";
            var to = new EmailAddress(email, name);
            var plainTextContent = "Click here to get verified";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, content);
            //msg.AddContent(MimeType.Html, content);
            var response = await client.SendEmailAsync(msg).ConfigureAwait(false);
            System.Diagnostics.Debug.WriteLine("SENDING CONTENT " + content);
            //var response = await client.SendEmailAsync(msg);

            System.Diagnostics.Debug.WriteLine(response.StatusCode);
            System.Diagnostics.Debug.WriteLine(response.Body.ReadAsStringAsync().Result); // The message will be here
            System.Diagnostics.Debug.WriteLine(response.Headers.ToString());
            
        }
    }
}
