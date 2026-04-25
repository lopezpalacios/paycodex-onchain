// Reference Hardhat config pinned for the snippets in this repo.
// Solidity 0.8.20 matches the OpenZeppelin Contracts 5.x baseline used by all snippets.

import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: {
    version: "0.8.20",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
      // viaIR enables more aggressive optimization; disable if compile time matters.
      viaIR: false,
    },
  },
  networks: {
    // hardhat in-memory network is the default; uncomment + edit to deploy elsewhere.
    // sepolia: {
    //   url: process.env.SEPOLIA_RPC_URL || "",
    //   accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : [],
    // },
    // base: {
    //   url: "https://mainnet.base.org",
    //   accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : [],
    // },
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts",
  },
};

export default config;
