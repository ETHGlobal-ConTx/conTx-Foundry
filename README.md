# AttesterResolver

This repository contains the `AttesterResolver` contract written in Solidity. It is a small Resolver contract that will works with EAS https://attest.sh/

## Contract Overview

The `AttesterResolver` contract extends the `SchemaResolver` and `Ownable` contracts. The main function of it is to allow only our specific key to make attestations using our schema

## Key Features

- **Target Attester**: The contract is initialized with a target attester's address. All attestations from this address are processed by the contract.

- **Attestation Handling**: The contract overrides the `onAttest` function from the `SchemaResolver` contract. It checks if the attester of an incoming attestation is the target attester.

- **Revocation Handling**: The contract also overrides the `onRevoke` function from the `SchemaResolver` contract. It currently allows all revocations.

- **Attester Updating**: The contract owner can update the target attester's address using the `setTargetAttester` function.

## Deployments
You can find the resolver deployed on these three contracts:

Scroll Sepolia: https://sepolia.scrollscan.dev/address/0x00c88e19be209438a30d56bd945766efc1dcf43e

Base Goerli: https://goerli.basescan.org/address/0xc400c8adf58ccecf226681f6cc18cc5dd20d0a32

Arbitrum Goerli: https://goerli.arbiscan.io/address/0x3a713ebf897324cd41cf7096df57117f90c48a08

Linea Goerli: https://goerli.lineascan.build/address/0x2c320e8b6254e6ad650a4ec469a030931195bf8b

## Contributions

Contributions are welcome. Please open a pull request or issue on the GitHub repository.

## Disclaimer

This contract has not been audited. Use at your own risk.