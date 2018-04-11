# Install web3js
## Nodejs
`$ npm install web3`
## Yarn
`$ yarn add web3`
## Notice
Makesure you get the most update web3 version. The up-to-date version let you use the up-to-date syntac
# Usage
## Set provider
Use the web3 object directly from global namespace:

Set a provider (HttpProvider)

```
if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
} else {
    // set the provider you want from Web3.providers
    web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
}
```

`console.log(web3); // {eth: .., shh: ...}`

There you go, now you can use it:

```
var coinbase = web3.eth.coinbase;
var balance = web3.eth.getBalance(coinbase);
```
## Get testnet and mainnet provider
Link: https://infura.io

Register at that link and get token to access https://infura.io service
### Example
```
if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
} else {
    // set the provider you want from Web3.providers
    web3 = new Web3(new Web3.providers.HttpProvider("https://ropsten.infura.io/token"));
}
```
## Get Smart Contract via Address and ABI
```
var myContractABI = [...] // ABI of your contract
var myContractAddress = "0x..." // address of your contract
var myContract = new web3.eth.Contract(myContractABI, myContractAddress) // your contract variable now is bind with an existing Smart Contract in ethereum Blockchain via its ABI and address
```
## Get data to broadcast from Smart Contract Method
`var datapayload = myContract.methods.myMethod(param).encodeABI()`

Now, you include this data into a transaction to broadcast it into Blockchain

## Create and Sign Transaction
```
web3.eth.accounts.signTransaction(
    {
        data: datapayload, // datapayload obtain from previous step
        gas: 300000,
        to: myContractAddress // address of Smart Contract recevied the transaction
    },
    privateKey, // private key of EOAs, which will broadcast this transaction
    function(err,res){
        console.log(err);
        console.log(res); // result is a signed Transaction
    }
}
```

This is an async function, the result is `res`. Using `res.rawTransaction` to get raw transaction. But this transaction haven't been send yet.

Example for creating, signing and sending transaction

```
web3.eth.accounts.signTransaction(
    {
        data: datapayload, // datapayload obtain from previous step
        gas: 300000,
        to: myContractAddress // address of Smart Contract recevied the transaction
    },
        privateKey, // private key of EOAs, which will broadcast this transaction
        function(err,res){
            console.log(err);
            console.log(res); // result is a signed Transaction
            web3.eth.accounts.sendSignedTransaction(res.rawTransaction, (err,res) =>{
                console.log(err)
                console.log(res) // Transaction hash
            }
            )
        }
}
```

Use `res.rawTransaction` to get signed transction for broadcasting```. The final result return is transaction hash if success
# Reference Link
1. https://web3js.readthedocs.io/en/1.0/
2. https://github.com/ethereum/web3.js/
