# =====================================================
# Static Timing Analysis
# =====================================================

load_package report

project_open ooo_cpu

execute_module -tool sta

puts "STA Completed"

project_close