using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Management;
using System.Management.Automation;
using System.IO;

namespace Windows_Management
{
    [Cmdlet(VerbsCommon.Clear, "TemporaryInternetFiles")]

    public class WindowsManagement : PSCmdlet
    {
        protected override void ProcessRecord()
        {
            //Delete Internet Cache Files and Folders 
            string path = Environment.GetFolderPath(Environment.SpecialFolder.InternetCache);
            Console.ForegroundColor = ConsoleColor.DarkYellow;
            Console.WriteLine("Clearing Temporary Internet Cache Files and Directories....." + path);
            System.IO.DirectoryInfo folder = new DirectoryInfo(path);
            foreach (FileInfo files in folder.GetFiles())
            {
                try
                {
                    files.Delete();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex);
                }

            }
            foreach (DirectoryInfo Directory in folder.GetDirectories())
            {
                try
                {
                    Directory.Delete();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex);
                }

            }
            Console.WriteLine("Done Processing!!!");
            Console.ResetColor();
        }

    }
}

namespace clearInternetexplorerHistory
{
    [Cmdlet(VerbsCommon.Clear, "IEHistory")]
    public class clearInternetexplorerHistory : PSCmdlet
    {
        protected override void ProcessRecord()
        {
            // base.ProcessRecord(); 
            string path = Environment.GetFolderPath(Environment.SpecialFolder.History);
            Console.ForegroundColor = ConsoleColor.DarkYellow;
            Console.WriteLine("Clearing Internet Explorer History....." + path);
            System.IO.DirectoryInfo folder = new DirectoryInfo(path);
            foreach (FileInfo files in folder.GetFiles())
            {
                try
                {
                    files.Delete();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex);
                }

            }
            foreach (DirectoryInfo Directory in folder.GetDirectories())
            {
                try
                {
                    Directory.Delete();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex);
                }

            }
            Console.WriteLine("Done Processing!!!");
            Console.ResetColor();
        }

    }

}



namespace UserTemporaryFiles
{
    [Cmdlet(VerbsCommon.Clear, "UserTemporaryFiles")]
    public class UserTemporaryFiles : PSCmdlet
    {
        protected override void ProcessRecord()
        {
            //base.ProcessRecord(); 

            string temppath = System.IO.Path.GetTempPath();
            System.IO.DirectoryInfo usertemp = new DirectoryInfo(temppath);
            Console.WriteLine("Clearing Your Profile Temporary Files..." + temppath);

            foreach (FileInfo tempfiles in usertemp.GetFiles())
            {
                try
                {
                    tempfiles.Delete();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex);
                }

            }

            Console.WriteLine("Done Processing!!!");
            foreach (DirectoryInfo tempdirectory in usertemp.GetDirectories())
            {
                try
                {
                    tempdirectory.Delete();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex);
                }

            }
        }
    }
}
