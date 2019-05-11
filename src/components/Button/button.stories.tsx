import * as React from "react";
import { checkA11y } from "@storybook/addon-a11y";
import { storiesOf } from "@storybook/react";
import { withKnobs, text, object } from "@storybook/addon-knobs";
import { action } from "@storybook/addon-actions";
import Button from "./Button";

const doc = `
### button
example of button
`;

storiesOf("Button", module)
  .addDecorator(checkA11y)
  .addDecorator(withKnobs)
  .add(
    "with text",
    () => {
      return (
        <Button onClick={action("onClick")}>
          {text("content", "Hello Button")}
        </Button>
      );
    },
    { notes: doc }
  )
  .add("with some emoji", () => (
    <Button
      onClick={action("onClick")}
      styles={object("style", { backgroundColor: "red", color: "darkRed" })}
    >
      {text("content", "😀 😎 👍 💯")}
    </Button>
  ));
