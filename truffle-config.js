const HDWalletProvider = require("@truffle/hdwallet-provider");

const keys = require("./keys/keys.json")

module.exports = {
    networks: {
        kovan: {
            provider: function () {
                return new HDWalletProvider(keys.privKey, keys.providerUrl)
            },
            network_id: '*'
        }
    }
};