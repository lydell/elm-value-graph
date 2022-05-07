// @ts-check
import * as esbuild from "esbuild";

/**
 * @type {import("elm-watch/elm-watch-node").Postprocess}
 */
export default async function postprocess({ code, compilationMode }) {
  switch (compilationMode) {
    case "standard":
    case "debug":
      return code;

    case "optimize":
      return minify(code);

    default:
      throw new Error(
        `Unknown compilation mode: ${JSON.stringify(compilationMode)}`
      );
  }
}

const pureFuncs = [
  "F2",
  "F3",
  "F4",
  "F5",
  "F6",
  "F7",
  "F8",
  "F9",
  "A2",
  "A3",
  "A4",
  "A5",
  "A6",
  "A7",
  "A8",
  "A9",
];

// Source: https://discourse.elm-lang.org/t/what-i-ve-learned-about-minifying-elm-code/7632
async function minify(code) {
  return (
    await esbuild.transform(removeIIFE(code), {
      minify: true,
      pure: pureFuncs,
      target: "es5",
      format: "iife",
    })
  ).code;
}

function removeIIFE(code) {
  return `var scope = window;${code.slice(
    code.indexOf("{") + 1,
    code.lastIndexOf("}")
  )}`;
}
