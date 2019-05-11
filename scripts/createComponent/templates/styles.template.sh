create_styles() {
    local component_dir=$1
    local component_name=$2
    cat > $component_dir <<EOM
// ${component_name} component
EOM
    echo $styles_content
}
