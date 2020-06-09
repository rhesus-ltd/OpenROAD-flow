export DESIGN_NICKNAME = ibex
export DESIGN_NAME = ibex_core
export PLATFORM    = gf14

export VERILOG_FILES = ./designs/src/$(DESIGN_NICKNAME)/ibex_core.sv2v.v \
                       ./designs/src/$(DESIGN_NICKNAME)/prim_clock_gating.sv
export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

# These values must be multiples of placement site
export DIE_AREA    = 0 0 252 249.6
export CORE_AREA   = 12.6 12.8 239.4 236.8

export PLACE_DENSITY = 0.32
