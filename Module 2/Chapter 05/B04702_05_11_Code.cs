using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using Microsoft.Lync.Model;
namespace LyncAPIDemo
{
    [Cmdlet(VerbsCommon.Get, "LyncStatus")]
    public class LyncAPIDemo : PSCmdlet
    {
        protected override void ProcessRecord()
        {
            var client = LyncClient.GetClient();
            bool status =
              client.SignInConfiguration.SignedInFromIntranet;
            if (status == true)
            {
                Console.WriteLine("You are signed in!");
            }
            else
            {
                Console.WriteLine("Singed Off!");
            }
        }
    }
}
