<##############################################################################################################
## [Title]: linuxprivchecker.sh -- a Linux Privilege Escalation Check Script
## [Author]:Mike Merrill (linted) -- https://github.com/linted
##
## [Special Thanks]: Mike Czumak (T_v3rn1x). Thanks for the work done on the original linux priv checker
##-------------------------------------------------------------------------------------------------------------
## [Details]:
## This script is intended to be executed locally on a Windows box to enumerate basic system info and
## search for common privilege escalation vectors such as world writable files, misconfigurations, clear-text
## passwords and applicable exploits.
##-------------------------------------------------------------------------------------------------------------
## [Warning]:
## This script comes as-is with no promise of functionality or accuracy.
##-------------------------------------------------------------------------------------------------------------
## [Modification, Distribution, and Attribution]:
## Permission is herby granted, free of charge, to any person obtaining a copy of this software and the
## associated documentation files (the "Software"), to use, copy, modify, merge, publish, distribute, and/or
## sublicense copies of the Software, and to permit persons to whom the Software is furnished to do so, subject
## to the following conditions:
##
## The software must maintain original author attribution and may not be sold
## or incorporated into any commercial offering.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR ## IMPLIED, INCLUDING BUT NOT
## LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
## EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER LIABILITY, WHETHER
## IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
## USE OR OTHER DEALINGS IN THE SOFTWARE.
##############################################################################################################>


$LINE = '*' * 80

function scriptTITLE () {
    echo $LINE
    echo "    LINUX PRIVILEGE ESCALATION CHECKER"
    echo "    https://github.com/linted/linuxprivchecker for more info..."
    echo ${LINE};
    echo
}

function systemAREAtitle (systemAREA) {
    echo $LINE
    echo "    $systemArea"
    echo $LINE
    echo
}

function cmdRESPONSE (systemName, command) {
    $results = Invoke-Expression command
    if ($results -ne $null) {
        #got results
        echo "[+] $systemName"
        echo $results
    } else {
        echo "[-] $systemName"
    }
}

function operatingSYSTEM () {
    systemAREAtitle "OPERATING SYSTEM"

    cmdRESPONSE "Distribution" "(Get-WmiObject -class Win32_OperatingSystem).Caption";

    cmdRESPONSE "Kernel" "[System.Environment]::OSVersion.Version";

    cmdRESPONSE "Hostname" "`$env:computername";
}





