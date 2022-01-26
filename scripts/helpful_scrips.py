from brownie import accounts, network, config, MockV3Aggregator
from web3 import Web3

FORKED_LOCAL_ENVIRONMENTS = ["mainnet-fork", "mainnet-fork-dev"]
LOCAL_BLOCKCHAIN_ENVIRONMENTS = ["development", "ganache-local"]
# getPrice() function in FundMe.sol has "return uint256(answer * 10 ** 10);"
DECIMALS = 8
STARTING_PRICE = 2000 * 10 ** 8


def get_account():
    if (
        network.show_active() in LOCAL_BLOCKCHAIN_ENVIRONMENTS
        or network.show_active() in FORKED_LOCAL_ENVIRONMENTS
    ):
        print("Get brownie's simulate account :)")
        return accounts[0]
    else:
        print("Get MetaMask wallet account :)")
        return accounts.add(config["wallets"]["from_key"])


def deploy_mocks():
    print("Deploying Mocks...")
    if len(MockV3Aggregator) <= 0:
        print("Mocks price fedd contract are going to deploy...")
        MockV3Aggregator.deploy(DECIMALS, STARTING_PRICE, {"from": get_account()})
        print("Mocks price feed contract deployed!")
