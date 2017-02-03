using System;
using System.Collections.Generic;
using System.Linq;
using System.Management.Automation;
using System.Management.Automation.Remoting;
using System.Management.Automation.Runspaces;
using System.Security;
using System.Collections.ObjectModel;
using System.Text;
namespace Office365
{
    class Program
    {
        static void Main(string[] args)
        {
            string username = "ExchangeAdminID";
            string password = "Password";
            System.Security.SecureString securepassword = new 
              System.Security.SecureString();
            foreach (char c in password)
            {
                securepassword.AppendChar(c);
            }
            PSCredential credential = new PSCredential(username, 
              securepassword);
            WSManConnectionInfo connectioninfo = new 
              WSManConnectionInfo(new Uri(
              "https://ps.outlook.com/powershell"), 
              "http://schemas.microsoft.com/powershell/Microsoft.Exchange", 
              credential);
            connectioninfo.AuthenticationMechanism = 
              AuthenticationMechanism.Basic;
            //connectioninfo.AuthenticationMechanism = 
              AuthenticationMechanism.Basic;
            connectioninfo.MaximumConnectionRedirectionCount = 2;
            //connectioninfo.MaximumConnectionRedirectionCount = 2;
            using (Runspace runspace = 
              RunspaceFactory.CreateRunspace(connectioninfo))
            {
                runspace.Open();
                using (PowerShell powershell = PowerShell.Create())
                {
                    powershell.Runspace = runspace;
                    //Create the command and add a parameter
                    powershell.AddCommand("Get-Mailbox");
                    powershell.AddParameter("RecipientTypeDetails", 
                      "UserMailbox");
                    //powershell.
                    //Invoke the command and store the results in a 
                      PSObject collection
                    Collection<PSObject> results = 
                      powershell.Invoke();
                    foreach (PSObject result in results)
                    {
                        string createText = string.Format("Name: {0} 
                          Alias: {1} Mail: {2}", result.Properties[
                          "DisplayName"].Value.ToString(), result.
                          Properties["Alias"].Value.ToString(), 
                          result.Properties["PrimarySMTPAddress"].
                          Value.ToString());
                        System.IO.File.WriteAllText("C:\\User.txt", 
                          createText);
                    }
                }
            }
        }
    }
}
