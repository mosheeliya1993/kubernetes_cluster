#!/bin/bash

# Define functions to run playbooks
run_setup_cluster() {
    ansible-playbook -i hosts.ini setup-cluster.yml
}

run_setup_mandatory_apps() {
    ansible-playbook -i hosts.ini setup-mandatory-apps.yml
}

run_setup_system_apps() {
    ansible-playbook -i hosts.ini setup-system-apps.yml
}

# Command-line argument parsing
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --setup-cluster) run_setup_cluster;;
        --setup-mandatory-apps) run_setup_mandatory_apps;;
        --setup-system-apps) run_setup_system_apps;;
        *)
            echo "Unknown parameter passed: $1"
            exit 1
            ;;
    esac
    shift
done
