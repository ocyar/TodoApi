$personalToken = $env:ReadSprintNumberToken
$token = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($personalToken)"))
$header = @{authorization = "Basic $token"}
$url = "https://tecalliance.visualstudio.com/TecOrder/TecConnect%205.0/_apis/work/teamsettings"
$output = Invoke-RestMethod -Uri $url -Method Get -ContentType "application/json" -Headers $header
$defaultIterationName = $output.defaultIteration.name
Write-OutPut "Default Iteration Name: $defaultIterationName"
$sprintNumber = $defaultIterationName.substring(7)
Write-OutPut "Sprint Number: $sprintNumber"
Write-OutPut "BuildVersion before: $env:BuildVersion"
echo '##vso[task.setvariable variable=BuildVersion]$sprintNumber'
Write-OutPut "BuildVersion after: $env:BuildVersion"