pragma solidity 0.5.16;

contract HelloWorld {
    string public yourName ;
    constructor() public {
        yourName = "Unknown" ;
    }

    function setName(string memory nm) public{
        yourName = nm ;
    }


}