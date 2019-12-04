set ::platform "zcu102"
set ::silicon "e"

set part "xczu9eg-ffvb1156-2-${::silicon}"
set proj_name "dpusys_2core_B1152"
set bd_postfix "_bd"
set proj_bd_name "$proj_name$bd_postfix"

set proj_dir "build/$proj_name"
set consts_dir "consts"
set scripts_dir "scripts"
set dpu_ip_dir "dpu_ip"
set bd_scripts_path "$scripts_dir/$proj_bd_name.tcl"

create_project $proj_name $proj_dir -part $part -force
set_property board_part xilinx.com:zcu102:part0:3.3 [current_project]

# dpu ip import
set dpu_ip_exist [file exists $dpu_ip_dir]
if {$dpu_ip_exist!=1} {
    puts "dpu ip repo <$dpu_ip_dir> is not exists"
    exit 1
}
set_property ip_repo_paths "$dpu_ip_dir" [current_project]
update_ip_catalog

# create bd
source $bd_scripts_path
regenerate_bd_layout

# create verilog wrapper
make_wrapper -files [get_files $proj_dir/$proj_name.srcs/sources_1/bd/sys/sys.bd] -top
add_files -norecurse $proj_dir/$proj_name.srcs/sources_1/bd/sys/hdl/sys_wrapper.v

add_files -fileset constrs_1 -norecurse $consts_dir/zcu102.xdc
add_files -fileset constrs_1 -norecurse $consts_dir/misc.xdc

# set top module
set_property top sys_wrapper [current_fileset]