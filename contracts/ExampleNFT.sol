// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract ExampleNFT is ERC1155, Ownable { //0x1CAe00F6B983966F610f7a5f1FE2027E8642C3c5

    
    uint256 public supplyOne = 10;
    uint256 public supplyTwo = 10;
    uint256 public supplyThree = 10;
    uint256 public supplyFour = 10;
    uint256 public mintedOne;
    uint256 public mintedTwo;
    uint256 public mintedThree;
    uint256 public mintedFour;
    uint256 public mintPrice;
    address payable public withdrawWallet;
    bool public isPublicMintEnabled;
    uint256 public maxPerTokenId = 1;
    uint256 public maxMint = 1;

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

    //set supplyOne
    function setsupplyOne(uint256 _supplyOne) external onlyOwner {
        supplyOne = _supplyOne;
    }

    //set supplyTwo
    function setsupplyTwo(uint256 _supplyTwo) external onlyOwner {
        supplyTwo = _supplyTwo;
    }

    //set supplyThree
    function setsupplyThree(uint256 _supplyThree) external onlyOwner {
        supplyThree = _supplyThree;
    }

    //set supplyFour
    function setsupplyFour(uint256 _supplyFour) external onlyOwner {
        supplyFour = _supplyFour;
    }
    //set mintPrice
    function setMintPrice(uint256 _mintPrice) external onlyOwner {
        mintPrice = _mintPrice;
    }

    //set maxPerTokenId
    function setMaxPerTokenId(uint256 _maxPerTokenId) external onlyOwner {
        maxPerTokenId = _maxPerTokenId;
    }

    //set maxMint
    function setMaxMint(uint256 _maxMint) external onlyOwner {
        maxMint = _maxMint;
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

    //clean up code to avoid duplications
    function mint(uint256 _id, uint256 _amount) internal {
        require(isPublicMintEnabled, "Minting is not live");
        require(msg.value == mintPrice * _amount, "Insufficient funds");
        require(_amount <= maxPerTokenId, "Exceed max mint");
        _mint(msg.sender, _id, _amount, '');
    }

    //mintOne
    function mintOne(uint256 _amount) external payable {

        uint256 _id = 1;

        require(mintedOne + _amount <= supplyOne, "Not enough supplies");
        require(walletMintOne[msg.sender] < maxMint,"Already minted");

        mint(_id, _amount);
        
        walletMintOne[msg.sender] ++;   
        mintedOne += _amount;
    }

    //mintTwo
    function mintTwo(uint256 _amount) external payable {

        uint256 _id = 2;

        require(mintedTwo + _amount <= supplyTwo, "Not enough supplies");
        require(walletMintTwo[msg.sender] < maxMint,"Already minted");

        mint(_id, _amount);
        
        walletMintTwo[msg.sender] ++;   
        mintedTwo += _amount;
    }

    //mintThree
    function mintThree(uint256 _amount) external payable {

        uint256 _id = 3;

        require(mintedThree + _amount <= supplyThree, "Not enough supplies");
        require(walletMintThree[msg.sender] < maxMint,"Already minted");

        mint(_id, _amount);
        
        walletMintThree[msg.sender] ++;   
        mintedThree += _amount;
    }

    //mintFour
    function mintFour(uint256 _amount) external payable {

        uint256 _id = 4;

        require(mintedFour + _amount <= supplyFour, "Not enough supplies");
        require(walletMintFour[msg.sender] < maxMint,"Already minted");

        mint(_id, _amount);
        
        walletMintFour[msg.sender] ++;   
        mintedFour += _amount;
    }


}

//thoughts if there are four mints - after minting one they should be able to mint the other 3
// 4 separate mints batch mint?
