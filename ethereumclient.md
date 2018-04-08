# Ethereum Client
A fullnode, a gateway, or an virtual enviroment to deploy and run Smart Contract in local device

## 1. Geth
##Link for setup
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


