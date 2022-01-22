from brownie import FundMe
from scripts.helpful_scrips import get_account


def fund():
    fund_me = FundMe[-1]
    account = get_account()
    entrance_fee = fund_me.getEntranceFee()
    print(f"The current entry fee is {entrance_fee} Wei.")
    print("Funding...")
    fund_me.fund({"from": account, "value": entrance_fee})


def withdraw():
    fund_me = FundMe[-1]
    account = get_account()
    print("Withdrawing...")
    fund_me.withdraw({"from": account})


def main():
    fund()
    withdraw()
