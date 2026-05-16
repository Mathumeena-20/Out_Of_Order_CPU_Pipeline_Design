# =====================================================
# Incremental Compilation
# =====================================================

load_package incremental_compilation

project_open ooo_cpu

set_global_assignment \
-name INCREMENTAL_COMPILATION ON

execute_flow -compile

puts "Incremental Compilation Done"

project_close