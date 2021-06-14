



# Your working directory
$workingPath = 'C:\Users\Aga\Documents\AutomationScripts\SeleniumPS'

# Add the working directory to the environment path.
# This is required for the ChromeDriver to work.
if (($env:Path -split ';') -notcontains $workingPath) {
    $env:Path += ";$workingPath"
}

#Import Selenium to PowerShell using the Add-Type cmdlet.
Add-Type -Path "$($workingPath)\WebDriver.dll"

# Create a new ChromeDriver Object instance.
$ChromeDriver = New-Object OpenQA.Selenium.Chrome.ChromeDriver

# Launch a browser and go to URL
$ChromeDriver.Navigate().GoToURL('https://my.centennialcollege.ca/')

#Username field XPath - //*[@id="username"]
#Password field XPath - //*[@id="password"]
#Login                - //*[@id="mysubmit1"] 

#convert the password
$secureString = "01000000d08c9ddf0115d1118c7a00c04fc297eb010000001588c3f2562927488e59d90578d7abd900000000020000000000106600000001000020000000f84f6ad4e043c5c20208443c17795c5b360993f2cbfd7a62f21b64f0cea5a7c3000000000e8000000002000020000000761ab4223f45151ec43239f71755abef9806c7291b5a94b98a9e8977b8e05a5820000000eae71558fc460d0d922578d83f8057b531cbacaeffe5277f72b587752e13e257400000005c3b8aae698eef778cd2903cf87ec5fc0f50c1a0aa15cd21556ff42d096701bbba30bee256d220db4c5c802b65c4cd3c10dbbdf41d232c5f11865b33856f4876"
$password = ConvertTo-SecureString $secureString
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
$PlainPass = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

# Enter the username in the Username box
$ChromeDriver.FindElementByXPath('//*[@id="username"]').SendKeys('301033578')

# Enter the password in the Password box
$ChromeDriver.FindElementByXPath('//*[@id="password"]').SendKeys($PlainPass)

# Click on the Login button
$ChromeDriver.FindElementByXPath('//*[@id="mysubmit1"]').Click()


