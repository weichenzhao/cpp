#!/bin/sh
# Simple test case to validate that ranges generation is working.
EXT=pdf
C='--from_start 4'
#C='--from_start 5'
MP='--no-multiprocess'
OPS='--operation_list ranges'
OPS='--operation_list pareto'
FORCE='--force'
METRICS='--lat_metrics'

#PLOT_LIST='--plot_list pareto_max,pareto_max_bw'
PLOT_LIST='--plot_list ranges_lowest'

# Should generate an identical plot to generate.py w/operations_list='ranges'
# data_vis/merged/4_to_0_latency_ranges.pdf
# data_vis/Aarnet/4_to_0_latency_ranges.pdf
GROUP='--topo_group test1'
#./generate_merged.py ${GROUP} ${C} ${METRICS} -w -e ${EXT} ${FORCE} ${MP} ${OPS} ${PLOT_LIST}

# Should generate combination of two:
# data_vis/merged/4_to_0_latency_ranges.pdf
# data_vis/Aarnet/4_to_0_latency_ranges.pdf
# data_vis/Abilene/4_to_0_latency_ranges.pdf
GROUP='--topo_group test2'
./generate_merged.py ${GROUP} ${C} ${METRICS} -w -e ${EXT} ${FORCE} ${MP} ${OPS} ${PLOT_LIST}

TOPOS='--all_topos'
#./generate_merged.py ${TOPOS} ${C} ${METRICS} -w -e ${EXT} ${FORCE} ${MP} ${OPS} ${PLOT_LIST}

# Should yield more interesting data:
C='--from_start 8'
#MAX='--max 8'
#METRICS='--metric latency'
#./generate_merged.py ${TOPOS} ${C} ${METRICS} -w -e ${EXT} ${FORCE} ${MP} ${OPS} ${MAX} ${PLOT_LIST}
