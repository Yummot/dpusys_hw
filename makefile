ALL = dpusys_1core_B1152 dpusys_1core_B406 dpusys_2core_B1152 dpusys_2core_B4096 dpusys_1core_B1024 dpusys_1core_B2304 dpusys_2core_B1024

IMPLS = $(addsuffix .impl, $(ALL))

BITS = $(addsuffix .bit, $(ALL))

.PHONY: all $(IMPLS) $(BITS) check-vivado

all: $(ALL)

%: scripts/%.tcl scripts/%_bd.tcl check-vivado
	vivado -mode batch -source $< -quiet -notrace

dpusys_1core_B1152.impl: scripts/impl.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_1core_B1152/dpusys_1core_B1152.xpr -quiet -notrace

dpusys_1core_B4096.impl: scripts/impl.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_1core_B4096/dpusys_1core_B4096.xpr -quiet -notrace

dpusys_1core_B1024.impl: scripts/impl.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_1core_B1024/dpusys_1core_B1024.xpr -quiet -notrace

dpusys_1core_B2304.impl: scripts/impl.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_1core_B2304/dpusys_1core_B2304.xpr -quiet -notrace

dpusys_2core_B1152.impl: scripts/impl.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_2core_B1152/dpusys_2core_B1152.xpr -quiet -notrace

dpusys_2core_B4096.impl: scripts/impl.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_2core_B4096/dpusys_2core_B4096.xpr -quiet -notrace

dpusys_2core_B1024.impl: scripts/impl.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_2core_B1024/dpusys_2core_B1024.xpr -quiet -notrace

dpusys_1core_B1152.bit: scripts/bit_stream.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_1core_B1152/dpusys_1core_B1152.xpr -quiet -notrace

dpusys_1core_B4096.bit: scripts/bit_stream.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_1core_B4096/dpusys_1core_B4096.xpr -quiet -notrace

dpusys_1core_B1024.bit: scripts/bit_stream.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_1core_B1024/dpusys_1core_B1024.xpr -quiet -notrace

dpusys_1core_B2304.bit: scripts/bit_stream.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_1core_B2304/dpusys_1core_B2304.xpr -quiet -notrace

dpusys_2core_B1152.bit: scripts/bit_stream.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_2core_B1152/dpusys_2core_B1152.xpr -quiet -notrace

dpusys_2core_B4096.bit: scripts/bit_stream.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_2core_B4096/dpusys_2core_B4096.xpr -quiet -notrace

dpusys_2core_B1024.bit: scripts/bit_stream.tcl check-vivado
	vivado -mode batch -source $< build/dpusys_2core_B1024/dpusys_2core_B1024.xpr -quiet -notrace

check-vivado:
	@which vivado > /dev/null