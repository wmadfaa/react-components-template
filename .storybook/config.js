import { configure, addParameters } from "@storybook/react";

addParameters({
  backgrounds: [
    { name: "white", value: "#fff", default: true },
    { name: "dark", value: "rgba(17, 17, 19, 0.7)" },
  ]
});

const req = require.context("../src/components", true, /.stories.tsx$/);
function loadStories() {
  req.keys().forEach(req);
}
configure(loadStories, module);
