// Allows us to use ES6 in our migrations and tests.
require('babel-register')
//npm install truffle-hdwallet-provider
//truffle deploy --network ropsten
var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = "cherry sibling song west cause buddy culture come slide city educate trend"; // this is your seed phrase of MetaMask wallet
module.exports = {
  networks: {
    development: {
      host: '127.0.0.1',
      port: 8545,
      network_id: '*' // Match any network id
    },
    ropsten: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/VKIfNFfyGp3cwoGxqGyZ")
      },
      network_id: 3,
      // from:"0xEBc3D75CCB8325Cb016af7d1A46e0458A48d7a44",
      gas:"2700000" // Gas limit used for deploys
    },
    rinkeby: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/VKIfNFfyGp3cwoGxqGyZ")
      }, 
      network_id: 4,
      // from:"0xEBc3D75CCB8325Cb016af7d1A46e0458A48d7a44", this is your Account 1 in MetaMask Wallet
      gas: "2700000" // Gas limit used for deploys
    }
  }
}