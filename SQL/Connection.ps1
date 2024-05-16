Import-Module "C:\Users\G\OneDrive\Software-Engineering\py\PowerBi Project\SQL\SQLModule.psm1"

$Connection=connect-SQLServer -InstanceName "localhost\sqlexpress" -DatabaseName "SecurityPosture" -IntergratedSecurity $true