#!/bin/bash

resource_group_name="UnitTemplateDeployments"
resource_group_location="South Central US"
deployment_name="AutomationAccountCreate"
template_file="azuredeploy.json"
parameters_file="azuredeploy.parameters.json"

azure config mode arm
azure group create "${resource_group_name}" --location "${resource_group_location}"

azure group deployment create "${resource_group_name}" \
                              "${deployment_name}" \
                              --template-file "${template_file}" \
                              --parameters-file "${parameters_file}" \
                              --nowait
