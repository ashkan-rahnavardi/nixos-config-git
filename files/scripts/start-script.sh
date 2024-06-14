#!/usr/bin/env bash

# AutoConnect to Speaker
JBL_SPEAKER="5C:FB:7C:2F:BA:4A"
bluetoothctl power on
bluetoothctl agent on
bluetoothctl connect $JBL_SPEAKER
bluetoothctl agent NoInputNoOutput
