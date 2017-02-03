using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Management.Automation;
using System.Management.Automation.Host;
using System.Collections.ObjectModel;

namespace CIM_Exercise
{
    class Program
    {
        static void Main(string[] args)
        {
            using (PowerShell PowerShellInstance = PowerShell.Create())
            {
                PowerShellInstance.AddCommand("Get-CimClass");
                Collection<PSObject> result = PowerShellInstance.Invoke();
                foreach (PSObject r in result)
                {
                    Console.WriteLine(r);
                    Console.ReadKey();
                }
            }
        }
    }
}
