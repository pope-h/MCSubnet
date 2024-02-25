## Metacrafters Subnet Project

### Overview 

Creating an EVM-Subnet on Avalanche Overview This project establishes an EVM Subnet on the Avalanche network named "Ajidokwu," featuring its native token, GamersTokens (AJI). The network seamlessly integrates with MetaMask, enabling the deployment and interaction with smart contracts through the injected provider on Remix.

### Project Features

#### Pope Token

- Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.

- Transferring tokens: Players should be able to transfer their tokens to others.

- Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.

- Checking token balance: Players should be able to check their token balance at any time.

- Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.

#### The Vault contract

- This is a simple contract to enable users get donations from one or more donors. A time lock is set and users can only claim after the lock time is expired.

## Getting Started

Follow these steps to get the project up and running on your local machine.

**Prerequisites**

- Node.js and npm installed on your machine.
- Clone the repository using the command - git clone https://github.com/username/projectname.git
- Change directory into your project file - cd projectname
- Install all dependencies with - npm install
- Compile the contract using Hardhat - npx hardhat compile 
- Run deployment script- npx hardhat run scripts/deploy.js  
- Interact with the deployed contract through transactions like transfers, minting, and burning.

## Author

- Ekarika Nsemeke

PopeToken contract deployed to 0x5FbDB2315678afecb367f032d93F642f64180aa3
Vault contract deployed to 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512