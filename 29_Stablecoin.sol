// Build a digital currency that maintains a stable value. 
// You'll learn how to keep the price steady using peg mechanisms, demonstrating stablecoin mechanics. 
// It's like a digital dollar, showing how to create stablecoins.

// # Concepts you will master
// 1. Stablecoin implementation
// 2. peg mechanisms
// 3. price stability

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

contract StableCoin{
    string public name = "USD Stable Coin";
    string public symbol = "USDS";
    uint8 public decimals = 18;

    uint256 public totalSupply;
    address public owner;

    // ETH price in USD (18 decimals)
    uint256 public ethPrice = 3000 ether;

    // 150% collateral ratio
    uint256 public collateralRatio = 150;

    mapping(address => uint256) public balanceOf;
    mapping(address => uint256) public collateral;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"NOT OWNER");
        _;
    }

    function depositCollateral() external payable{
        require(msg.value > 0,"INVALID VALUE");

        collateral[msg.sender] += msg.value;
    }

    function mint(uint256 amount) external{
        require(amount > 0,"INVALID AMOUNT");

        require(collateralValue(msg.sender) * 100 >=(balanceOf[msg.sender] + amount) * collateralRatio,
            "INSUFFICIENT COLLATERAL"
        );

        balanceOf[msg.sender] += amount;
        totalSupply += amount;
    }

    function burn(uint256 amount) external {
        require(balanceOf[msg.sender] >= amount,"INSUFFICIENT BALANCE");

        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
    }

    function withdrawCollateral(uint256 amount) external{
        require(collateral[msg.sender] >= amount,"INSUFFICIENT COLLATERAL");

        uint256 remainingCollateral = collateral[msg.sender] - amount;
        uint256 remainingValue = remainingCollateral * ethPrice / 1 ether;

        require(remainingValue * 100 >=balanceOf[msg.sender] * collateralRatio,
            "COLLATERAL RATIO TOO LOW"
        );

        collateral[msg.sender] = remainingCollateral;

        (bool success,) = payable(msg.sender).call{value: amount}("");
        require(success,"TRANSFER FAILED");
    }

    function redeem(uint256 amount) external {
        require(balanceOf[msg.sender] >= amount,"INSUFFICIENT BALANCE");

        uint256 ethAmount = amount * 1 ether / ethPrice;

        require(collateral[msg.sender] >= ethAmount,"INSUFFICIENT COLLATERAL");

        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        collateral[msg.sender] -= ethAmount;

        (bool success,) =
            payable(msg.sender).call{value: ethAmount}("");

        require(success,"TRANSFER FAILED");
    }

    function transfer(address to,uint256 amount) external returns(bool)
    {
        require(balanceOf[msg.sender] >= amount,"INSUFFICIENT BALANCE");

        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;

        return true;
    }

    function updateEthPrice(uint256 price) external onlyOwner {
        require(price > 0,"INVALID PRICE");
        ethPrice = price;
    }

    function updateCollateralRatio(uint256 ratio) external onlyOwner {
        require(ratio >= 100,"INVALID RATIO");
        collateralRatio = ratio;
    }

    function collateralValue(address user) public view returns(uint256){
        return collateral[user] * ethPrice / 1 ether;
    }
}