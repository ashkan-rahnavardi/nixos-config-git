#!/usr/bin/env bash

ranger --choosedir=/tmp/chosendir || exit
if [ -d "$(cat /tmp/chosendir)" ]; then
	cd "$(cat /tmp/chosendir)" || return
fi
