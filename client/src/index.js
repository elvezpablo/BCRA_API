import React from "react";
import ReactDOM from "react-dom";
import App from "./component/App";
import { ThemeProvider } from "emotion-theming";
import theme from "./theme";

ReactDOM.render(
  <ThemeProvider theme={theme}>
    <App />
  </ThemeProvider>,
  document.getElementById("root")
);
