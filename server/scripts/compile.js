const main = async () => {
    const catalogueCF = await hre.ethers.getContractFactory('Catalogue');
    const catalogueC = await catalogueCF.deploy();
    await catalogueC.deployed();
    console.log("Contract deployed to:", catalogueC.address);
}

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(0);
    }
}

runMain();