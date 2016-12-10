$resourceGroupName = 'UnitTemplateDeploymentsViaAzurePowerShell'
$location = 'South Central US'
New-AzureRmResourceGroup -Name $resourceGroupName -Location $location

### Create Automation Account using a template deployment with template parameters object
#   This is default for this script, as Automation Account names are unique across subscription
#   and other methods (Azure CLI, VisualStudio CI) use template parameter file
# New-AzureRmResourceGroupDeployment -ResourceGroupName <String> -TemplateFile <String> -TemplateParameterObject <Hashtable> [-Force] [-Mode <DeploymentMode> {Incremental | Complete} ] [-Name <String> ] [-StorageAccountName <String> ] [-TemplateVersion <String> ] [ <CommonParameters>]

$deploymentName = 'CreateAutomationAccount'
$templateFile = 'azuredeploy.json'
$templateParameters = @{accountName='MyNewAutomationAccountFromPowerShel';accountLocation='South Central US'}
New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templateFile -TemplateParameterObject $templateParameters

exit

### Create Automation Account using a template deployment with a parameter file
# New-AzureRmResourceGroupDeployment -ResourceGroupName <String> -TemplateFile <String> -TemplateParameterFile <String> [-Force] [-Mode <DeploymentMode> {Incremental | Complete} ] [-Name <String> ] [-StorageAccountName <String> ] [-TemplateVersion <String> ] [ <CommonParameters>]

$deploymentName = 'CreateAutomationAccount'
New-AzureRmResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile azuredeploy.json -TemplateParameterFile azuredeploy.parameters.json

### Create Automation Account with Azure PowerShell

$automationAccountName = 'MyNewAutomationAccount'
New-AzureRmAutomationAccount -ResourceGroupName $resourceGroupName -Location $location -Name $automationAccountName
