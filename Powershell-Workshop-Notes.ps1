<#
POWERSHELL NOTES FOR BEGINNERS
Helpful with workshops and self study. Fast track to fluency
#>



<#
These are notes for basics of Powershell Usage.
It should cover basics of PS workflow, commands, flow control, functions and logic.
In coments you will find basic explanation of How to use and what subject it covers exactly in particular section.
As always for further explanations and more info go to: 
- michrosoft documentation.
- Stack Overflow
- https://ss64.com/ps/

This is not a proffessional full blown instruction on how to be a programer
Just set of notes to get you started fast
#>


<#
===== PART 0 =====
Which version of PS am I running?
#>

$Host.Version #Determine Engine Version
$PSVersionTable.PSVersion #Determine Host Version

Get-Host
$PSVersionTable
#https://docs.microsoft.com/en-us/powershell/scripting/learn/ps101/02-help-system?view=powershell-7.1
#https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about?view=powershell-7.1





<#
===== PART 1 =====
Get Help.... like seriously....

Powershell has extended build in help functionality
Similar to what can be found in other scripting language like python or bash.
#>


get-help

Get-help get #shows comandlets starting with get. Command also accepts a wildcard '*'

Get-Help Get-Help -ShowWindow # will dislay help info in GUI form

<#
===== PART 2 =====
Variables. 
How to declare a Variable, Datatype.
Variables <=> Buckets for your data
#>

#PS assignes datat ypes dynamically (sometimes not correctly)
# do declare a variable:
$Variable1 = 1
#To get value in Variable:
$Variable1
#To check Datatype of that wariable:
$Variable1.GetType()

#To read input from user (Always in String format):
Read-Host #it can be assigned to a Variable.
$Text = Read-Host

#declaring specific datatype for variable:
[int]$number = 43
[string]$string = "20"

#Powershell is stupid. Datatype of first object in operation determines datatype for entire operation:
"7" + 2 #72 - String
2 + "7" #9 - Int

#True for any operation:
$number + $string
$string + $number
#($string + $number).GetType()


#Convert Datatype like string to an INT:
$number2 = [convert]::ToInt32($string, 10)
$number2.GetType()
$string.GetType()
#You can also PUSH string into an INT Variable
#There are more than one way to skin a cat... not all ways are equal.
[Int]$number2 = "22"
$number2.GetType() #INT

<#The most common DataTypes (type accelerators) used in PowerShell are listed below.

 [string]    Fixed-length string of Unicode characters
 [char]      A Unicode 16-bit character
 [byte]      An 8-bit unsigned character

 [int]       32-bit signed integer
 [long]      64-bit signed integer
 [bool]      Boolean True/False value

 [decimal]   A 128-bit decimal value
 [single]    Single-precision 32-bit floating point number
 [double]    Double-precision 64-bit floating point number
 [DateTime]  Date and Time

 [xml]       Xml object
 [array]     An array of values
 [hashtable] Hashtable object

#>







<#
===== PART 3 =====
Arrays. 
How to declare an Array.
"Tables"
#>

#Types of Arrays:
<#  in 90% of cases you will be using one of the built-in solutions
Built-in
 -Array
 -Hashtable a.k.a Associative Array, Dictionary
 -OrderedDictionary [ordered]

.NET - Just FYI they also can be used
 -Collections.Generic.List[T]
 -Collections.Generic.LinkedList[T]
 -LinkedListNode
 -SortedList
 -SortedSet
 -Dictionary 
 -SortedDictionary
 -Queue
 -Stack
#>

#Arrays can hold data of various types
$myArray1 = 1, "Hello", 3.5, "Word"
#You can call on specific index in table. Remember that indexing starts with 0!
$myArray1[0]
$myArray1[1]
$myArray1[2]
$myArray1[0].GetType()
$myArray1[1].GetType()

#Anothr ay to crate an Array:
$myArray = @(1, "Hello", 3.5, "World")
$myArray
#empty array:
$myArray = @()

#Array of numbers from 1-54
$myArray = (1..54)
$myArray

