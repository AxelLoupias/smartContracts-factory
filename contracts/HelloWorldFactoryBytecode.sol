// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {HelloWorld} from './HelloWorld.sol';
import {Factory} from './Factory.sol';

contract HelloWorldFactoryBytecode is Factory {
    HelloWorld[] public deployedContracts;

    bytes public bytecode;

    function setBytecode(bytes calldata _bytecode) external {
        bytecode = _bytecode;
    }

    function deployNewHelloWorld(string calldata _message) external {
        HelloWorld newContract = HelloWorld(deployContract(bytecode));
        newContract.updateMessage(_message);
        deployedContracts.push(newContract);
    }
}
