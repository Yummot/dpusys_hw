# script for generating bitstream of a project

set current_project [get_projects]

set IMPL_LAST_STEP "route_design"
set COMPLETE_RE {write_bitstream\s[cC]omplete}

proc get_num_cores {} {
    global tcl_platform env
    switch ${tcl_platform(platform)} {
        "windows" { 
            return $env(NUMBER_OF_PROCESSORS)       
        }

        "unix" {
            if {![catch {open "/proc/cpuinfo"} f]} {
                set cores [regexp -all -line {^processor\s} [read $f]]
                close $f
                if {$cores > 0} {
                    return $cores
                } else {
                    return 1
                }
            }
        }

        "Darwin" {
            if {![catch {exec {*}$sysctl -n "hw.ncpu"} cores]} {
                return $cores
            }
        }

        default {
            puts "Unknown System"
            return 1
        }
    }
}

set n_core [get_num_cores]

# check if outdate
set synth_outdate [get_property NEEDS_REFRESH [get_runs synth_1]]
set impl_outdate [get_property NEEDS_REFRESH [get_runs impl_1]]
set outdate [expr {$synth_outdate | $impl_outdate}]

if {$outdate} {
    reset_runs synth_1
}

# check if complete
set status [get_property STATUS [get_runs impl_1]]
puts "impl status: $status"
set complete [regexp $COMPLETE_RE $status matched]

if {$complete} {
    puts "$current_project write bitstream finished"
    exit 0
}


if {$n_core == 1} {
    launch_runs impl_1 -to_step write_bitstream
} else {
    launch_runs impl_1 -to_step write_bitstream -jobs 12
}

wait_on_run impl_1

puts "$current_project write bitstream finished"
