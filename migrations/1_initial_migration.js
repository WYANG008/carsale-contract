var Migrations = artifacts.require('./Migrations.sol');

module.exports = function (deployer, network, accounts) {
	console.log("1 migration network: ", network)
	console.log("1 migration aaounts: ", accounts)


	deployer.deploy(Migrations, { from: accounts[0] });
};
