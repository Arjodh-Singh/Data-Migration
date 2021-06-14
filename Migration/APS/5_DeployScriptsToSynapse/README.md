
# **6_DeployScripts (PowerShell):** Deploy Generated T-SQL Scripts for Exporting APS Data and Importing Data into Azure SQLDW 

## Change Log**

| Change Date  | Description                                                  |
| ------------ | ------------------------------------------------------------ |
| Oct 30, 2018 | Changed the variable column to allow multiple values so that its use would be more flexible.  Variables can separated by ";".  Changed the separator for the variable Name and the Value form '=' to  '\|' |
|              |                                                              |
|              |                                                              |

## How to Run the Program** ##

The program processing logic and information flow is illustrated in the diagram below: 

![Step 6: Deploy Scripts](/APS%20to%20SQL%20DW%20Migration%20-%20Schema%20and%20Data%20Migration%20with%20PolyBase/Images/6-DeployScripts.jpg)


The Deployment script is designed to run any .sql file.  For the purpose of the migration, it can be used to deploy objects to APS or Azure SQLDW.  This tool can drop an existing object before running the .sql file.


Below are the steps to run the PowerShell Program(s): 


**Step 1:** Copy the Scripts from Source Repository and Place them on in a local directory.

* Any directory structure will work.  As a suggestion this path can be used: C:\APS2SQLDW\6_DeployScriptsToSqldw.
* Place the two PowerShell scripts in the above directory (RunDSQLScriptDriver.ps1 and RunSQLScriptFile.ps1)
* You can choose to put all your CSV configuration files under the above directory, or in a separate directory under it, such as: C:\APS2SQLDW\6_DeployScriptsToSqldw\Config_Files


**Step 2:** Select one of the sample configuration files for the purpose of your deployment. All the three sample configuration files use the same format. Sample configuration files provided:

* Export APS Data to Azure Blob Storage: ApsCreateExtTablesAndExportData.csv
* Create Tables/Views/SPs in Azure SQLDW:  SqldwCreateTablesViewsAndSPs.csv
* Import APS Data to Azure Blob Storage: SqldwImportData.csv 


**Step 3:** Edit the one of the sample config files to fit the purpose of your deployment. Refer the "Preparation Task: Configuration Driver CSV File Setup" after the steps for more details.  


**Step 4:** Run the PowerShell script(RunDSQLScriptsDriver.ps1).  This script will prompt for the following information

* “Enter the name of the Script Config csv File.” – This will be the location\name of your configuration file.
	* C:\APS2SQLDW\6_DeployScriptsToSqldw\Config_Files: SqldwCreateTablesViewsAndSPs.csv or ApsCreateExtTablesAndExportData.csv or SqldwImportData.csv 
* “How do you want to connect to SQL(ADPass, ADInt, WinInt, SQLAuth)?”
	* ADPass – This should be used for SQL Authentication with Password (Azure)
	* ADINT – Azure AD Authentication
	* SQLAUTH – SQL Server Authentication with username and password.
	* “Blank” – AD integrated Authentication
* “Enter the User Name to Connect to the SQL Server.” – User name with permission to create objects
* “Enter the Password for the User” – Enter the Password for the user – reads password as a secure string
* “Enter the name of the Output File Directory.” – Enter the location where the output log will be written
* “Enter the name of the status file.” – Enter the name of the Status File



**Step 5:** Review the Status log for Success Failures. Review the status log file. The file name and location are the prompted values of the PowerShell program in step 3). The default location is the location of the PowerShell scripts with the file name status.csv. 

* Should a failure occur, the Status log will set the Active flag to 0 for all successful objects created  The Failures will remain Active = 1.  This will allow the status log to be used as the Script Config file and only the failed objects will be run


**Preparation Task: Configuration Driver CSV Files Setup**

Create the Configuration Driver CSV File based on the definition below. Sample CSV configuration file is provided to aid this preparation task. 

There is also a Job-Aid PowerShell program called "**Generate_Step6_ConfigFiles.ps1**" which can help you to generate an initial configuration file for this step. This Generate_Step5_ConfigFiles.ps1 uses a driver configuration SCV file named "ConfigFileDriver.csv" which has instructions inside for each parameter to be set. 



