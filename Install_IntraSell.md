These steps are valid for Windows 64 bit and MS Access 2010 (32 Bit)

Log in as Administrator
Check if Access 2010 (32 Bit) and  MS Word 2010 are already installed.

## Files ##

1. Copy existing IntraSell Installation from you central server.
> For this purpose you can use the command

> `Z:\intrasell4\update_lokal.bat`

Answer with "V"erzeichnis in the command window.
You should get confirmation that the IntraSell.dll was successfully registered.
This cretes folder c:\intrasell4\ and all files are copied there.

## ODBC ##

For steps 2, 3 and 4you can use the batch file:
```
Z:\intrasell4\IntraSell\setup64Bit.bat
```

2. Install the 32 Bit ODBC Driver from MYSQL Downloads:
http://dev.mysql.com/get/Downloads/Connector-ODBC/5.1/mysql-connector-odbc-5.1.13-win32.msi



3. Use the 32 Bit ODBC Manager to register the MySQL Database.
Open command windows and run:
```
c:\windows\SysWOW64\odbcad32.exe
```

Example content of IntraSell\_ODBCRegister\_64bit
```

Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ODBC\ODBC.INI]

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ODBC\ODBC.INI\intrasell_daten_2]
"Driver"="C:\\Program Files (x86)\\MySQL\\Connector ODBC 5.1\\myodbc5.dll"
"SERVER"="arfaian_server2"
"UID"="webshop"
"PWD"="xxx"
"PORT"="3306"
"DATABASE"="intrasell_daten_2"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ODBC\ODBC.INI\ODBC Data Sources]
"intrasell_daten_2"="MySQL ODBC 5.1 Driver"

```

4. Create command Windows as "Administrator" user

4.1. Run "regsvr32 intraSell.dll"

## Run ##

5. Start IntraSell using the Executable file
```
c:\intrasell4\IntraSell\IntraSell4.exe
```
That's it!