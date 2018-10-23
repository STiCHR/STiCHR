var STiCHR = artifacts.require("./STiCHR.sol");

module.exports = function(deployer) {
  deployer.deploy(STiCHR, 1000000);
};