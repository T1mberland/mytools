# Delete shada temp files
function delshada {
  # Define the directory containing the shada temp files dynamically for the current user
  $shada_dir = "$env:USERPROFILE\AppData\Local\nvim-data\shada"

  # Check if the directory exists
  if (-not (Test-Path -Path $shada_dir)) {
      Write-Output "Directory '$shada_dir' does not exist."
      exit
  }

  # Delete all files matching the pattern
  Get-ChildItem -Path "$shada_dir\main.shada.tmp.?" -ErrorAction SilentlyContinue | ForEach-Object {
      Remove-Item -Path $_.FullName -Force
  }

  Write-Output "All shada temp files deleted from '$shada_dir'."
}

function e {
  Start-Process explorer -ArgumentLIst "$PWD"
}

function n {
  nvim @args
}

function v {
  nvim @args
}

function g {
  git @args
}

function up {
  Set-Location ..
}

function grep { Select-String -Path * -Pattern $args }

function ff { param($name) Get-ChildItem -Recurse -Filter "*$name*" }