#two Dimentional array of numbers:
$myArray = ((1..12), (15..25))
$myArray

#Indexing in 2D:
#               [0]     [1]
$myArray = @((1..11), (22..32))
$myArray

$myArray[0][0]
$myArray[0][1]
$myArray[1][0]

#Iterating through two dimentional Array. More on FOR loop in SECTION 6!!!
for ($n=0; $n -lt 2; $n++) 
            {
                for ($i=0; $i -lt 10; $i++) 
                    {
                         $myArray[$n][$i] + 5
                    }
            }


#


<#
===== PART 4 =====
FLOW CONTROL 
Conditions and conditional statements. 
Condition in an expression that returns Boolean value equivlent of being true or false
It is used to determine conditional actions:
Execute something if condition is TRUE. 
Example:

if (Light is RED) {Stop the car}
if (Light is Yellow) {Slow Down to halt}
In any other case {Keep Driving}
#>

#Condition
$num1 = 1
$num2 = 2

<#
The following operators are all Case-Insensitive by default:

 -eq             Equal
 -ne             Not equal
 -ge             Greater than or equal
 -gt             Greater than
 -lt             Less than
 -le             Less than or equal
 -like           Wildcard comparison
 -notlike        Wildcard comparison
 -match          Regular expression comparison
 -notmatch       Regular expression comparison
 -replace        Replace operator
 -contains       Containment operator
 -notcontains    Containment operator
 -in             Like –contains, but with the operands reversed.(PowerShell 3.0)
 -notin          Like –notcontains, but with the operands reversed.(PowerShell 3.0)
To perform a Case-Sensitive comparison just prefix any of the above with "c"
for example -ceq for case-sensitive Equals or -creplace for case-sensitive replace.
#>

#first if statement determines weather first condition is true if so expression in {} will be executed
if ($num1 -gt $num2) {Write-Host "First number $num1 is grater than second one $num2"}
#every contidion after that is and ELSEIF statement and determines weather another condition is true if so expression in {} will be executed for that ELSEIF
elseif (($num1 -lt $num2)) { { Write-Host "First number $num1 is lower than second one $num2"}}
#In case none condition was true ELSE will be executed. No contions ther. It will be executed only if none above was true
else {Write-Host "Well in that case it must be equal!"}

#Simplified Template:
<#
if ($true) { <....KOD....>}
 elseif ($true) {<....KOD....>}
 elseif ($true) {<....KOD....>}
 elseif ($true) {<....KOD....>}
 elseif ($true) {<....KOD....>}
 elseif ($true) {<....KOD....>}
  else {<....>}
#>

<#
===== PART 5 =====
FLOW CONTROL 
!!! SWITCH !!! An If for Pros!

Switch statement works like a ready to go solution for multiple IF statements.
Example of implementation:
-> Menu in a program
-> Multiple conditions checker
#>

Write-Host What is your Favourite Color?
$test = Read-Host "Write color"

#it starts with a variable that will be compared to values
switch ($test) {
    #VALUE {CODE TO EXECUTE IF Value is equal to Variable; BREAK - Breaks the loop}
    "Red" { "Fire"; break; }
    "blue" { "Sky"; break; }
    "Green" { "Grass"; break }
    Default { "I'm a GUY I know only RGB and Black!"; break; } 
    #DEFAULT will be executed if none of the  VALUES was equall to Variable
}

#Switch with conditions and assigned to a Variable:
$test = 12

$Result = Switch ($test) {
    {$test -lt 10}{"Less than 10";break}
    { $test -gt 10 } { "more than 10";break }
    default {"Must be Eqal";break}
}
$Result #will hold "More than 10"

#More on switch: 
#https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-switch?view=powershell-7.1


<#
===== PART 6 =====
LOOPS 

Loop is an expression that executes a part of code multiple times until some contition is met (Found to be Boolean TRUE)
#>


