# =====================================================
# Quartus Fitter
# =====================================================

load_package flow

project_open ooo_cpu

execute_module -tool fit

puts "Fitting Completed"

project_close