# =====================================================
# Programmer Setup
# =====================================================

load_package programmer

# -----------------------------------------------------
# Auto Detect Hardware
# -----------------------------------------------------

foreach hw [get_hardware_names] {

    puts "Detected Hardware: $hw"

}

# -----------------------------------------------------
# Auto Detect Devices
# -----------------------------------------------------

foreach dev [get_device_names] {

    puts "Detected Device: $dev"

}