| Parameter    | Purpose                                                                                                                                                                                                                                                                                                                                                                                                                                       | Value (Sample)                                                                                              |
|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Active       | 1 – Run line, 0 – Skip line                                                                                                                                                                                                                                                                                                                                                                                                                   | 0 or 1                                                                                                      |
| ServerName   | Name of the SQL   Server/SQLDW/APS(PDW)                                                                                                                                                                                                                                                                                                                                                                                                       | Sqldwdb.database.windows.net                                                                                |
| DatabaseName | Name of the DB to connect to                                                                                                                                                                                                                                                                                                                                                                                                                  | DBName                                                                                                      |
| FilePath     | Path to the Script that needs to   be run.  Do not put a ‘\’ on the end.                                                                                                                                                                                                                                                                                                                                                                      | C:\APSScripts\TableScripts                                                                                  |
| CreateSchema | 1 – Create Schema, 0 – Don’t   create Schema                                                                                                                                                                                                                                                                                                                                                                                                  | 0 or 1                                                                                                      |
| SchemaAuth   | Should  a Schema Authorization be needed when   creating the schema, enter the name of the Authorization to use.  If left empty, no authorization is created.                                                                                                                                                                                                                                                                                 | Login to Create Schema                                                                                      |
| SchemaName   | Schema Name for the object to be   created. When a schema is created, the .sqp file is used to create the   schema.  This is used if the   Table/View/SP needs to be dropped.    This is the schema name to be used when the script creates the drop   statement.                                                                                                                                                                             | Schema_Name                                                                                                 |
| ObjectType   | Type of object to Create.  Used to create the drop statement.  Valid Values: “”, TABLE, VIEW, SP, EXT, (SCHEMA,  STAT, IDXS – Not implemented yet)                                                                                                                                                                                                                                                                                         | TABLE, VIEW, SP, SCHEMA, EXT. If   left blank, not drop statement is created and the .SQL file is just run. |
| ObjectName   | Name of the object that is being   created.  Used in creating the drop   statement and logging.                                                                                                                                                                                                                                                                                                                                               | Name of the object                                                                                          |
| DropTruncateIfExists | DROP – Drop if exist, TRUNCATE - Truncate Table if exists.     Create a Drop/Truncate statement if the object exists.  This could be placed in the .sql file but   having it in the config file gives the process more control.  Example:    Data has been imported into the tables, if the drop was in the .sql,   we would need to edit the file to not drop the table.  This allows the process to control it with   our having to edit the original .sql file. | DROP, TRUNCATE                                                                              |
| Variables    | Supports a Multiple variables.  This is used to replace a variable in the   .sql file.  Example use is for External Tables and setting Location, Data_Source,  File_Format and Reject_Location to different values based on the Environment being deployed.                                                                     | @Location\|TestLoc {Location}\|TestLoc @Var1\|TestLoc;@Var2\|Datasource                                                                       |

## **Job Aid** - Programmatically Generate Config Files

There is a job-aid PowerShell script named "Generate_Step6_ConfigFiles.ps1" to help you to produce configuration file(s) programmatically. It uses output produced by previous steps (for example: T-SQL script files from step 3, schema mapping file from step 3, Export & Import T-SQL scripts generated from Step 4, and T-SQL files for creating external tables generated in step 5). 

It uses parameters set inside the file named "ConfigFileDriver_Step6.csv". The CSV file contains fields as value-named pairs with instructions for each field. You can set the value for each named field based on your own setup and output files. 

After running the "Generate_Step6_ConfigFiles.ps1", you can then review and edit the programmatically generated configuration files based on your own needs and environment. The generated config file(s) can then be used as input to the step 6 main program (PowerShell: RunDSQLScriptsDriver.ps1).

## **What the Program(s) Does** ##

This PowerShell program connects to a specified MPP system (APS or Azure SQLDW), runs the T-SQL Scripts specified in the configuration driver CSV file(s). The T-SQL Scripts are in the following three categories:

1. Export APS Data into Azure Blob Storage by using T-SQL CTAS statements that create external tables reside in Azure SQLDW and insert data into the external tables from APS tables. 
2. Create Table, View, Stored Procedures, and External Tables in Azure SQLDW.
3. Import Data into Azure SQLDW from Azure Blob Storage 





​    
