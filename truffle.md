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