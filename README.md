# FundMe Smart Contract

## Overview
`FundMe.sol` is a Solidity-based smart contract that enables decentralized crowdfunding. The contract allows users to contribute ETH and the contract owner to withdraw funds once the goal is achieved or the campaign ends. It integrates with Chainlink Price Feeds to convert ETH to USD for minimum contribution thresholds.

## Features
- ⛓️ Written in Solidity (v0.8+)
- 💵 Accepts ETH contributions
- 📉 Uses Chainlink Price Feeds to enforce minimum USD contribution
- 🔐 Owner-only withdrawal function
- 🧾 Maintains contributor records

## Technologies Used
- **Solidity**
- **Chainlink Price Feeds**
- **Hardhat** (Recommended for testing & deployment)
- **Ethers.js / Web3.js** (Optional frontend integration)

## File Structure
```
FundMe/
├── contracts/
│   └── FundMe.sol        # Main smart contract
├── scripts/              # (Optional) Deployment & interaction scripts
├── test/                 # (Optional) Contract test cases
├── hardhat.config.js     # Hardhat config (if using Hardhat)
├── package.json
├── README.md
└── .gitignore
```

## How to Use
### 1. Clone the Repository
```bash
git clone https://github.com/your-username/fundme-smart-contract.git
cd fundme-smart-contract
```

### 2. Install Dependencies (If using Hardhat)
```bash
npm install
```

### 3. Compile the Contract
```bash
npx hardhat compile
```

### 4. Deploy the Contract (Example Script)
```bash
npx hardhat run scripts/deploy.js --network <network-name>
```

### 5. Run Tests (If available)
```bash
npx hardhat test
```

## Environment Variables (Optional)
If integrating with testnets:
```
ALCHEMY_API_KEY=your_api_key
PRIVATE_KEY=your_wallet_private_key
ETHERSCAN_API_KEY=your_etherscan_api_key
```

## Security Considerations
- Ensure that only the owner can withdraw funds
- Use SafeMath (for older Solidity versions)
- Consider rate-limiting or time-based restrictions

## License
This project is licensed under the **MIT License**. Feel free to use and modify it for your own learning or development purposes.

## Author
Developed by Vilansh Sharma

---
_If you find this project useful, feel free to ⭐ it and contribute!_

