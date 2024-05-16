Install-Module -Name Az.PolicyInsights -RequiredVersion 1.6.0


Update-Module Az.* -WhatIf
Update-Module Az.* 

Connect-AzAccount -Tenant "460161f8-39a2-45a2-a21e-05305e5ed615"


Start-AzPolicyComplianceScan - Re "azureapp-auto-alerts-16a64f-a_gbrown_iamgeron_com"

Update-AzConfig -DisplayBreakingChangeWarning $false

Get-AzPolicyDefinition | Select-Object -Property DisplayName "Email notification to subscription owner for high severity alerts should be enabled"

#Format to List 
Get-AzPolicyDefinition | Select-Object -ExpandProperty properties | Select-Object -Property DisplayName, Description, PolicyType, Metadata | Format-List
Get-AzPolicyState | Select-Object -Property ResourceId,                  
PolicyAssignmentId, PolicyDefinitionId, IsCompliant, SubscriptionId, ResourceType, ResourceTags, PolicyAssignmentName, PolicyAssignmentOwner, PolicyAssignmentScope,      
PolicyDefinitionName, PolicyDefinitionAction, PolicyDefinitionCategory, PolicySetDefinitionId, PolicySetDefinitionName, PolicySetDefinitionCategory, 
ManagementGroupIds, PolicyDefinitionReferenceId, ComplianceState, AdditionalProperties | Format-List

Get-AzPolicyState | Format-List
Get-AzPolicyDefinition -


Get-AzPolicyDefinition - "Email notification to subscription owner for high severity alerts should be enabled"

Get-AzPolicyStateSummary -PolicyDefinitionName "Email notification to subscription owner for high severity alerts should be enabled"

Get-AzPolicyStateSummary -PolicyDefinitionName "Deploy Diagnostic Settings for Network Security Groups"
Get-AzPolicyStateSummary -PolicyDefinitionName "Transparent Data Encryption on SQL databases should be enabled"




Function Get-AzPolicyStateSummary {
    Param(
        [Parameter()]
        $PolicyName
    )
    Get-AzPolicyStateSummary -PolicyDefinitionName $PolicyName
}

Function Get-File{
    Param(
        [Parameter(Mandatory)]
        [ValidateScript({ Test-Path -path $_})]
        [String]$Path
    )
    Get-File -Path $Path
}

Function Get-AzPolicyState{
    Param(
        [Parameter(Mandatory)]
        #[ValidateScript({ Test-String -path $_})]
        [String]$PDN
    )
    Get-AzPolicyState -PolicySetDefinitionName $PDN
}

Get-AzPolicySetDefinition -NameParameterSet "4f4f78b8-e367-4b10-a341-d9a4ad5cf1c7"

Function Get-AzPolicySetDefinition{
    Param(
        [Parameter(Mandatory)]
        [String]$PDN
    )
    Get-AzPolicySetDefinition -NameParmeterSet $PDN
}