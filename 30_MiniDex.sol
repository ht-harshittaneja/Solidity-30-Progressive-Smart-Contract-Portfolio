// Build a simple exchange for trading tokens. 
// You'll learn how to create a digital marketplace using token swaps and liquidity pools. 
// It's like a mini version of a stock exchange, demonstrating how to create decentralized exchanges.

// # Concepts you will master
// 1. Minimal decentralized exchange
// 2. token swaps
// 3. liquidity pools

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

interface IERC20{
    function transfer(address to, uint256 amount) external returns(bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns(bool);
    function balanceOf(address account) external view returns(uint256);
}

contract MiniDEX{
    IERC20 public tokenA;
    IERC20 public tokenB;
    address public owner;
    uint256 public reserveA;
    uint256 public reserveB;

    constructor(address _tokenA, address _tokenB){
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"NOT OWNER");
        _;
    }

    function addLiquidity(uint256 amountA, uint256 amountB) external{
        require(amountA > 0 && amountB > 0,"INVALID AMOUNT");

        bool s1 = tokenA.transferFrom(msg.sender,address(this),amountA);
        require(s1,"TOKEN A TRANSFER FAILED");

        bool s2 = tokenB.transferFrom(msg.sender,address(this),amountB);
        require(s2,"TOKEN B TRANSFER FAILED");

        reserveA += amountA;
        reserveB += amountB;
    }

    function tokenAToTokenB(uint256 amountA) public view returns(uint256){
        require(reserveA > 0 && reserveB > 0,"NO LIQUIDITY");
        return amountA * reserveB / reserveA;
    }

    function tokenBToTokenA(uint256 amountB) public view returns(uint256){
        require(reserveA > 0 && reserveB > 0,"NO LIQUIDITY");
        return amountB * reserveA / reserveB;
    }

    function swapAForB(uint256 amountA) external{
        require(amountA > 0,"INVALID AMOUNT");

        uint256 amountB = tokenAToTokenB(amountA);

        require(reserveB >= amountB,"INSUFFICIENT LIQUIDITY");

        bool s1 = tokenA.transferFrom(msg.sender,address(this),amountA);
        require(s1,"TOKEN A TRANSFER FAILED");

        bool s2 = tokenB.transfer(msg.sender,amountB);
        require(s2,"TOKEN B TRANSFER FAILED");

        reserveA += amountA;
        reserveB -= amountB;
    }

    function swapBForA(uint256 amountB) external{
        require(amountB > 0,"INVALID AMOUNT");

        uint256 amountA = tokenBToTokenA(amountB);

        require(reserveA >= amountA,"INSUFFICIENT LIQUIDITY");

        bool s1 = tokenB.transferFrom(msg.sender,address(this),amountB);
        require(s1,"TOKEN B TRANSFER FAILED");

        bool s2 = tokenA.transfer(msg.sender,amountA);
        require(s2,"TOKEN A TRANSFER FAILED");

        reserveB += amountB;
        reserveA -= amountA;
    }

    function withdrawLiquidity(uint256 amountA, uint256 amountB) external onlyOwner{
        require(amountA <= reserveA,"INSUFFICIENT TOKEN A");
        require(amountB <= reserveB,"INSUFFICIENT TOKEN B");

        reserveA -= amountA;
        reserveB -= amountB;

        bool s1 = tokenA.transfer(msg.sender,amountA);
        require(s1,"TOKEN A TRANSFER FAILED");

        bool s2 = tokenB.transfer(msg.sender,amountB);
        require(s2,"TOKEN B TRANSFER FAILED");
    }

    function getReserves() external view returns(uint256,uint256){
        return(reserveA,reserveB);
    }
}