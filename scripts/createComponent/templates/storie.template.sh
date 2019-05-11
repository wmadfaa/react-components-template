create_storie() {
    local component_dir=$1
    local component_name=$2
    cat > $component_dir <<EOM
import React from "react";
import { checkA11y } from "@storybook/addon-a11y";
import { storiesOf } from "@storybook/react";
import { withKnobs, text } from "@storybook/addon-knobs";
import { action } from "@storybook/addon-actions";
import ${component_name} from "./${component_name}";

const doc = \`
      ### ${component_name}
      example of ${component_name}
    \`;

storiesOf("${component_name}", module)
  .addDecorator(checkA11y)
  .addDecorator(withKnobs)
  .add(
    "default",
    () => {
      return <${component_name}>{text("content", "${component_name}")}</${component_name}>;
    },
    { notes: doc }
  );

EOM
	echo $storie_content
}
