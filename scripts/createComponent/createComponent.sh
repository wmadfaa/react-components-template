#!/bin/bash
script="$0"
basename="$(dirname $script)"
componentsFolder="src/components"

source $basename/templates/component.template.sh
source $basename/templates/storie.template.sh
source $basename/templates/styles.template.sh

# extanions
component_ext=".tsx"
storie_ext=".stories.tsx"
styles_ext=".module.scss"

echo "Which Type of component?"
componentType=("function" "class")
select opt in "${componentType[@]}"; do
    case $opt in
    "function")
        echo "function"
        break
        ;;
    "class")
        echo "class"
        branchType="class"
        break
        ;;
    *) echo "invalid option $REPLY" ;;
    esac
done

# get component file content
read -p "Enter the component name: " component_name

while true; do
    read -p "Do want to create a storie for this component? (y/n) " yn
    case $yn in
    [Yy]*)
        # get the storie content
        should_create_storie=true
        break
        ;;
    [Nn]*)
        should_create_storie=false
        break
        ;;
    *) echo "Please answer y or n. " ;;
    esac
done

while true; do
    read -p "Do want to create a styles for this component? (y/n) " yn
    case $yn in
    [Yy]*)
        # get the styles content
        should_create_styles=true
        break
        ;;
    [Nn]*)
        should_create_styles=false
        break
        ;;
    *) echo "Please answer y or n. " ;;
    esac
done

#confirm
while true; do
    read -p "Do want to create this component? (y/n) " yn
    case $yn in
    [Yy]*)
        # create the component folder
        mkdir -p $componentsFolder/$component_name
        #create the component script file
        create_component $componentsFolder/$component_name/$component_name${component_ext} $component_name
        #create the component styles file
        if $should_create_styles; then
            create_styles $componentsFolder/$component_name/$component_name${styles_ext} $component_name
        fi
        #create the component storie file
        if $should_create_storie; then
            create_storie $componentsFolder/$component_name/$component_name${storie_ext} $component_name
        fi
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer y or n. " ;;
    esac
done
