project_new ooo_cpu -overwrite

# -------------------------------------------------
# SEARCH PATHS
# -------------------------------------------------

set_global_assignment \
-name SEARCH_PATH ../../rtl/common

set_global_assignment \
-name SEARCH_PATH ../../rtl/interfaces

# -------------------------------------------------
# TOP MODULE
# -------------------------------------------------

set_global_assignment \
-name TOP_LEVEL_ENTITY top_wrapper

# -------------------------------------------------
# RTL FILES
# -------------------------------------------------

set_global_assignment \
-name SYSTEMVERILOG_FILE \
../../rtl/top/top_wrapper.sv

# -------------------------------------------------
# SDC FILE
# -------------------------------------------------

set_global_assignment \
-name SDC_FILE \
../constraints/top.sdc

project_close