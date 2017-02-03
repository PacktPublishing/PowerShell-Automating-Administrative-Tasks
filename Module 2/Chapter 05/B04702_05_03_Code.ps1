$code = @"
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace ClassLibrary2
{
    public class Class1
    {
        public static int sum(int a,int b)
        {
            return a + b;
        }
    }
}
"@
Add-Type -TypeDefinition $code
[ClassLibrary2.Class1]::sum(34,45)
