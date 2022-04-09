# 🏛️ Project Vision:


Universities offer the perfect environment for the development and experimentation with DAOs.  The University of British Columbia will use the DAO developed on SKALE for the purposes of managing club activities.  A best practices for DAO management will be a targeted outcome through an iterative process of experimentation, research, and collaboration with existing DAOs 

The best practices will incorporate aspects of DAO technological implementations (backend), user experience (Front end), and DAO use principles.  

The clubs core executive team will remain at a fixed size of 5 for the foreseeable future.  However, numerous subcommittees will be formed to solve specific problems or as a result of club expansion through new hires for example.  It is likely that the development of these subcommittees will result in scenarios of uneven numbers of subcommittee members.  SKALE offers an ideal solution to address these issues throughs it safe random number generator.  For example, in scenarios where the are 4 members on a committee and the vote on an issue results in a stale-mate, i.e. 2 nay and 2 yay votes, the stalemate will be resolved through a coin toss.

Scaffold-Eth allows for the easy onboarding of junior developers in our community to get them hands on experience with building and developing DAOs.  It allows for the quick prototyping of new DAO features on both the front and back-end and the implementation of smart contracts across a range of protocols.  It will play a critical role in onboarding developers from web2 and traditional programming into web3.

The longer term goal of the DAO will be to get buy in from the broader student community outside of the club.  This will be achieved through the demonstrated effectiveness of the DAO in managing our club activities.  TheGraph will be used to examine DAO use and an analysis will be performed to compare DAO outcomes against traditional approaches to governance.  But above this, the sheer success of our club and its likely attribution of that success by our club community to the use of DAOs will be key in getting buy in from the larger student body – in a particular social science students who may dissatisfied with the current approach to running campus wide student elections and governance systems. 

We aim to get students involved in governance decisions for the right reasons, not for the purposes of political prestige. Doing this on campus will ensure the next generation of political leaders will be born  out of the principles of DAO use.

This DAO has also been deployed on Harmony.  One submission can benefit from an ecosystem dedicated to the best use of the core tech of the project (DAOs).  And another submission can benefit from a core tech of an ecosystem which solves a fundamental problem in the use of DAOs.

longer term goals are -  support from protocols in the form of funding rewards for participation in the DAO and contributing to good governance.  Similar to Joseph’s talk the past day where he discussed the prototypical DAO that originated in the coffee shop.  We want to reward students for their engagement, we want to incentive blockchain research by providing grant and funding opportunities that relate to DAO work.  And those funding allocations will be based decisions made by those who have demonstrated expertise in the use of DAOs and participation in their development.  

It may seem like oh you are trying to cover as much breadth as you can, but there is more to it than that.  it comes down to why I was able to cover such breadth, and the reason for this is because I was able to utilize the power of Eth-Scaffold, created by Austin-Griffith.  Using this platform truly does allow for the quick development and prototyping of both back end and front end deck in unified framework.  No jumping from one application to the next to bring your idea to life, it really is all right there!

An additional longer term initiative could be to integrate skales secure randomness into harmony where there has been an concerted effort to support the development of DAOS and there exists a high level of DAO expertise. 

IGNORE the re-entrancy contract - this was for additional tests of RNG and contract expoitability that I did not have time to get around to.

# A specific use case for this DAO would be to use the section on the main page 'POWdao' to submit job opportunities within the DAO ecosystem.
for example, members of the DAO community at UBC, or in collobration with the DAO community at large, could submit job opportunities at DAOs to be reviewed by experts in DAO ecosystems for acceptance to a posting on a public job job board.  Those jobs which have been approved could be summarized on a seperate website and stored in a list on a smart contract (see DaoApprovedList.sol).  This part of the project still needs to be fleshed out and implemented.


# 🏛 Modifying important files in Scaffold-Eth To Connect and Deploy on Harmony

1. copy an entry in hardhat.config under module.exports = {
    defaultNetwork,
    
    and insert your network config.  For example in the hackathon the entry was the following:
    If there is an error launching the contract indicating insufficient funds, increase the gasPrice
    testnetHarmony: {
      url: "https://api.s0.b.hmny.io",
      gasPrice: 50000000000,
      chainId: 1666700000,
      accounts: {
        mnemonic: mnemonic(),
      },
    },
    
    in the same file set const defaultNetwork = "testnetHarmony";
    

2. modify constants.js file to include the Harmony test network.
  testnetHarmony: {
    name: "Harmony Testnet",
    color: "#00b0ef",
    chainId: 1666700000,
    blockExplorer: "https://explorer.pops.one/",
    rpcUrl: `https://api.s0.b.hmny.io`,
    gasPrice: 1000000000,
  },


3. Modify the deploy script to set the contract owner to your account (or your desired owner account)

  00_deploy_your_contract.js
  
  in the above file, below 
    PowDAO = await deploy("PowDAO", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    args: [members],
    log: true,
  });
  
  add the following lines:
  
  const PowDAO2 = await ethers.getContract("PowDAO", deployer);
  await PowDAO2.transferOwnership("<YOURDESIRED DEPLOYER ACCOUNT ADDRESS>");

4. in App.jsx change, update the targetNetwork to the following
  const targetNetwork = NETWORKS.skaleTestNodePortland;  (or whatever name you have given it...)

# 🏛️ Simple DAO Description

> Quickly spin up a DAO smart contract where you choose the initial group of members.

![PowDAO Dashboard](https://scaffold-eth-readme-images.s3.amazonaws.com/Screenshot+2022-02-10+174055.png)

## 📘 DAO Specifics

Quickly initiate a DAO by sending an array of address in the constructor of this contract on deploy. DAO proposals can be created by anyone, but only voted on by members. Members can create proposals to add or kick members. Members cannot withdraw their deposited funds once they are deposited. All deposited funds will be used for the good of the DAO.

Public Goods...
This type of DAO can be used by sports teams to pay for field time, equipment, travel, etc. Another use case is for public contruction or maintenance projects. 
A neighborhood/ town/ governoment can deposit a bunch of funds which can be democratically voted on and invoices can be submitted by the contractors.  

## To Run/Stand up the project
change to project to directory in cmd
    
    yarn install
    
    yarn chain
    
    yarn start
    
    yarn deploy
  
In order to deploy on testnet or main net it will be necessary to run 
    
to generate a mnemonic.txt file
    
    Yarn Generate 

To view the account details   
   
    run Yarn Account 
 
be sure to use the Harmony faucet to fund your testnet/mainnet account so you can deploy, run the contract functions, and manage the DAO.
  

🔏 Edit your smart contract `PowDAO.sol` in `packages/hardhat/contracts`

📝 Edit your frontend `App.jsx` in `packages/react-app/src`

💼 Edit your deployment scripts in `packages/hardhat/deploy`

📱 Open http://localhost:3000 to see the app
