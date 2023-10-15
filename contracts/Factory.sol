// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Factory {
    function deployContract(bytes memory bytecode) public returns (address) {
        address deployedContract;
        assembly {
            let len := mload(bytecode)
            let code := add(bytecode, 0x20)

            deployedContract := create(0, code, len)
            if iszero(extcodesize(deployedContract)) {
                revert(0, 0)
            }
        }
        return deployedContract;
    }
}
