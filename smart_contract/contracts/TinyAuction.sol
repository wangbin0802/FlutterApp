pragma solidity ^0.4.0;

contract TinyAuction {
    address public seller;
    function TinyAuction(){

    }
    modifier onlySeller() {
        require(msg.sender == seller, "Only seller can call this");
    }

    function f() public pure {
        uint[] memory x = new uint[](3);
        x[0] = 1;
        x[1] = 3;
        x[2] = 4;
    }
}

contract Upchain {
    enum State { Created, Locked, InValid}
}

function helper(uint x) pure returns(uint) {
    return x * 2;
}
