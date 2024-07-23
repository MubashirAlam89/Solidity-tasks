// Task 16: Mapping with Structs for Product Inventory

// Question: Write a contract that keeps track of a product inventory using structs and mappings. Each product should have an ID, name, and quantity.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductInventory {
    struct Product {
        uint256 id;
        string name;
        uint256 quantity;
    }

    mapping(uint256 => Product) public products;
    uint256 public nextProductId;

    function addProduct(string memory _name, uint256 _quantity) public {
        products[nextProductId] = Product(nextProductId, _name, _quantity);
        nextProductId++;
    }

    function updateQuantity(uint256 _id, uint256 _quantity) public {
        require(products[_id].id == _id, "Product not found");
        products[_id].quantity = _quantity;
    }

    function getProduct(uint256 _id) public view returns (string memory, uint256) {
        require(products[_id].id == _id, "Product not found");
        Product memory product = products[_id];
        return (product.name, product.quantity);
    }
}
