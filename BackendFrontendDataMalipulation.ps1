
Function Get-AzPolicyState{
    Param(
        [Parameter(Mandatory)]
        #[ValidateScript({ Test-String -path $_})]
        [String]$PDN
    )
    Get-AzPolicyState -PolicySetDefinitionName $PDN
}

Connect-AzAccount -Tenant "460161f8-39a2-45a2-a21e-05305e5ed615"
Get-AzPolicyStateSummary -SubscriptionId "9e433097-fcac-4ffc-83ea-73c516eb84cc"
Start-AzPolicyComplianceScan -ResourceGroupName "cloud-shell-storage-southcentralus"
Get-AzPolicyState 
Get-AzPolicyState -Top 30 | Export-Csv -Path .\Powerbi.csv
Get-AzPolicyState -Top 10 | Export-Csv -Path .\Powerbi.csv
Get-AzPolicyState -Top 10 | Where-Object { $_.ComplianceState -like 'NonCompliant'} | Export-Csv -Path .\Powerbi.csv
Get-AzPolicyState | Where-Object { $_.ComplianceState -like 'NonCompliant'} #| Export-Csv -Path .\Powerbi-Compliant.csv
Get-AzPolicyState | Where-Object { $_.ComplianceState -like 'Compliant'} | Export-Csv -Path .\Powerbi-NoCompliant.csv 
#check PolicySetDefinitionID againt Name 

Import-Module SqlServer
#Backend SQL 
# Set your connection string to Azure SQL DB.
# If your server is not in Azure, just tweak the 'Data Source' field to point to your server.
# Warning: putting clear text passwords in your scripts is highly discoraged, so instead
# of using "User ID" and "Password" in the connection string, we prompt for the credentials.
$cred = Get-Credential -Message "Enter your SQL Auth credentials"
$cred.Password.MakeReadOnly()

# Get access to the SMO Server object.
$srv = Get-SqlInstance -ServerInstance "postgress" -Credential $cred

# Get access to table 'MyTable1' on database 'MyDB'.
# Note: both objects are assumed to exists already.
$db = $srv.Databases["MyDB"]
$table = $db.Tables["MyTable1"]

# Write the first 4 integers into the table.
# Note: 'MyTable1' has a column 'Col1' of type 'int'
Write-SqlTableData -InputData (1..4) -InputObject $table

# Now, we read the data back to verify all went ok.
Read-SqlTableData -InputObject $table
Import-Module - SqlServer .\.dockerrc

#Force creation of new headers then write csv data
Import-Csv -Path "C:\Users\G\OneDrive\Software-Engineering\py\PowerBi Project\CSV_Outputs\Powerbi.csv" -Header "AdditionalProperties","Timestamp","ResourceId","PolicyAssignmentId","PolicyDefinitionId","EffectiveParameters","IsCompliant","SubscriptionId","ResourceType","ResourceLocation","ResourceGroup","ResourceTags","PolicyAssignmentName","PolicyAssignmentOwner","PolicyAssignmentParameters","PolicyAssignmentScope","PolicyDefinitionName","PolicyDefinitionAction","PolicyDefinitionCategory","PolicySetDefinitionId","PolicySetDefinitionName","PolicySetDefinitionOwner","PolicySetDefinitionCategory","PolicySetDefinitionParameters","ManagementGroupIds","PolicyDefinitionReferenceId","ComplianceState","PolicyEvaluationDetails","PolicyDefinitionGroupNames","PolicyDefinitionVersion","PolicySetDefinitionVersion","PolicyAssignmentVersion" | Write-SqlTableData -ServerInstance "localhost\SQLExpress" -DatabaseName "SecruityPosture" -SchemaName "dbo" -TableName "SecurityPostureView30" -Force

#Wrtie to Exiting table with headers
Import-Csv -Path "C:\Users\G\OneDrive\Software-Engineering\py\PowerBi Project\CSV_Outputs\Powerbi.csv" | Write-SqlTableData -ServerInstance "localhost\SQLExpress" -DatabaseName "SecruityPosture" -SchemaName "dbo" -TableName "Table1" -Force
Read-SqlTableData -ServerInstance "localhost\SQLExpress" -DatabaseName "Table1" -SchemaName "dbo" 

#Storing data a variable to pipe and use
$rowCount = Read-SqlTableData -ServerInstance "localhost\SQLExpress" -DatabaseName "SecruityPosture" -SchemaName "dbo" -TableName "SecurityPostureView"
#Count Rows in Data 
$rowCount | Measure-Object -Line

Get-AzPolicy
$overAllPolicyState = Get-AzPolicyState 
$overAllPolicyState | Measure-Object -Line
$overAllPolicyState | Export-Csv -Path "C:\Users\G\OneDrive\Software-Engineering\py\PowerBi Project\CSV_Outputs\PowerBi.csv"
$overAllPolicystate | Write-SqlTableData -ServerInstance "LocalHost\SQLExpress" -DatabaseName "SecuirtyPosture" -SchemaName "dbo" -TableName "Table1" -Force
Read-SqlTableData -ServerInstance "localhost\SQLExpress" -DatabaseName "SecurityPosture" -TableName "Table1" -SchemaName "dbo" | Measure-Object - Line
#or
Import-Csv -Path "C:\Users\G\OneDrive\Software-Engineering\py\PowerBi Project\CSV_Outputs\Powerbi.csv" | Write-SqlTableData -ServerInstance "LocalHost\SQLExpress" -DatabaseName "SecurityPosture" -SchemaName "dbo" -TableName "Table1" -Force
Read-SqlTableData -ServerInstance "localhost\SQLExpress" -DatabaseName "Table1" -SchemaName "dbo"| Measure-Object - Line
#or

