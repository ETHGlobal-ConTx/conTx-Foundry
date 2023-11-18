// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "../src/Counter.sol";
import '../../eas-contracts/SchemaRegistry.sol';
import '../../eas-contracts/resolver/ISchemaResolver.sol';
import '../src/UmaResolver.sol';



contract TestResolver {

    function setUp() public {
        uint256 baseGoerli = createFork('https://base-goerli.publicnode.com');
        SchemaRegistry schemaRegistry = SchemaRegistry(0x4200000000000000000000000000000000000020);
        string calldata schemaData = "string Name, address Sender, string Ipfs";
        UmaResolver umaResolver = new UmaResolver();
        ISchemaResolver umaResolverInterface = ISchemaResolver(address(umaResolver));

       bytes32 schemaId = schemaRegistry.register(schemaData, umaResolverInterface, true);
        console.log(schemaId);
    }

}

