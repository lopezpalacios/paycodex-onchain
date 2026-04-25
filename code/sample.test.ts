// Reference Hardhat test for the BankIssuedToken snippet (code/01-erc20-transfer.sol).
// Place under test/sample.test.ts in your Hardhat project.
//
// Run:
//   npx hardhat test test/sample.test.ts

import { expect } from "chai";
import { ethers } from "hardhat";

describe("BankIssuedToken", () => {
  it("mints to a customer wallet", async () => {
    const [bank, customer] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("BankIssuedToken");
    const token = await Token.deploy("Bank USD", "BUSD");

    await token.connect(bank).mint(customer.address, ethers.parseUnits("1000000", 18));

    expect(await token.balanceOf(customer.address)).to.equal(
      ethers.parseUnits("1000000", 18)
    );
  });

  it("pauses and blocks transfers", async () => {
    const [bank, alice, bob] = await ethers.getSigners();
    const Token = await ethers.getContractFactory("BankIssuedToken");
    const token = await Token.deploy("Bank USD", "BUSD");

    await token.connect(bank).mint(alice.address, ethers.parseUnits("100", 18));
    await token.connect(bank).pause();

    await expect(
      token.connect(alice).transfer(bob.address, ethers.parseUnits("10", 18))
    ).to.be.revertedWithCustomError(token, "EnforcedPause");
  });
});
