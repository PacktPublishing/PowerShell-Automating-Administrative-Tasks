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
            string username = "DSCDEMOLAB\\SKBAdminID";
            string password = "SecureString";

            System.Security.SecureString securepassword = new System.Security.SecureString();

            foreach (char c in password)
            {
                securepassword.AppendChar(c);
            }

            PSCredential credential = new PSCredential(username, securepassword);

            WSManConnectionInfo connectioninfo = new WSManConnectionInfo(new Uri("https://RemoteServer/OcsPowershell"), "http://schemas.microsoft.com/powershell/Microsoft.PowerShell", credential);

            connectioninfo.AuthenticationMechanism = AuthenticationMechanism.Default;
            connectioninfo.SkipCACheck = true;
            connectioninfo.SkipCNCheck = true;
            //connectioninfo.AuthenticationMechanism = AuthenticationMechanism.Basic;

            connectioninfo.MaximumConnectionRedirectionCount = 2;
            //connectioninfo.MaximumConnectionRedirectionCount = 2;

            using (Runspace runspace = RunspaceFactory.CreateRunspace(connectioninfo))
            {

                runspace.Open();


                using (PowerShell powershell = PowerShell.Create())
                {

                    powershell.Runspace = runspace;
                    //Create the command and add a parameter
                    powershell.AddCommand("Get-CsUser");

                    Collection<PSObject> results = powershell.Invoke();


                    foreach (PSObject result in results)
                    {


                        Console.WriteLine(result.Properties["SamaccountName"].Value.ToString());
                        Console.ReadLine();



                    }

                }

            }
        }
    }
}
