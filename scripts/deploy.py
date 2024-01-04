from brownie import Subserv, config, accounts, network
from scripts.helpful_scripts import get_account, get_contract
from web3 import Web3


def supply():
    account = get_account()
    subscript = Subserv.deploy(
        {"from": account},
        publish_source=config["networks"][network.show_active()]["verify"],
    )
    return subscript


def sub_one():
    account = get_account()
    subscript = Subserv[-1]
    tx = subscript.oneSub({"from": account})
    tx.wait(1)
    txn = subscript.getStatus({"from": account})
    print(f"The subscription is {txn}")
    return txn

def unsub():
    account = get_account()
    subscript = Subserv[-1]
    txn = subscript.unsubscribe({"from": account})
    txn.wait(1)
    txn2 = subscript.getStatus({"from": account})
    print(f"The subscription is {txn2}")
    return txn2


def main():
    supply()
    sub_one()
    unsub()

