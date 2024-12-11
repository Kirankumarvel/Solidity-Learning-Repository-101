
## 📝 **Variable Types [Summary] **

1. **Variable Types**:  
   - **Booleans**: Represent `true` or `false`.
   - **Integers**:  
     - **Signed integers** (`int`) for positive and negative numbers.
     - **Unsigned integers** (`uint`) for positive numbers only.
     - Ranges depend on size (e.g., `uint8` ranges from 0 to 255).
   - **Addresses**: Store Ethereum addresses for interacting with smart contracts or transferring funds.
   - **Strings**: Used to store text data.
   
2. **Default Initialization**:  
   - All variables in Solidity are initialized with default values:
     - **Integer**: `0`
     - **Boolean**: `false`
     - **String**: `""` (empty string)

3. **Public Variables**:  
   - Automatically generate **getter functions**, eliminating the need to write a custom getter.

4. **Fixed-Point Numbers**:  
   - Not implemented in Solidity. Instead, integers are used, and a **decimal point** is inferred manually. This is common in **token contracts** where 18 decimal points are used.

5. **Gas Optimization**:  
   - Due to limited resources, developers must optimize code for **gas efficiency**.

6. **Address Types**:  
   - **Simple `address`**: For holding addresses.
   - **`address payable`**: For sending and receiving Ether.

7. **Reference Types**:  
   - For **strings, arrays, and mappings**, storage location must be specified (`memory`, `storage`, or `calldata`).

---


Here's a table summarizing the **key Solidity variable types** with small examples for each:

| **Type**              | **Description**                                  | **Example**                              | **Default Value**   |
|-----------------------|--------------------------------------------------|------------------------------------------|---------------------|
| **`bool`**            | Boolean type (`true` or `false`).                | `bool isActive = true;`                  | `false`             |
| **`int`**             | Signed integer (positive & negative numbers).    | `int balance = -100;`                    | `0`                 |
| **`uint`**            | Unsigned integer (only positive numbers).        | `uint age = 25;`                         | `0`                 |
| **`uint8` to `uint256`** | Unsigned integers with different bit sizes.   | `uint8 smallNum = 255;`                  | `0`                 |
| **`address`**         | Ethereum address (20 bytes).                     | `address owner = 0x123...789;`           | `0x000...000`       |
| **`address payable`** | Address that can send/receive Ether.             | `address payable wallet;`                | `0x000...000`       |
| **`string`**          | Textual data (dynamic length).                   | `string name = "Alice";`                 | `""` (empty)        |
| **`bytes`**           | Arbitrary-length byte array.                     | `bytes data = "hello";`                  | `0x` (empty)        |
| **`bytes32`**         | Fixed-length byte array (32 bytes).              | `bytes32 id = "abc";`                    | `0x0...0`           |
| **`mapping`**         | Key-value pair storage.                          | `mapping(address => uint) balances;`     | -                   |
| **`enum`**            | Custom set of named constants.                   | `enum Status {Pending, Shipped}`         | First value         |
| **`struct`**          | Custom data type (grouping variables).           | `struct Person {string name; uint age;}` | -                   |
| **`array`**           | Collection of elements.                          | `uint[] numbers = [1, 2, 3];`            | Empty array         |

---

### 🔹 **Detailed Examples**

1. **Boolean Example**  
   ```solidity
   bool isAvailable = false;
   ```

2. **Integer Example**  
   ```solidity
   int temperature = -20;
   ```

3. **Unsigned Integer Example**  
   ```solidity
   uint balance = 1000;
   ```

4. **Address Example**  
   ```solidity
   address owner = 0xAbC123456789DEF0123456789abcdef123456789;
   ```

5. **String Example**  
   ```solidity
   string greeting = "Hello, Solidity!";
   ```

6. **Mapping Example**  
   ```solidity
   mapping(address => uint) public balances;
   ```

7. **Enum Example**  
   ```solidity
   enum State { Active, Inactive, Suspended }
   ```

8. **Struct Example**  
   ```solidity
   struct User {
       string name;
       uint age;
   }
   ```

9. **Array Example**  
   ```solidity
   uint[] scores = [10, 20, 30];
   ```

This table and examples provide a quick reference for Solidity types and their default values.

---


## 🌐 **Real-World Example**: Token Contract

Let’s tie these concepts together with a **simplified ERC-20 token contract**.

### 📄 **Example Solidity Code**

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleToken {
    // State variables
    string public name = "MyToken";           // String type
    string public symbol = "MTK";
    uint8 public decimals = 18;               // 18 decimals (fixed-point simulation)
    uint public totalSupply;                  // Unsigned integer for total supply
    address public owner;                     // Address type

    // Mapping for balances
    mapping(address => uint) public balanceOf; // Mapping to track token balance

    // Constructor to initialize total supply and assign to the owner
    constructor(uint _initialSupply) {
        owner = msg.sender;                // Assign the deployer as the owner
        totalSupply = _initialSupply;      
        balanceOf[owner] = _initialSupply; // Assign all tokens to the deployer
    }

    // Transfer function
    function transfer(address _to, uint _amount) public returns (bool success) {
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance");
        balanceOf[msg.sender] -= _amount;   // Deduct from sender
        balanceOf[_to] += _amount;          // Add to recipient
        return true;
    }
}
```

---

### 🔍 **How This Example Uses the Key Concepts**

1. **Variable Types**:  
   - `string` for the token `name` and `symbol`.  
   - `uint` for `totalSupply` and `balanceOf` mapping.  
   - `address` for `owner` and the `_to` parameter in the `transfer` function.

2. **Default Initialization**:  
   - Variables like `balanceOf` are initialized to `0` by default for all addresses.

3. **Public Variables & Getters**:  
   - `name`, `symbol`, `decimals`, and `totalSupply` are `public`, generating automatic getter functions.

4. **Gas Efficiency**:  
   - The contract is simple and avoids complex logic to save gas.

5. **Fixed-Point Simulation**:  
   - `decimals` set to `18` allows the token to simulate fixed-point arithmetic (e.g., `1 MTK` = `1 * 10^18` smallest units).

6. **Address Usage**:  
   - The `transfer` function allows sending tokens between addresses.

---

### 🚀 **Real-World Scenario**

1. **Deployment**:  
   - Alice deploys the contract with an initial supply of **1,000 tokens** (`1000 * 10^18` to account for 18 decimals).

2. **Transfers**:  
   - Alice transfers **50 tokens** to Bob’s address using the `transfer` function.

3. **Checking Balances**:  
   - Anyone can call `balanceOf` to check the token balances of Alice or Bob.

---

This example demonstrates the essential Solidity concepts covered, giving a practical understanding of how variables and types are used in smart contracts.
