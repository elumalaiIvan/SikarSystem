#!/bin/bash
# Function to create a new project

# Get the current working directory
#current_dir="$(pwd)"
# Load configuration from application.properties
#source "$current_dir/pom.sikarXml"

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
}

# Function to create a plain Java project structure
create_plain_java_project() {
    local appName=$1
    local appDirectory="$(pwd)/$appName"

    echo "Creating Plain Java project structure for $appName..."

    mkdir -p "$appDirectory/src/main/java/com/sikar"
    touch "$appDirectory/src/main/java/com/sikar/Main.java"
    # You can create more files/directories as needed
}

# Function to create a Sikar Boot project structure
create_sikar_boot_project() {
    local appName=$1
    local appDirectory="$(pwd)/$appName"

    echo "Creating Sikar Boot project structure for $appName..."

    mkdir -p "$appDirectory/src/main/java/com/sikar"
    mkdir -p "$appDirectory/src/main/resources"
    cp "$main_script_dir"/template/SikarBootApplication.java "$appDirectory/src/main/java/com/sikar"
    cp "$main_script_dir"/template/pom.sikar "$appDirectory"
    cp "$main_script_dir"/template/sikarApplication.properties "$appDirectory/src/main/resources"

    sed -i '' -e "s/{project_name}/$appName/g" "$appDirectory"/pom.sikar
}