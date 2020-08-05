$personalToken = "mr534djyydr2jdslomypetomuwt3m45edzwie4a6usl6jfxzm3qa"
$token = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($personalToken)"))
$header = @{authorization = "Basic $token"}
$url = "https://tecalliance.visualstudio.com/TecOrder/TecConnect%205.0/_apis/work/teamsettings"
$output = Invoke-RestMethod -Uri $url -Method Get -ContentType "application/json" -Headers $header
Write-OutPut $output
$defaultIterationName = $output.defaultIteration.name
$sprintNumber = $defaultIterationName.substring(7)
Write-OutPut "defaultIterationName: $defaultIterationName"
Write-OutPut "sprintNumber: $sprintNumber"