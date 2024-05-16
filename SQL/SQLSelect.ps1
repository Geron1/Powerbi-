$sqlConnection=New-Object System.Data.SqlClient.SqlConnection
$sqlConnection.ConnectionString="Server=localhost\postgres;Database=Logging;Intergrated Security=true"
$sqlConnection.Open()

$sqlCommand=$sqlConnection.CreateCommand()

$sqlCommand.CommandText="Select * from Log"

$sqlDataAdapter=New-Object System.Data.SqlClient.SqlDataAdapter $sqlCommand
$dataSet=New-Object System.Data.DataSet

$sqlDataAdapter.fill($dataSet)

$data=$datset.Tables[0]

Write-Output $data

$sqlConnection.Close()