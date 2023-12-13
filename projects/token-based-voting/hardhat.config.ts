import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import 'dotenv/config';

const config: HardhatUserConfig = {
  solidity: "0.8.20",
  networks: {
    sepolia: {
      url: 'https://sepolia.infura.io/v3/82de4c56f4364dd899635d8ebbc349cc',
      accounts: [process.env.PRIVATE_KEY!]
    },
    testnet: {
      url: 'https://sepolia.infura.io/v3/82de4c56f4364dd899635d8ebbc349cc',
      accounts: {
        mnemonic: process.env.MNEMONIC,
        path: "m/44'/60'/0'/0",
        initialIndex: 0,
        count: 1,
        passphrase: ''
      }
    },
    devnet: {
      url: 'http://127.0.0.1:7545',
      accounts: {
        mnemonic: process.env.MNEMONIC,
        path: "m/44'/60'/0'/0",
        initialIndex: 0,
        count: 1,
        passphrase: ''
      }
    }
  },
  etherscan: {
    apiKey: {sepolia: 'DUU2RIG2D7G2NT3FST6HHJNRQSVQFD1XCI', testnet: 'DUU2RIG2D7G2NT3FST6HHJNRQSVQFD1XCI'}
  }
};

export default config;
