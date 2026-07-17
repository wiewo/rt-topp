#!/bin/bash

# run as sudo
# CPU info: lscpu
# gives statistics: sudo perf stat <exe>

set -e

# disable sibling for CPU 2
echo 0 > /sys/devices/system/cpu/cpu6/online
# echo 0 > /sys/devices/system/cpu/cpu0/online
echo 0 > /sys/devices/system/cpu/cpu4/online

# final version run with turbo, could also be run without at less performance
# but more similar and reproducible results
echo 0 > /sys/devices/system/cpu/intel_pstate/no_turbo

## check with cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
## should be set to performance
## doesn't work, should be set with cpufrequtils by default
# for i in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
# do
#   echo performance > $i
# done

#ASLR
echo 0 | sudo tee /proc/sys/kernel/randomize_va_space

# disable fs cache
echo 3 | sudo tee /proc/sys/vm/drop_caches
sync

for i in {1..10}; do ./build/param_random_waypoints_example_generic; done
for i in {1..10}; do ./build/param_random_waypoints_example_iiwa; done
