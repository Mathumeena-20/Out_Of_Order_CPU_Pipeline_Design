# =====================================================
# Create JIC File
# =====================================================

load_package programmer

quartus_cpf \
-c \
cpu_top.sof \
cpu_top.jic

puts "JIC File Created"