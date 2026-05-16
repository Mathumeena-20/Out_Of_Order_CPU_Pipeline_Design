# =====================================================
# Quartus Compilation
# =====================================================

load_package flow

project_open ooo_cpu

execute_flow -compile

puts "Compilation Completed"

project_close