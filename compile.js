const path = require("path");
const fs = require("fs");
const solc = require("solc");
const contractPath = path.resolve(__dirname, "contracts", "CarSale.sol");
const source = fs.readFileSync(contractPath, "utf8");
// module.exports = solc.compile(source, 1).contracts[":CarSale"];
const output = solc.compile(source);

console.log(output)