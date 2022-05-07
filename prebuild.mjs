import * as fs from "node:fs";
import * as path from "node:path";
import { fileURLToPath } from "node:url";

const DIR = path.dirname(fileURLToPath(import.meta.url));
const BUILD = fileURLToPath(new URL("public/build", import.meta.url));

fs.rmSync(BUILD, { recursive: true, force: true });

fs.mkdirSync(BUILD);

fs.copyFileSync(
  `${DIR}/node_modules/@hpcc-js/wasm/dist/graphvizlib.wasm`,
  `${BUILD}/graphvizlib.wasm`
);
