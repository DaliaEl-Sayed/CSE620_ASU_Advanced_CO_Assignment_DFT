Write-Output "Removing Old Output File"
Remove-Item .\\output.out
Write-Output "Removing Old Output Wave File"
Remove-Item .\\The_output.vcd
Write-Output "Compiling to the New File"
iverilog -o  output.out .\\half_adder.v .\\half_adder_tb.v
Write-Output "Compiling to the New File"
vvp .\\output.out
