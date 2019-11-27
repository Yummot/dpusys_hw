
#Get parameters from base instance

#zcu102 xdc
set_property PACKAGE_PIN AL8 [get_ports sys_diff_clock_clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_diff_clock_clk_p]

set_property PACKAGE_PIN AF15 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]


# HDMI TX
#set_property PACKAGE_PIN R27 [get_ports TX_REFCLK_P_IN]

#set_property IOSTANDARD LVDS [get_ports HDMI_TX_CLK_P_OUT]
#set_property PACKAGE_PIN AF6 [get_ports HDMI_TX_CLK_P_OUT]

#set_property IOSTANDARD LVCMOS33 [get_ports TX_HPD_IN]
#set_property PACKAGE_PIN B16 [get_ports TX_HPD_IN]

#set_property IOSTANDARD LVCMOS33 [get_ports TX_DDC_OUT_scl_io]
#set_property IOSTANDARD LVCMOS33 [get_ports TX_DDC_OUT_sda_io]
#set_property PACKAGE_PIN C16 [get_ports TX_DDC_OUT_scl_io]
#set_property PACKAGE_PIN D16 [get_ports TX_DDC_OUT_sda_io]
# GPIO_LED_0_LS HDMI_STATUS_LED
#set_property PACKAGE_PIN AG14 [get_ports LED0]
#set_property IOSTANDARD LVCMOS33 [get_ports LED0]

#set_property PACKAGE_PIN B15 [get_ports {TX_EN_OUT[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {TX_EN_OUT[0]}]

#set_property PACKAGE_PIN H12 [get_ports SI5324_LOL_IN]
#set_property IOSTANDARD LVCMOS33 [get_ports SI5324_LOL_IN]

#set_property PACKAGE_PIN J12 [get_ports {SI5324_RST_OUT[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SI5324_RST_OUT[0]}]

# I2C
set_property IOSTANDARD LVCMOS33 [get_ports fmch_iic_scl_io]
set_property PACKAGE_PIN F15 [get_ports fmch_iic_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports fmch_iic_sda_io]
set_property PACKAGE_PIN F16 [get_ports fmch_iic_sda_io]


#CSI2 Rx Subsystem Related constraints

#Sensor IIC
set_property PULLUP true [get_ports IIC_sensor_scl_io]
set_property PULLUP true [get_ports IIC_sensor_sda_io]
set_property PACKAGE_PIN L15 [get_ports IIC_sensor_scl_io]
set_property PACKAGE_PIN K15 [get_ports IIC_sensor_sda_io]
set_property IOSTANDARD HSUL_12_DCI [get_ports IIC_sensor_scl_io]
set_property IOSTANDARD HSUL_12_DCI [get_ports IIC_sensor_sda_io]

# MIPI CSI-2 - GPIO - CAM_FLASH, CAM_XCE, CAM_RST
#
# PL Port               Pin   Schematic    FMC
#
# sensor_gpio_rst       M14   HPC0_LA22_N  G25  FMC_RST
# sensor_gpio_spi_cs_n  M10   HPC0_LA27_P  C26  FMC_SPI_CS_N
# sensor_gpio_flash     AA12  HPC0_LA16_N  G19  FMC_FLASH
#
set_property PACKAGE_PIN M14 [get_ports {sensor_gpio_rst}]
set_property PACKAGE_PIN M10 [get_ports {sensor_gpio_spi_cs_n}]
set_property PACKAGE_PIN AA12 [get_ports {sensor_gpio_flash}]
set_property IOSTANDARD LVCMOS12 [get_ports sensor_gpio_*]

#DSI GPIO Display
#set_property PACKAGE_PIN L12 [get_ports {gpio_display_tri_o[0]}]
#set_property PACKAGE_PIN K12 [get_ports {gpio_display_tri_o[1]}]

#set_property IOSTANDARD LVCMOS12 [get_ports {gpio_display_tri_o[*]}]


#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets mipi_example_zcu102_i/peripherals_ss/clk_wiz_1/inst/clk_out3]

#set_false_path -from [get_cells -hierarchical -filter {NAME =~*gpio_core_1/Not_Dual.gpio_Data_Out_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*gen_AB_reg_slice.state_reg[*]}]
#set_false_path -from [get_cells -hierarchical -filter {NAME =~*gpio_core_1/Not_Dual.gpio_Data_Out_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*gen_AB_reg_slice.sel_rd_reg*}]
