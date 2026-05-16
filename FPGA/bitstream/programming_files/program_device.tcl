# =====================================================
# FPGA Programming Script
# =====================================================

load_package programmer

# -----------------------------------------------------
# Hardware Setup
# -----------------------------------------------------

set_hardware_name "USB-Blaster"

set_device_name "@1: Cyclone V"

# -----------------------------------------------------
# Program FPGA
# -----------------------------------------------------

begin_memory_edit

set_programming_file \
cpu_top.sof

puts "Programming FPGA..."

end_memory_edit

puts "Programming Completed"