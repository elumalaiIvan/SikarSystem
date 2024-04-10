#!/bin/bash
# Function to create a new project

# Get the current working directory
#current_dir="$(pwd)"
# Load configuration from application.properties
#source "$current_dir/pom.sikarXml"

APP_DIR=""

create() {
    echo "Enter the project name:"
    read appName

    echo "Select project type:"
    echo "1. Plain Java"
    echo "2. Sikar Boot"
    read -p "Enter your choice [1 or 2]: " type

    case $type in
        1)
            create_plain_java_project "$appName"
            ;;
        2)
            create_sikar_boot_project "$appName"
            ;;
        *)
            echo "Invalid choice"
            exit 1
            ;;
    esac
    APP_DIR="$(pwd)/$appName"
    mkdir -p "$APP_DIR"
}

# Function to create a plain Java project structure
create_plain_java_project() {
    local appName=$1
    echo "Creating Plain Java project structure for $appName..."

    cp -R "$SIKAR_SYSTEM_DIR"/templates/javaApplication/* "$APP_DIR"
}

# Function to create a Sikar Boot project structure
create_sikar_boot_project() {
    local appName=$1
    echo "Creating Sikar Boot project structure for $appName..."

    cp -R "$SIKAR_SYSTEM_DIR"/templates/sikarBootApplication/* "$APP_DIR"

    sed -i '' -e "s/{project_name}/$appName/g" "$APP_DIR"/pom.sikar
}