#WHILE
$i = 1 #IF i >=10 loop will never be executed
while ($i -le 10) {
    Write-Host Write i: $i
    $i++ #add 1 to $I
}
#IF CONDITION IS NOT MET WHILE WILL NEVER BE EXECUTED! To test change top 11

#DO Ensures that loop will be executed AT LEAST ONCE
#DO WHILE

$i = 11
do {
    Write-Host Write i: $i
    $i++

} while ($i -lt 10)  #Logical Reverse of Do Until But Will be executed at least once!



#DO UNTIL

$i = 12
do {
    Write-Host Write i: $i
    $i++
} 
Until ($i -gt 10) #Logical Reverse of Do While But Will be executed at least once!


# FOR

#Easy FOR = FOR EACH:
$tab = "Lodz", "Warszawa", "Krakow", "Zgierzyniec"
foreach ($city in $tab) {
    Write-Host "Bardzo Lubie gdy jestem przejazdem w $city" #| Out-String    
} 
     
    
#LESS EASY FOR
<#
You declare a Variable and what is it's starting value: 0
You declare condition at which Loop ends: $i is less or equall 10
You declare code that will be repeated: We incline number by one $i++
#>       
for ($i = 0; $i -le 10; $i++) { Write-Host $i }

#Another Example: Progress
for ($counter = 1; $counter -le 100; $counter++ ) {
    # ADD YOUR CODE HERE
    Write-Progress -Activity "Update Progress" -Status "$counter% Complete:" -PercentComplete $counter;
    sleep -Milliseconds 20
}

#Another interesting Example:
for ($x = '' ; $x.length -le 30; $x = $x + 'x') {
    Write-Host $x
    Start-Sleep -Milliseconds 20
}   


