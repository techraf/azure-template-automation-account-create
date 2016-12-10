$resourceGroupName = "UnitTemplateDeployments2"
$location = "South Central US"
New-AzureRmResourceGroup -Name $resourceGroupName -Location $location

### Create Automation Account with Azure PowerShell

$automationAccountName = "DemoAutomationAccount3"
New-AzureRmAutomationAccount -ResourceGroupName $resourceGroupName -Location $location -Name $automationAccountName

### Create Automation Account using a template deployment with a parameter file
# New-AzureRmResourceGroupDeployment -ResourceGroupName <String> -TemplateFile <String> -TemplateParameterFile <String> [-Force] [-Mode <DeploymentMode> {Incremental | Complete} ] [-Name <String> ] [-StorageAccountName <String> ] [-TemplateVersion <String> ] [ <CommonParameters>]

$deploymentName = 'DeployTemplateWithAzurePowerShell'
New-AzureRmResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile azuredeploy.json -TemplateParameterFile azuredeploy.parameters.json

### Create Automation Account using a template deployment with template parameters object
# New-AzureRmResourceGroupDeployment -ResourceGroupName <String> -TemplateFile <String> -TemplateParameterObject <Hashtable> [-Force] [-Mode <DeploymentMode> {Incremental | Complete} ] [-Name <String> ] [-StorageAccountName <String> ] [-TemplateVersion <String> ] [ <CommonParameters>]

$deploymentName = 'DeployTemplateWithAzurePowerShell2'
$templateFile = 'azuredeploy.json'
$templateParameters = @{accountName="MyNewAutomationAccount4";accountLocation="South Central US"}
New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templateFile -TemplateParameterObject $templateParameters
