function Get-Pi{
  return [Math]::PI
}

function Get-SquareArea{
param([float]$side)
  return $side*$side
}

function Get-CircleArea{
param([float]$radius)
  return $pi*$radius*$radius
}

$pi=get-Pi