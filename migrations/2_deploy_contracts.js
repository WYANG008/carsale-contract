const CarSale = artifacts.require('./CarSale.sol');


module.exports = async (deployer, network, accounts) => {
	console.log("2 migration network: ", network)
	console.log("2 migration aaounts: ", accounts)
	await deployer.deploy(
		CarSale,
		{
			from: accounts[0]
		}
	);


};