cls # CLEAR SCREEN
Write-Host "
      ,(())),
      ((^^^))
      (|*_*|)
       : = :       Clean Me Up Oppa!
       _) (_
     /`_ , _`\
    / (_>*<_) \
   / / )   ( \ \
   \ \/  .  \/ /
    \_)\___/(_/
     |  \_/  )
      \  /  /
       \/  /
       (__\
    ^   \..\
         \..\
         ))..)-)
        ((__/| *

" 
# Whipe out chick on screen. Don't let your colleagues see it! SOOO NSFW!!!


<#
===== PART 7 =====
Get info on a Computer 

GET-WMI / gwmi
#>

#Get

#Get-Wmi is a commandlet to gather details from Windows Management Instrumentation 
#You need to provide WMI Class specific to details you want to get
Get-WmiObject -class win32_NetworkAdapter -Computername TESTHOSTNAME | Out-GridView
Get-WmiObject -class win32_NetworkAdapterConfiguration -Computername TESTHOSTNAME | Out-GridView
gwmi -class win32_Bios -Computername TESTHOSTNAME
gwmi -class win32_BootConfiguration -Computername TESTHOSTNAME
gwmi -class win32_PrinterDriver -Computername TESTHOSTNAME

<#
===== PART 8 =====
POWERSHELL ON REMOTE COMPUTER 

Powershell Remoting
REQUIREMENT: WinRM
REQUIREMENT: Account with admin access
#>

Enable-PSRemoting -Force #Enables Remote staring WinRM and anabling Firewall Rule to allow connections


#On both computers, configure the TrustedHosts setting so they know each other. Execute the following command on both computers to do so:
winrm set winrm/config/client  '@{TrustedHosts=""}'

#restart WinRM service
Restart-Service WinRM

#Test connection:
Test-WSMan -Computername TESTHOSTNAME

#Creating PS Sessions:

$cred = Get-Credential #To provide proper credentials format (object)
$sess = New-PSSession -Credential $cred -ComputerName TESTHOSTNAME #To estabilish a session
Enter-PSSession $sess #To connnect to estabilished session
#From This mOment you are in session on remote host
Exit-PSSession #To exit session
Remove-PSSession $sess #To close session




<#
===== PART 9 =====
FUNCTIONS

Function or subroutine is a part of code that can be invoked by name. 
That part of code will be executed each time you CALL on it and it may accept input in form of varible or data.
Functions can call on other functions that were previously declared. 
Nested fucntion is a function that is declared within another function. It exists locally only within that function
#>

#Function that accepts a variable and displays it on screen in yellow font
function DisplayText ($TXT) {Write-Host $TXT -ForegroundColor DarkYellow} 


#Function PrintF
Function PrintF($DifferentText) {
    #Calling another global function DisplayText
    DisplayText "This part is executed by calling previous function"
    
    #NestedFunction DISP
function disp ($L) {DisplayText "LOCAL FUNCTION DISP: $L Calling another function from within PrintF"}
disp $DifferentText
}

DisplayText "First Global Function"

PrintF "First Function calling on Global and Nested Functions"


#A Simple Function can accept argumants from argument table $args

function AddingUp { #function adds to numbers and returns value
    $args[0] + $args[1]
}

AddingUp 2 3

#Function with named parameters and specified datatypes:
function Output-SalesTax {
    param( [int]$Price, [int]$Tax )
    $Price + $Tax
}

Output-SalesTax -price 1000 -tax 38

#you can print function definition to see what it contains
cat function:Output-SalesTax

#OrLike this:
(get-command AddingUp).definition  

#VARIABLE SCOPE
<#
By Default all variables declared in or for functions are local.
They exist only within that funcion. Function can return them but you can't expect to call on that variable after function is executed

You can Change that to ensure peristance for variable by adding prfix $script: to thevasriable or $global: if scope is supposed to be global
e.g: $global:myVariable
#>

Function TestScope ($t) {
    $global:R = $t + $(Get-Random(3,8))
    #Value is nor returnd. Function does not display anything
    $D = $t + $(Get-Random(3, 8))
}

TestScope 7
$R #Returns Value evan though we have never declared it
$D #as Contrast $D do not exist outside the function. It has ono value


<#
On Advanced function that will behave like CmdLets (Help System, Prameters, Attributes, Validation, Function blocks) see example:
https://ss64.com/ps/syntax-function-advanced.html
#>

#WHEN TO USE FUNCTIONS?

#When you create a task that is repetative and will be used multiple time in the code e.g.:
#You will be converting date from string multiple times for reproting purposes and we do not want to each time write code for each value

$dateFromReport = '1984/12/11'
Function ParseDate ($dateString) 
{
    [datetime]::ParseExact($dateString, 'yyyy/dd/MM', $null)
}

$date = ParseDate $dateFromReport
$date
#Output: 12 November 1984 00:00:00




<#
===== PART 10 =====
Objects

Powershell is an Object Oriented Scripting Language...
EVERYTHING IS AN OBJECT!!!!
Objects have Properties and Methods
Properties - an inheritent specific for an object attribute like login name, email address  or password for a user.
Method     - It is a function that can be used on object that is custom tailored to provide expected result each time it is used.
#>

#example of an object (Everything is an object): a string
"This is a String" #it is an object
"This is a String" | Get-Member #it has properties and Methods

<#OUTPUT:
   TypeName: System.String

Name                 MemberType            Definition
----                 ----------            ----------
Clone                Method                System.Object Clone(), System.Object ICloneable.Clone()
CompareTo            Method                int CompareTo(System.Object value), int CompareTo(string strB), int IComparable.CompareTo(System.Object obj), int IComparable[string].CompareTo(string other)
Contains             Method                bool Contains(string value), bool Contains(string value, System.StringComparison comparisonType), bool Contains(char value), bool Contains(char value, System.StringComparison comparisonType)      
CopyTo               Method                void CopyTo(int sourceIndex, char[] destination, int destinationIndex, int count)
EndsWith             Method                bool EndsWith(string value), bool EndsWith(string value, System.StringComparison comparisonType), bool EndsWith(string value, bool ignoreCase, cultureinfo culture), bool EndsWith(char value)      
EnumerateRunes       Method                System.Text.StringRuneEnumerator EnumerateRunes()
Equals               Method                bool Equals(System.Object obj), bool Equals(string value), bool Equals(string value, System.StringComparison comparisonType), bool IEquatable[string].Equals(string other)
GetEnumerator        Method                System.CharEnumerator GetEnumerator(), System.Collections.IEnumerator IEnumerable.GetEnumerator(), System.Collections.Generic.IEnumerator[char] IEnumerable[char].GetEnumerator()
GetHashCode          Method                int GetHashCode(), int GetHashCode(System.StringComparison comparisonType)
GetPinnableReference Method                System.Char&, System.Private.CoreLib, Version=5.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e GetPinnableReference()
GetType              Method                type GetType()
GetTypeCode          Method                System.TypeCode GetTypeCode(), System.TypeCode IConvertible.GetTypeCode()
IndexOf              Method                int IndexOf(char value), int IndexOf(char value, int startIndex), int IndexOf(char value, System.StringComparison comparisonType), int IndexOf(char value, int startIndex, int count), int IndexOf… 
IndexOfAny           Method                int IndexOfAny(char[] anyOf), int IndexOfAny(char[] anyOf, int startIndex), int IndexOfAny(char[] anyOf, int startIndex, int count)
Insert               Method                string Insert(int startIndex, string value)
IsNormalized         Method                bool IsNormalized(), bool IsNormalized(System.Text.NormalizationForm normalizationForm)
LastIndexOf          Method                int LastIndexOf(char value), int LastIndexOf(char value, int startIndex), int LastIndexOf(char value, int startIndex, int count), int LastIndexOf(string value), int LastIndexOf(string value, int… 
LastIndexOfAny       Method                int LastIndexOfAny(char[] anyOf), int LastIndexOfAny(char[] anyOf, int startIndex), int LastIndexOfAny(char[] anyOf, int startIndex, int count)
Normalize            Method                string Normalize(), string Normalize(System.Text.NormalizationForm normalizationForm)
PadLeft              Method                string PadLeft(int totalWidth), string PadLeft(int totalWidth, char paddingChar)
PadRight             Method                string PadRight(int totalWidth), string PadRight(int totalWidth, char paddingChar)
Remove               Method                string Remove(int startIndex, int count), string Remove(int startIndex)
Replace              Method                string Replace(string oldValue, string newValue, bool ignoreCase, cultureinfo culture), string Replace(string oldValue, string newValue, System.StringComparison comparisonType), string Replace(c… 
Split                Method                string[] Split(char separator, System.StringSplitOptions options), string[] Split(char separator, int count, System.StringSplitOptions options), string[] Split(Params char[] separator), string[]… 
StartsWith           Method                bool StartsWith(string value), bool StartsWith(string value, System.StringComparison comparisonType), bool StartsWith(string value, bool ignoreCase, cultureinfo culture), bool StartsWith(char va… 
Substring            Method                string Substring(int startIndex), string Substring(int startIndex, int length)
ToBoolean            Method                bool IConvertible.ToBoolean(System.IFormatProvider provider)
ToByte               Method                byte IConvertible.ToByte(System.IFormatProvider provider)
ToChar               Method                char IConvertible.ToChar(System.IFormatProvider provider)
ToCharArray          Method                char[] ToCharArray(), char[] ToCharArray(int startIndex, int length)
ToDateTime           Method                datetime IConvertible.ToDateTime(System.IFormatProvider provider)
ToDecimal            Method                decimal IConvertible.ToDecimal(System.IFormatProvider provider)
ToDouble             Method                double IConvertible.ToDouble(System.IFormatProvider provider)
ToInt16              Method                short IConvertible.ToInt16(System.IFormatProvider provider)
ToInt32              Method                int IConvertible.ToInt32(System.IFormatProvider provider)
ToInt64              Method                long IConvertible.ToInt64(System.IFormatProvider provider)
ToLower              Method                string ToLower(), string ToLower(cultureinfo culture)
ToLowerInvariant     Method                string ToLowerInvariant()
ToSByte              Method                sbyte IConvertible.ToSByte(System.IFormatProvider provider)
ToSingle             Method                float IConvertible.ToSingle(System.IFormatProvider provider)
ToString             Method                string ToString(), string ToString(System.IFormatProvider provider), string IConvertible.ToString(System.IFormatProvider provider)
ToType               Method                System.Object IConvertible.ToType(type conversionType, System.IFormatProvider provider)
ToUInt16             Method                ushort IConvertible.ToUInt16(System.IFormatProvider provider)
ToUInt32             Method                uint IConvertible.ToUInt32(System.IFormatProvider provider)
ToUInt64             Method                ulong IConvertible.ToUInt64(System.IFormatProvider provider)
ToUpper              Method                string ToUpper(), string ToUpper(cultureinfo culture)
ToUpperInvariant     Method                string ToUpperInvariant()
Trim                 Method                string Trim(), string Trim(char trimChar), string Trim(Params char[] trimChars)
TrimEnd              Method                string TrimEnd(), string TrimEnd(char trimChar), string TrimEnd(Params char[] trimChars)
TrimStart            Method                string TrimStart(), string TrimStart(char trimChar), string TrimStart(Params char[] trimChars)
Chars                ParameterizedProperty char Chars(int index) {get;}
Length               Property              int Length {get;}
#>

#We can check it's length:
("This is a String").Length

#We can call a method to check it's type
("This is a String").GetType() #Methods usually have () after their name

#Another Example:
$Processes = ps
$Processes.ProcessName #Property
Notepad.exe #StartingNotepad
#Get Process anmed Notepad
$Processes | Where {$_.ProcessName -Like "notepad"}
#Method Kill Process
($Processes | Where { $_.ProcessName -Like "notepad" }).Kill()

#Can we create an object?
#Yes We can!!!
#E.G.:


$properties = @{
Name = 'John'
Surname = 'Snow'
Age = 38
Address = "Cold North st. 38 app 22"
Email = "J.Snow@westeros.org"
Description = "Proffesional buttfreezer and Queen killer"
}

$User = New-Object -TypeName psobject -Property $properties

$user #outputs user created

#Can we add a method?
$user | Add-Member -Name "WhoAmI" -MemberType ScriptMethod -Value {Write-Host "Hi I'm $($this.Name). I'm a Queen Killer and But freezer. Often hunting dragons in my spare time. 3 crowns per a day plus tax. Food not included"}
#Note that $this. is a self referance to object property we are adding method to. So we can referance value that is already set for an object.

$User.WhoAmI()

#More on object :  
#https://ss64.com/ps/syntax-objects.html
#https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/new-object?view=powershell-7.1


<#

===== PART 11 =====
Class... Can we? Really?

In object-oriented programming, a class is an extensible program-code-template for creating objects, providing initial values for state (member variables) and implementations of behavior (member functions or methods). In many languages, the class name is used as the name for the class (the template itself), the name for the default constructor of the class (a subroutine that creates objects), and as the type of objects generated by instantiating the class; these distinct concepts are easily conflated.
#>


#Why to create a class? Let's say we wan't to create a system allowing HR department ot create entries for new Employees?
# Function + Object creation = a Class :)

function CreateUser ($name,$Surname,$age,$address,$Email,$Description,$METHODSCRIPT) 
{
    $properties = @{
        Name        = $name
        Surname     = $Surname
        Age         = $age
        Address     = $address
        Email       = $Email
        Description = $Description
    }

    $obj = New-Object -TypeName psobject -Property $properties
    $obj | Add-Member -Name "WhoAmI" -MemberType ScriptMethod -Value $METHODSCRIPT
    return $obj
}


$myBrandNewUser = CreateUser "John" "Snow" 38 "Cold North st. 38 app 22" "J.Snow@westeros.org" "Proffesional buttfreezer and Queen killer" {Write-Host "Hi I'm $($this.Name). I'm a Queen Killer and But freezer. Often hunting dragons in my spare time. 3 crowns per a day plus tax. Food not included"}

#User in Variable
$myBrandNewUser
#Calling Method
$myBrandNewUser.WhoAmI()

