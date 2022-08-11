const { expect } = require('chai');
const { ethers, upgrades } = require('hardhat');

describe('MyToken', function () {
  it('deploys', async function () {
    const MyTokenV1 = await ethers.getContractFactory('MyTokenV1');
    const one = await upgrades.deployProxy(MyTokenV1, { kind: 'uups' });
    await one.deployed();

    const MyTokenV2 = await ethers.getContractFactory('MyTokenV2')
    const two = await upgrades.upgradeProxy(one.address, MyTokenV2)// as MyTokenV2
    await two.deployed();
    
    expect (await two.add(1)).to.not.be.reverted;

    expect(two.address).to.eq(one.address);
  });
});
