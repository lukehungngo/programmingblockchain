Setup a fullnode to deploy and run Smart Contract in local device

# 1. Setup
## Link for setup
https://www.ethereum.org/cli

### Link for managing Ethereum account using geth
https://github.com/ethereum/go-ethereum/wiki/Managing-your-accounts

#### Example
##### Creating new account
```
$ geth account new
```
```
$ geth account new --password /path/to/passwdfile
```
```
$ geth account new
Your new account is locked with a password. Please give a password. Do not forget this password.
Passphrase:
Repeat Passphrase:
Address: {168bc315a2ee09042d83d7c5811b533620531f67}
```
##### Listing accounts
```
$ geth account list
```
Accounts in a custom keystore directory
```
$ geth account list --keystore /tmp/mykeystore/
Account #0: {5afdd78bdacb56ab1dad28741ea2a0e47fe41331} keystore:///tmp/mykeystore/UTC--2017-04-28T08-46-27.437847599Z--5afdd78bdacb56ab1dad28741ea2a0e47fe41331
Account #1: {9acb9ff906641a434803efb474c96a837756287f} keystore:///tmp/mykeystore/UTC--2017-04-28T08-46-52.180688336Z--9acb9ff906641a434803efb474c96a837756287f
```
# 2. Example
## 1. Deploying Truffle Contracts to Rinkeby
1. Run geth with Rinkeby.
2. Have a wallet in Rinkeby.
3. Configure Truffle to use Rinkeby.
4. Deploy code.

### Running Rinkeby
Run geth command to sync Rinkeby network database

`$ geth --rinkeby --rpc --rpcapi db,eth,net,web3,personal`
or for fast sync
`$ geth --rinkeby --fast --rpc --rpcapi db,eth,net,web3,personal`

Example of chaindata directory
`database=/Users/hungngo/Library/Ethereum/rinkeby/geth/chaindata`

### Create account in Rinkeby

`$ geth account new`
#### Notice
Make sure that chaindata and keystore in the same network directory to unlock account.

Example of keystore directory

`database=/Users/hungngo/Library/Ethereum/rinkeby/geth/keystore`
All accounts will be stored in keystore file
### Configure Truffle in truffle.js
```
module.exports =
{
    networks:
    {
        development:
        {
            host: "localhost",
            port: 8545,
            network_id: "*" // Match any network id
        },
        rinkeby:
        {
            host: "localhost", // Connect to geth on the specified
            port: 8545,
            from: "99f6db4428825b2576eb53f7a7d5932eab9c5bd7", // default address to use for any transaction Truffle makes during migrations
            network_id: 4, // Rinkeby network id
            gas: 4612388 // Gas limit used for deploys
        }
    }
};
```

### Deploying to Rinkeby
Before deploy Smart Contract to Rinkeby, stop geth then re-run it using following command to unlock account

`$ geth --rinkeby --rpc --rpcapi db,eth,net,web3,personal --unlock="99f6db4428825b2576eb53f7a7d5932eab9c5bd7"`

Unlock account address match account address in truffle configure file

After unlock account and finish synchronize rinkeby network, run following command to deploy Smart Contract
```
$ truffle migrate --network rinkeby
Using network 'rinkeby'.

Running migration: 1_initial_migration.js
Deploying Migrations...
Migrations: 0x7bb345184c660bfadca4ba8c766875cd02c4556f
Saving successful migration to network...
Saving artifacts...
Running migration: 1499575148_deploy_hello_world.js
Deploying HelloWorld...
HelloWorld: 0xbfbbd01ae2ea4bfc777f6ea3a2ad4843c7a104fb
Saving successful migration to network...
Saving artifacts...
```
We have deploy successfully a contract to Rinkeby using Truffle! We can go to etherscan and see that our contract is there. The following is the information for the contract aboove https://rinkeby.etherscan.io/address/0xbfbbd01ae2ea4bfc777f6ea3a2ad4843c7a104fb.

# 3. Reference Link:

1. https://medium.com/practical-blockchain/deploying-smart-contract-to-rinkeby-testnet-using-truffle-and-mac-os-x-8fc16ff380e2
2. https://blog.abuiles.com/blog/2017/07/09/deploying-truffle-contracts-to-rinkeby/




