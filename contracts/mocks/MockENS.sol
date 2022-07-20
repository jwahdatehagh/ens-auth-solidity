// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * Mock ENS Registry
 */
contract MockRegistry {
    mapping(bytes32 => address) private _resolvers;

    function setResolver(bytes32 node, address resolver_) external {
        _resolvers[node] = resolver_;
    }

    function resolver(bytes32 node) external view returns (address) {
        return _resolvers[node];
    }
}

/**
 * Mock ENS Resolver
 */
contract MockResolver {
    mapping(bytes32 => address) private _addrs;
    mapping(bytes32 => string) private _names;
    mapping(bytes32 => mapping(string => string)) private _texts;

    function setAddr(bytes32 node, address addr_) external {
        _addrs[node] = addr_;
    }

    function setName(bytes32 node, string calldata name_) external {
        _names[node] = name_;
    }

    function setText(
        bytes32 node,
        string calldata key,
        string calldata value
    ) external {
        _texts[node][key] = value;
    }

    function addr(bytes32 node) external view returns (address) {
        return _addrs[node];
    }

    function name(bytes32 node) external view returns (string memory) {
        return _names[node];
    }

    function text(bytes32 node, string calldata key) external view returns (string memory) {
        return _texts[node][key];
    }
}
