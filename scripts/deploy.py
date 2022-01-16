from brownie import FundMe, MockV3Aggregator, network, config
from scripts.helpful_scrips import get_account, deploy_mocks


def deploy_fund_me():
    print("Deploying FundMe...")
    account = get_account()
    print(f"The active network is {network.show_active()}")

    # if we are on a persistent network like rinkeby, use the associated address
    # otherwise, deploy mocks
    if network.show_active() != "development":
        price_feed_address = config["networks"][network.show_active()][
            "eth_usd_price_feed"
        ]
    else:
        deploy_mocks()
        price_feed_address = MockV3Aggregator[-1].address

    # pass the price feed address to our fundme contract from first param to contract constructor
    fund_me = FundMe.deploy(
        price_feed_address,
        {"from": account},
        publish_source=config["networks"][network.show_active()].get("verify"),
    )
    print(f"Contract deployed to {fund_me.address}")


def main():
    print("Running main()...")
    deploy_fund_me()
