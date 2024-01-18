// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;  

contract SimpleStorage {
 

 // This gets initialized to zero
 // <- This means that this section 
    uint256  FavoriteNumber;
    

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 FavoriteNumber;
        string name;
    }

    People[] public people;

    function store(uint256 _favoriteNumber) public {
        FavoriteNumber = _favoriteNumber;
    }

        // Views and pure functions, when called alone, dont spend gas 
        // if a gas calling function calls a view or pure function - only then will it cost gas
        // Views and pure functions disallow modification of state we cant update blockchain with view function
        // pure functions additionally disallow us to read from blockchain state
    function retrieve() public view returns(uint256){
        return FavoriteNumber;
    }


        // calldata, memory, storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

             
}

// 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8