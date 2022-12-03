// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract ExampleNFT is ERC1155, Ownable { //0x28550209Fe15890cB18A8Ac341a8A33b6D18A2B2 contract on testnet

    uint256 [] public supplies = [10, 10, 10, 10];
    uint256 [] public minted = [0, 0, 0, 0];
    uint256 public mintPrice;
    address payable public withdrawWallet;
    bool public isPublicMintEnabled;

    mapping(address => uint256) public walletMintOne;
    mapping(address => uint256) public walletMintTwo;
    mapping(address => uint256) public walletMintThree;
    mapping(address => uint256) public walletMintFour;

    
    constructor() ERC1155("https://ipfs.io/ipfs/QmS4zRSb9Pe2HhvAnNQfndmd2i8PbmgNnF8FKyKk7ML4XU/{id}.json") {}

    //set ipfs uri
    function setURI(string memory newuri) external onlyOwner {
        _setURI(newuri);
    }

    //override ipfs uri to add tokenId
    function uri(uint256 _tokenId) override public pure returns (string memory) {
        return string(
            abi.encodePacked(
                "https://ipfs.io/ipfs/QmS4zRSb9Pe2HhvAnNQfndmd2i8PbmgNnF8FKyKk7ML4XU/",
                Strings.toString(_tokenId),
                ".json"
            )
        );
    }

    //set public mint live
    function setIsPublicMintEnabled(bool _isPublicMintEnabled) external onlyOwner {
        isPublicMintEnabled = _isPublicMintEnabled;
    }

    //set mintPrice
    function setMintPrice(uint256 _mintPrice) external onlyOwner {
        mintPrice = _mintPrice;
    }

    //set withdraw wallet
    function setWithdrawWallet(address payable _withdrawWallet) external onlyOwner {
        withdrawWallet = _withdrawWallet;
    }

    //withdraw funds
    function withdraw() external onlyOwner {
        (bool success, ) = withdrawWallet.call{value: address(this).balance }('');
        require(success, 'withdraw failed');
    }

    //mint
    function mintOne() external payable {
        uint256 id = 1;
        uint256 amount = 1;
        require(isPublicMintEnabled, "Minting is not live");
        require(id <= supplies.length, "Token does not exist");
        require(id > 0, "Token does not exist");
       
        uint256 index = id - 1;
        require(minted[index] + amount <= supplies[index], "Not enough supplies");
        require(msg.value == mintPrice * amount, "Insufficient funds");
        require(walletMintOne[msg.sender] < 1,"Already minted");

        _mint(msg.sender, id, amount, '');
       
        walletMintOne[msg.sender] ++;
        minted[index] += amount;
    }

        function mintTwo() external payable {

        uint256 id = 2;
        uint256 amount = 1;
        
        require(isPublicMintEnabled, "Minting is not live");
        require(id <= supplies.length, "Token does not exist");
        require(id > 0, "Token does not exist");
       
        uint256 index = id - 1;
        require(minted[index] + amount <= supplies[index], "Not enough supplies");
        require(msg.value == mintPrice * amount, "Insufficient funds");
        require(walletMintTwo[msg.sender] < 1,"Already minted");

        _mint(msg.sender, id, amount, '');
       
        walletMintTwo[msg.sender] ++;
        minted[index] += amount;
    }

        function mintThree() external payable {
       
        uint256 id = 3;
        uint256 amount = 1;
       
        require(isPublicMintEnabled, "Minting is not live");
        require(id <= supplies.length, "Token does not exist");
        require(id > 0, "Token does not exist");
       
        uint256 index = id - 1;
        require(minted[index] + amount <= supplies[index], "Not enough supplies");
        require(msg.value == mintPrice * amount, "Insufficient funds");
        require(walletMintThree[msg.sender] < 1,"Already minted");

        _mint(msg.sender, id, amount, '');
       
        walletMintThree[msg.sender] ++;
        minted[index] += amount;
    }

        function mintFour() external payable {
        
        uint256 id = 4;
        uint256 amount = 1;
        
        require(isPublicMintEnabled, "Minting is not live");
        require(id <= supplies.length, "Token does not exist");
        require(id > 0, "Token does not exist");
       
        uint256 index = id - 1;
        require(minted[index] + amount <= supplies[index], "Not enough supplies");
        require(msg.value == mintPrice * amount, "Insufficient funds");
        require(walletMintFour[msg.sender] < 1,"Already minted");

        _mint(msg.sender, id, amount, '');
        walletMintFour[msg.sender] ++;
    
        minted[index] += amount;
    }
}

//thoughts if there are four mints - after minting one they should be able to mint the other 3
// 4 separate mints batch mint?
