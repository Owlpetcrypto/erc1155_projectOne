Contract: 0x1CAe00F6B983966F610f7a5f1FE2027E8642C3c5

#This is my learning journey on creating an NFT project

//Install VS code and download node.js

//Create a new app, create directory, switch windows

npx create-react-app (folder name)
cd
code .
//Install all the required packages

npm i -D hardhat
npx hardhat i) delete README.md ii) create a new javascript project
npm i @openzeppelin/contracts
npm install @nomicfoundation/hardhat-toolbox
npm i -D dotenv
npm i -D @nomiclabs/hardhat-etherscan
//Install frontend pacakage

npm i @chakra-ui/react @emotion/react @emotion/styled framer-motion
//clean up src folder

delete setupTest.js, reportWebVitals.js, logo.svg
go to index.js and remove webvitals
go to app.js and remove import logo and remove (header) info
//////////setup complete

//start coding

go to contracts > Lock.sol
rename file and enter code i) preference - write code in remix - copy and paste over to vs
//update and clean up scripts

rename deploy.js to deploy(whatever your project is called).js
remove all comments and update code
//update testnet information into .env

create new file called .env
install metamask and switch to the Goerli testnet
visit Goerli faucet to receive test eth
retrieve Goerli wallet private key from metamask
visit infura to retrieve API key under Goreli
visit test etherscan to retrieve API key
//update hardhat.config.js

update code with env variables
//run some codes

npx hardhat clean
npx hardhat compile
npx hardhat run scripts/(script name).js --network goerli
//if running on localhost 3. npx hardhat node 4. npx hardhat run scripts/(script name).js --network localhost

//check contract

visit goerli etherscan and enter the contract created
verify contract i)npx hardhat verify --network goerli (contract address)
//copy abi file over to src

copy (project name).json from artifacts > contracts to src
//front end time

create front end through javascript
//run website

npm run start
