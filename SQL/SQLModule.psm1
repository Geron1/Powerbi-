function Connect-SQLServer {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [string]$InstanceName,
        [Parameter(Mandatory)]
        [string]$DatabaseName,
        [Parameter(Mandatory)]
        [bool]$IntergratedSecurity,
        [Parameter()]
        [String]$Username,
        [Parameter()]
        [String]$Password
    )
    try{
        $SQLConnection = New-Object System.Data.SqlClient.SqlConnection
        if($IntegratedSecurity){
            $SQLConnection.ConnectionString="Server=$InstanceName;Database=$DatabaseName;Intergraded Security=True"
        }else{
            $SQLConnection.ConnectionString="Server=$InstanceName;Database=$DatabaseName;User=$Username;Password=$Password"
        }

        #$SQLConnection.Open()

        return $SQLConnection
    }catch{
        Write-Error -Message $_
    }

}
