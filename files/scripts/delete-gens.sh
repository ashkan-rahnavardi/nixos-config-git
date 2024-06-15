#!/usr/bin/env bash

# List all current system generations
generations=$(sudo nix-env --list-generations --profile /nix/var/nix/profiles/system | awk '{print $1}')

echo "Current generations:"
echo "$generations"

# Prompt user for the generations to keep
read -p "Enter the generations you want to keep (separated by space): " -a keep_generations

# Function to check if an element is in the array
contains_element() {
	local element
	for element in "${@:2}"; do
		if [[ "$element" == "$1" ]]; then
			return 0
		fi
	done
	return 1
}

# Loop through all generations
for generation in $generations; do
	if ! contains_element "$generation" "${keep_generations[@]}"; then
		# Delete the generation if it's not in the keep list
		sudo nix-env --delete-generations $generation --profile /nix/var/nix/profiles/system
	fi
done

# Collect garbage to free up space
sudo nix-collect-garbage
