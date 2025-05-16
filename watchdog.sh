#!/bin/bash

echo "[*] VELON Watchdog running..."

while true; do
    if ! pgrep -f redis-server > /dev/null; then
        echo "[!] Redis not found. Restarting..."
        redis-server --daemonize yes
    fi

    if ! pgrep -f sweep_summary_generator.py > /dev/null; then
        echo "[!] Sweep Agent down. Restarting..."
        nohup python ~/velon_ssd_system/backend/scheduler/sweep_summary_generator.py > ~/velon_sweep.log 2>&1 &
    fi

    if ! pgrep -f surge_allocator.py > /dev/null; then
        echo "[!] Surge Allocator dead. Reviving..."
        nohup python ~/velon_ssd_system/backend/scheduler/surge_allocator.py > ~/velon_surge.log 2>&1 &
    fi

    sleep 60
done