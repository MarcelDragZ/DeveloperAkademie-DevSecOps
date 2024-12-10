const fs = require("fs");
const path = require("path");
const dotenv = require("dotenv");

const envConfig = dotenv.config({
  path: path.resolve(__dirname, "../.env"),
}).parsed;

console.log("Loaded ENV:", envConfig);

function generateEnvFileContent(isProduction) {
  return `export const environment = {
    production: ${isProduction},
    apiUrl: '${envConfig.API_URL}'
  };`;
}

const envFileContent = generateEnvFileContent(false);
const envFileContentBuild = generateEnvFileContent(true);

fs.writeFileSync("./src/environments/environment.ts", envFileContent);
fs.writeFileSync("./src/environments/environment.prod.ts", envFileContentBuild);