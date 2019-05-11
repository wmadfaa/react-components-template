create_component() {
    local component_dir=$1
    local component_name=$2
    cat > $component_dir <<EOM
import React, { FunctionComponent } from "react";
import styles from "./${component_name}.module.scss";

interface ${component_name}Props {}

const ${component_name}: FunctionComponent<${component_name}Props> = props => {
  return <div />;
};

export default ${component_name};

EOM
}
