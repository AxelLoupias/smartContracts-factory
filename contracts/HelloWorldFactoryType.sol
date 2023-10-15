// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {HelloWorld} from './HelloWorld.sol';
import {Factory} from './Factory.sol';

contract HelloWorldFactoryType is Factory {
    HelloWorld[] public deployedContracts;

    function deployNewHelloWorld(string calldata _message) external {
        HelloWorld newContract = HelloWorld(
            deployContract(type(HelloWorld).creationCode)
        );
        newContract.updateMessage(_message);
        deployedContracts.push(newContract);
    }
}
