# =====================================================
# Power Analysis
# =====================================================

load_package pow

project_open ooo_cpu

execute_module -tool pow

puts "Power Analysis Completed"

project_close