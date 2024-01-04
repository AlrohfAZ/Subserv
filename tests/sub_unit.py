from brownie import network, exceptions
from scripts.helpful_scripts import LOCAL_BLOCKCHAIN_ENVIRONMENTS, get_account
import pytest
from scripts.deploy import supply, sub_one


def test_sub_one():
    if network.show_active() in LOCAL_BLOCKCHAIN_ENVIRONMENTS:
        pytest.skip()
    # Arrange
    account = get_account()
    # Act
    subscript = supply()
    sub_scene = sub_one()
    sub_scene.status = subscript.getStatus()
    # Assert
    assert sub_scene.status == sub_scene
