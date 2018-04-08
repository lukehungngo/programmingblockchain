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
# Truffle Console
## Command
`$ truffle console`

After running truffle console command:
`truffle(development)>`
```
Truffle Develop started at http://localhost:9545/

Accounts:
(0) 0x627306090abab3a6e1400e9345bc60c78a8bef57
(1) 0xf17f52151ebef6c7334fad080c5704d77216b732
(2) 0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef
(3) 0x821aea9a577a9b44299b9c15c88cf3087f3b5544
(4) 0x0d1d4e623d10f9fba5db95830f7d3839406c6af2
(5) 0x2932b7a2355d6fecc4b5c0b6bd44cc31df247a2e
(6) 0x2191ef87e392377ec08e7c08eb105ef5448eced5
(7) 0x0f4f2ac550a1b4e2280d04c21cea7ebd822934b5
(8) 0x6330a553fc93768f612722bb8c2ec78ac90b3bbc
(9) 0x5aeda56215b167893e80b4fe645ba6d5bab767de

Private Keys:
(0) c87509a1c067bbde78beb793e6fa76530b6382a4c0241e5e4a9ec0a0f44dc0d3
(1) ae6ae8e5ccbfb04590405997ee2d52d2b330726137b875053c36d94e974d162f
(2) 0dbbe8e4ae425a6d2687f1a7e3ba17bc98c673636790f1b8ad91193c05875ef1
(3) c88b703fb08cbea894b6aeff5a544fb92e78a18e19814cd85da83b71f772aa6c
(4) 388c684f0ba1ef5017716adb5d21a053ea8e90277d0868337519f97bede61418
(5) 659cbb0e2411a44db63778987b1e22153c086a95eb6b18bdf89de078917abc63
(6) 82d052c865f5763aad42add438569276c00d3d88a2d062d36b2bae914d58b8c8
(7) aa3680d5d48a8283413f7a108367c7299ca73f553735860a87b08f39395618b7
(8) 0f62d96d6675f32685bbdb8ac13cda7c23436f63efbb9d07700d8669ff12b7c4
(9) 8d5366123cb560bb606379f90a0bfd4769eecc0557f1b362dcae9012b548b1e5
```
# Choosing Ethereum Client
## 1. Truffle develop
Truffle build-in client
### Command
`$ truffle develop`

This will run the client on http://127.0.0.1:9545. It will display the first 10 accounts and the mnemonic used to create those accounts

## 2. Geth
### Command

#### Mainnet
`$ geth  --rpc --rpcapi db,eth,net,web3,personal`

#### Rinkeby
`$ geth --rinkeby --rpc --rpcapi db,eth,net,web3,personal`

See more in geth.md
## 3. Testrpc
### Command
#### Install test RPC
`npm install -g ethereumjs-testrpc`

#### Run testRPC
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
# Compile Contract
## Command
`$ truffle compile`

Artifacts of your compilation will be placed in the build/contracts/ directory, relative to your project root.

## Import dependencies via name
Import file from the same directory

`import "./AnotherContract.sol";`

Import file from other package

`import "somepackage/SomeContract.sol";`

# Running Migrations
Running migration to deploy Smart Contract to Ethereum Blockchain (mainnet, testnet or privatenet)
## Command
`$ truffle migrate`

## Migration file
```var MyContract = artifacts.require("MyContract");

module.exports = function(deployer) {
    // deployment steps
    deployer.deploy(MyContract);
    };
```
# Testing Smart Contract
This framework lets you write simple and manageable tests in two different ways:
- In Javascript, for exercising your contracts from the outside world, just like your application.
- In Solidity, for exercising your contracts in advanced, bare-to-the-metal scenarios.
## Location
All test files should be located in the ./test directory. Truffle will only run test files with the following file extensions: .js, .es, .es6, and .jsx, and .sol. All other files are ignored.
## Command
`$ truffle test`

Alternatively, you can specify a path to a specific file you want to run, e.g.,

`$ truffle test ./path/to/test/file.js`

## Writing test
Using web3, javascript

### Example
```
var MetaCoin = artifacts.require("./MetaCoin.sol");

contract('MetaCoin', function (accounts) {
    it("should put 10000 MetaCoin in the first account", function () {
        return MetaCoin.deployed().then(function (instance) {
        return instance.getBalance.call(accounts[0]);
        }).then(function (balance) {
        assert.equal(balance.valueOf(), 10000, "10000 wasn't in the first account");
    });
});
it("should call a function that depends on a linked library", function () {
    var meta;
    var metaCoinBalance;
    var metaCoinEthBalance;

    return MetaCoin.deployed().then(function (instance) {
        meta = instance;
        return meta.getBalance.call(accounts[0]);
        }).then(function (outCoinBalance) {
        metaCoinBalance = outCoinBalance.toNumber();
        return meta.getBalanceInEth.call(accounts[0]);
        }).then(function (outCoinBalanceEth) {
        metaCoinEthBalance = outCoinBalanceEth.toNumber();
        }).then(function () {
        assert.equal(metaCoinEthBalance, 2 * metaCoinBalance, "Library function returned unexpected function, linkage may be broken");
        });
    });
    it("should send coin correctly", function () {
        var meta;

        // Get initial balances of first and second account.
        var account_one = accounts[0];
        var account_two = accounts[1];

        var account_one_starting_balance;
        var account_two_starting_balance;
        var account_one_ending_balance;
        var account_two_ending_balance;

        var amount = 10;

        return MetaCoin.deployed().then(function (instance) {
        meta = instance;
        return meta.getBalance.call(account_one);
        }).then(function (balance) {
        account_one_starting_balance = balance.toNumber();
        return meta.getBalance.call(account_two);
        }).then(function (balance) {
        account_two_starting_balance = balance.toNumber();
        return meta.sendCoin(account_two, amount, { from: account_one });
        }).then(function () {
        return meta.getBalance.call(account_one);
        }).then(function (balance) {
        account_one_ending_balance = balance.toNumber();
        return meta.getBalance.call(account_two);
        }).then(function (balance) {
        account_two_ending_balance = balance.toNumber();

        assert.equal(account_one_ending_balance, account_one_starting_balance - amount, "Amount wasn't correctly taken from the sender");
        assert.equal(account_two_ending_balance, account_two_starting_balance + amount, "Amount wasn't correctly sent to the receiver");
        });
    });
});
```