$csvStoragePath = "C:\Users\G\OneDrive\Software-Engineering\py\PowerBi Project\CSV_Outputs\initiativeNistSp800V1780.csv"
$nistSp900
#PolicyName =  NIST SP 800-53 Rev. 4 
$policySetDefinitionId = "/providers/microsoft.authorization/policysetdefinitions/cf25b9c1-bd23-4eb6-bd2c-f4f3ac644a5f"
$initiativeNistSp800V1780 = Get-AzPolicyState | Where-Object { $_PolicySetDefinitionId -like $policySetDefinitionId} #
| Export-Csv -Path .\Powerbi-Compliant.csv-PolicySetDefinitionName 
$initiativeNistSp800V1780 | Measure-Object -Line
$initiativeNistSp800V1780 | Export-Csv -Path $csvStoragePath
$initiativeNistSp800V1780 | Write-SqlTableData -ServerInstance "LocalHost\SQLExpress" -DatabaseName "SecurityPosture" -SchemaName "dbo" -TableName "InitiativeNistSp800V1780" #-Force
Read-SqlTableData -ServerInstance "localhost\SQLExpress" -DatabaseName "Table1" -SchemaName "dbo"| Measure-Object - Line





#NAME = storageaccountsshouldpreventsharedkeyaccess
#PolicyDefinitionId = /providers/microsoft.authorization/policydefinitions/6edd7eda-6dd8-40f7-810d-67160c639cd9

#Remediaition
$policyDefinitionReferenceId = "fa298e57-9444-42ba-bf04-86e8470e32c7"
$name = "Testps1Remdiatiion#1"
$policyAssignmentId = "/subscriptions/9e433097-fcac-4ffc-83ea-73c516eb84cc/providers/microsoft.authorization/policyassignments/8e80ab1009834b55a84887c9"

Start-AzPolicyRemediation -PolicyDefinitionReferenceId $policyDefinitionReferenceId -Name $name -PolicyAssignmentId $policyAssignmentId
Stop-AzPolicyRemediation -PolicyDefinitionReferenceId $policyDefinitionReferenceId -Name $name -PolicyAssignmentId $policyAssignmentId
Remove-AzPolicyRemediation -PolicyDefinitionReferenceId $policyDefinitionReferenceId -Name $name -PolicyAssignmentId $policyAssignmentId

#CheckRemediation 
Get-AzPolicyState | Where-Object { $_.PolicyDefinitionReferenceId -like $policyDefinitionReferenceId} 
Get-AzPolicyState -PolicyDefinitionReferenceId "fa298e57-9444-42ba-bf04-86e8470e32c7"
Get-AzPolicyStateSummary




## Input Variables
$csvPath = "C:\Users\G\OneDrive\Software-Engineering\py\PowerBi Project\CSV_Outputs\Powerbi.csv"
$csvDelimiter = ";"
$serverName = "localhost\SQLExpress"
$databaseName = "SecurityPosture"
$tableSchema = "dbo"
$tableName = "SecurityPostureOverview"

## Truncate Table
Invoke-Sqlcmd -ServerInstance $serverName -Database $databaseName -Query "TRUNCATE TABLE $tableSchema.$tableName"   -TrustServerCertificate 

## Import CSV into SQL
Import-Csv -Path $csvPath -Delimiter $csvDelimiter | Write-SqlTableData -ServerInstance $serverName -DatabaseName $databaseName -SchemaName $tableSchema -TableName $tableName -Force -

#RestApi Policy Scan 
POST https://management.azure.com/subscriptions/1eea9e59-cf87-48e9-bbd0-105671b9e716/providers/Microsoft.PolicyInsights/policyStates/latest/triggerEvaluation?api-version=2019-10-01
Invoke-RestMethod -Uri https://management.azure.com/subscriptions/9e433097-fcac-4ffc-83ea-73c516eb84cc/providers/Microsoft.PolicyInsights/policyStates/latest/triggerEvaluation?api-version=2019-10-0/
    Format-Table -Property Title, pubDate

Invoke-RestMethod -Uri https://blogs.msdn.microsoft.com/powershell/feed/ |
  Format-Table -Property Title, pubDate

  POST https://management.azure.com/subscriptions/1eea9e59-cf87-48e9-bbd0-105671b9e716/resourceGroups/0fa8139c-1ec6-498f-b201-25ea4858b935/providers/Microsoft.PolicyInsights/policyStates/latest/triggerEvaluation?api-version=2019-10-01

  GET https://management.azure.com/subscriptions/ae640e6b-ba3e-4256-9d62-2993eecfa6f2/providers/Microsoft.Authorization/policyAssignments?$filter=atScope()&api-version=2023-04-01  