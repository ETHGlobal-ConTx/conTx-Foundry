// SPDX-License Identifier: MIT
pragma solidity ^0.8.19;

import { SchemaResolver } from "../eas-contracts/resolver/SchemaResolver.sol";
import { IEAS, Attestation } from "../eas-contracts/IEAS.sol";
import '@openzeppelin/contracts/access/Ownable.sol';

contract AttesterResolver is SchemaResolver, Ownable {
        // sample data from attester resolver 
    address private _targetAttester;


    constructor(IEAS eas, address targetAttester) SchemaResolver(eas) {
        _targetAttester = targetAttester;
    }

    function onAttest(Attestation calldata attestation, uint256 /*value*/) internal view override returns (bool) {
        return attestation.attester == _targetAttester;
    }

    function onRevoke(Attestation calldata /*attestation*/, uint256 /*value*/) internal pure override returns (bool) {
        return true;
    }
    
    function setTargetAttester (address targetAttester) public onlyOwner {
        _targetAttester = targetAttester;
    }
}
