// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import 'forge-std/console.sol';
import 'forge-std/Script.sol';
import '../../eas-contracts/SchemaRegistry.sol';
import '../../eas-contracts/resolver/ISchemaResolver.sol';
import { IEAS, Attestation } from "../../eas-contracts/IEAS.sol";
import '../src/AttesterResolver.sol';


contract deployResolver is Script {
    address public baseGoerliEas = 0x4200000000000000000000000000000000000021;
    address public arbiGoerliEas = 0xaEF4103A04090071165F78D45D83A0C0782c2B2a;
    address public lineaGoerliEas = 0xaEF4103A04090071165F78D45D83A0C0782c2B2a;
    address public attesterAddress = 0xAC4cda272DEF2019e36CB227D506b5969aA3b248;


    function run() public {
        uint256 deployerPrivateKey = vm.envUint('PRIVATE_KEY');
        vm.startBroadcast(deployerPrivateKey);
        IEAS eas = IEAS(lineaGoerliEas);
        AttesterResolver attesterResolver = new AttesterResolver(eas, attesterAddress);

        console.log('attesterResolver address: ', address(attesterResolver));
    }
}