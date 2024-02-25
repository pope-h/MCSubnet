import { ethers } from "hardhat";

async function main() {
  const popeToken = await ethers.deployContract("PopeToken");
  await popeToken.waitForDeployment();

  const vault = await ethers.deployContract("Vault", [popeToken.target]);
  await vault.waitForDeployment();

  console.log(`PopeToken contract deployed to ${popeToken.target}`);
  console.log(`Vault contract deployed to ${vault.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
