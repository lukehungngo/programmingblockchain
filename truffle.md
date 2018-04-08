# Install Nodejs modules

Link: https://nodejs.org/en/download/

Choose suitable environment and install nodejs

# Install Truffle

`$ npm install -g truffle`

# Creating a project

```
mkdir MetaCoin
cd MetaCoin
truffle unbox metacoin
```

Once completed, you'll now have a project structure with the following items:

```
contracts/: Directory for Solidity contracts. Programming Smart Contract in this Directory
migrations/: Directory for scriptable deployment files
test/: Directory for test files for testing your application and contracts. Test file can be .sol or .js
truffle.js: Truffle configuration file
```
# Choosing Ethereum Client
## 1. Truffle develop
Truffle build-in client

`$ truffle develop`

This will run the client on http://127.0.0.1:9545. It will display the first 10 accounts and the mnemonic used to create those accounts

Wallet passphrase
`candy maple cake sugar pudding cream honey rich smooth crumble sweet treat`

## 2. Geth
Run geth command

### Mainnet
`$ geth  --rpc --rpcapi db,eth,net,web3,personal`

### Rinkeby
`$ geth --rinkeby --rpc --rpcapi db,eth,net,web3,personal`

See more in geth.md
## 3. Testrpc
### Install test RPC
`npm install -g ethereumjs-testrpc`

### Run testRPC
`$ testrpc`
```
Available Accounts
==================
(0) 0xbaeef7858ad97f4104ef59e9a6e34ee0f635a91e
(1) 0x519b572cb3b71ec19a64fe79b7139f2c99420099
(2) 0xbd74cad2ea2e64e7126a8a6a6a8ff821dc2145d8
(3) 0x4e1361c8105d8ae22d28f7d2321b4ec9d5b55387
(4) 0xb07008e65bdf8e911c11158cc49c2ecaf89668e9
(5) 0x857d0bd4a30c83d705dc3a200c2df0666fc54cda
(6) 0x8d9ec3ee064731ffce12bb78513661d29658db6b
(7) 0xa00d14c97045b68284a6618995d0541194c20d72
(8) 0x08bc63848ca10c3e631a7e2dd5d905636c5d9854
(9) 0xcdc2b6f46a9fd02740ec22e49ddcfd94b635a1be

Private Keys
==================
(0) e7abfc27f88f6d7e5771391d45cba0bf8db9b9dfe2b16b222ccbbcc11ac219ac
(1) c028fbc7da0493bf70d5389bed61604bd66334e8e58581ae6c77c50bf6cff57a
(2) b02a112a3aa88d66e964a5898a243395d6ac17999915e2de5d36e55a142940e0
(3) 0ac9e0350a52e436b9e7283084519f02deabbb842fe54fe418191db429200ba6
(4) f0c96913408b8e022be96ecc69e368c371a17acc7065630fbf9a000c4e66eb36
(5) 9f3acff99c9f4bb834e0441b249453841c2aedf0a16c5177c8682fc7ad7c41a4
(6) ac5bd2e83a1f60091d78ffd2a1dc7a388f6ad94bdb8e859214480c72c701a434
(7) 2b5a9698bc623c2135a1ae3d3e9d89658131be125f77411e47aee63581845b9b
(8) 0e511f5d82f35b5fe82dc0e889eadcacc09d0e94fc99644e56892664538571a2
(9) 2955b8492f82c2b92782ba133404d79da15da5ca75338fb30ed255704cb73997

HD Wallet
==================
Mnemonic:      shiver fix west broom away man oval muffin dismiss gadget choose detail
Base HD Path:  m/44'/60'/0'/0/{account_index}

Listening on localhost:8545
```

