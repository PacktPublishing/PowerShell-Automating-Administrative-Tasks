using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Management.Automation;
using Microsoft.Lync.Model;
using System.Collections.ObjectModel;
namespace OfficeServers
{
    [Cmdlet(VerbsCommon.Get,"PhotoStatus")]
    public class PhotoStatus : PSCmdlet
    {
        protected override void ProcessRecord()
        {
            //base.ProcessRecord();
            Console.WriteLine("Lync Group Name Information....");
            var cl = LyncClient.GetClient();
            bool photo = cl.Self.PhotoDisplayed;
            if(photo == true)
            {
                Console.WriteLine("Photo will be visible to 
                  others!");
            }
            else 
            {
                Console.WriteLine("Photo is hidden!");
            }
        }
    }
    [Cmdlet(VerbsCommon.Get,"OSInformation")]
    public class OSInformation : PSCmdlet
    {
        protected override void ProcessRecord()
        {
            //base.ProcessRecord();
            Console.WriteLine("OS Version is {0}", 
              (Environment.OSVersion).ToString());
        }
    }
    [Cmdlet(VerbsCommon.Add, "LyncPersonalNote")]
    public class LyncPersonalNote : PSCmdlet
    {
        [Parameter(Mandatory = true)]
        public string notetext{get;set;}
        protected override void ProcessRecord()
        {
            //base.ProcessRecord();
            var cl = LyncClient.GetClient();
            var self = cl.Self;
            var noteinfo = new System.Collections.Generic.
              Dictionary<Microsoft.Lync.Model.
              PublishableContactInformationType, Object>();
            noteinfo.Add(Microsoft.Lync.Model.
              PublishableContactInformationType.PersonalNote,
              notetext);
            self.BeginPublishContactInformation(noteinfo,null,null);
            //self.EndPublishContactInformation(noteinfo);
        }
    }
}
