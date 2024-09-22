const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("DoitModule", (m) => {

  const lock = m.contract("Doit", []);


  return { lock };
});
