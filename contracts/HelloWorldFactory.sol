// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {HelloWorld} from './HelloWorld.sol';

contract HelloWorldFactory {
    HelloWorld[] public deployedContracts;

    function deployNewHelloWorld(string calldata _message) external {
        HelloWorld newContract = new HelloWorld(_message);
        deployedContracts.push(newContract);
    }
}
