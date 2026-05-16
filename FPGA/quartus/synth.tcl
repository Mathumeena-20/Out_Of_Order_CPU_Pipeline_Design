# =====================================================
# Quartus Synthesis
# =====================================================

load_package flow

project_open ooo_cpu

execute_module -tool map

puts "Synthesis Finished"

project_close