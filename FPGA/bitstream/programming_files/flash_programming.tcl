# =====================================================
# Flash Programming Script
# =====================================================

load_package programmer

# -----------------------------------------------------
# Program Flash Memory
# -----------------------------------------------------

quartus_pgm \
-m jtag \
-o "p;cpu_top.pof"

puts "Flash Programming Completed"