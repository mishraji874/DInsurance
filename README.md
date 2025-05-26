# DInsurance: Decentralized Insurance Protocol

DInsurance is a decentralized insurance protocol built on blockchain technology that enables the creation and management of customizable insurance pools. It provides a transparent, secure, and efficient platform for creating and participating in insurance contracts without traditional intermediaries.

## Key Features

- **Decentralized Insurance Pools**: Create and manage insurance pools with customizable parameters
- **Condition-Based Claims**: Automated claim processing based on predefined conditions and oracle data
- **Dual Token System**: Separate tokens for insurance buyers and sellers to manage positions
- **Flexible Risk Management**: Configurable multipliers and maturity periods for different insurance products
- **Oracle Integration**: Support for external data providers to validate insurance conditions

## Architecture

### Core Components

1. **AzuranceFactory**
   - Factory contract for deploying new insurance pools
   - Manages the creation and registration of insurance contracts
   - Emits events for insurance pool creation

2. **AzurancePool**
   - Core insurance pool implementation
   - Handles deposits, withdrawals, and claim settlements
   - Manages buyer and seller token minting/burning
   - Implements condition-based claim verification
   - Supports multiple states: Ongoing, Claimable, Matured, and Terminated

3. **Conditions and Data Providers**
   - Modular condition system for claim verification
   - Integration with external data providers
   - Support for various types of insurance conditions

### Token System
- **Buyer Tokens**: Represent insurance coverage positions
- **Seller Tokens**: Represent insurance underwriting positions
- Both token types are ERC20-compliant and managed by the pool contract

## Technical Stack

- **Solidity Version**: 0.8.20
- **Development Framework**: [Foundry](https://book.getfoundry.sh/) - a blazing fast, portable and modular toolkit for Ethereum application development written in Rust
  - **Forge**: Ethereum testing framework for writing and running tests
  - **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data
  - **Anvil**: Local Ethereum node for development and testing
  - **Chisel**: Fast, utilitarian, and verbose Solidity REPL
- **Smart Contract Standards**: OpenZeppelin contracts
- **Testing Framework**: Foundry's built-in testing suite

## Project Structure

```
├── src/
│   ├── AzuranceFactory.sol    # Factory contract for insurance pools
│   ├── AzurancePool.sol       # Core insurance pool implementation
│   ├── MintableERC20.sol      # Custom ERC20 token implementation
│   ├── conditions/            # Insurance condition implementations
│   ├── dataProviders/         # Oracle and data provider integrations
│   └── interfaces/            # Contract interfaces
├── test/
│   ├── AzuranceFactory.t.sol  # Factory contract tests
│   ├── AzurancePool.t.sol     # Pool contract tests
│   └── contracts/             # Test helper contracts
└── script/                    # Deployment and setup scripts
```

## Prerequisites

- [Foundry](https://getfoundry.sh/)
- Git
- A compatible Ethereum wallet

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/mishraji874/DInsurance-Decentralized-Insurance-Protocol.git
   cd DInsurance-Decentralized-Insurance-Protocol
   ```

2. Install dependencies:
   ```bash
   forge install
   ```

3. Copy the example environment file:
   ```bash
   cp .env.example .env
   ```

4. Configure your environment variables in `.env`

## Building and Testing

To build the project:
```bash
forge build
```

To run tests:
```bash
forge test
```

To generate test coverage:
```bash
forge coverage
```

Additional Foundry commands:

```bash
# Format Solidity code
forge fmt

# Generate gas snapshots
forge snapshot

# Start local Ethereum node
anvil

# Deploy contracts
forge script script/YourScript.s.sol:YourScript --rpc-url <your_rpc_url> --private-key <your_private_key>

# Use Cast for blockchain interactions
cast <subcommand>

# Get help for any command
forge --help
anvil --help
cast --help
```

## Development Workflow

1. Create a new branch for your feature:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes following the [Solidity style guide](https://docs.soliditylang.org/en/v0.8.20/style-guide.html)

3. Run tests and ensure they pass:
   ```bash
   forge test
   ```

4. Push your changes and create a pull request

## Contributing

1. Fork the repository
2. Create a new feature branch
3. Commit your changes
4. Push to your fork
5. Submit a pull request

Please ensure your PR:
- Includes appropriate tests
- Updates documentation as needed
- Follows the established code style
- Includes a clear description of the changes

## Issue Reporting

For bug reports or feature requests:
1. Check existing issues
2. Use the issue template if provided
3. Include a clear description and steps to reproduce for bugs
4. Tag issues appropriately

## License

MIT License
