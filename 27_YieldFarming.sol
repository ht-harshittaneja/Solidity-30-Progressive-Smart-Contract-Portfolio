// Build a system for earning rewards by staking tokens. 
// You'll learn how to distribute rewards, demonstrating yield farming. 
// It's like a digital savings account with interest, showing how to create yield farming platforms.

// # Concepts you will master
// 1. Yield farming
// 2. staking
// 3. reward distribution

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

interface IERC20{
    function transfer(address to, uint256 amount) external returns(bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns(bool);
    function balanceOf(address account) external view returns(uint256);
}

contract YieldFarming{

    IERC20 public stakeToken;
    IERC20 public rewardToken;

    address public owner;

    uint256 public rewardRate = 20; // 20% per year
    uint256 public totalStaked;

    struct User{
        uint256 amount;
        uint256 reward;
        uint256 stakeTime;
    }

    mapping(address => User) public stakers;

    constructor(address _stakeToken, address _rewardToken){
        stakeToken = IERC20(_stakeToken);
        rewardToken = IERC20(_rewardToken);
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"NOT OWNER");
        _;
    }

    function stake(uint256 amount) external{
        require(amount > 0,"INVALID AMOUNT");

        User storage user = stakers[msg.sender];

        if(user.amount > 0){
            user.reward = calculateReward(msg.sender);
        }

        bool success = stakeToken.transferFrom(msg.sender, address(this), amount);
        require(success,"TRANSFER FAILED");

        user.amount += amount;
        user.stakeTime = block.timestamp;
        totalStaked += amount;
    }

    function calculateReward(address account) public view returns(uint256){
        User memory user = stakers[account];

        if(user.amount == 0){
            return user.reward;
        }

        uint256 duration = block.timestamp - user.stakeTime;
        uint256 earned =user.amount *rewardRate *duration /(100 * 365 days);
        return earned + user.reward;
    }

    function claimReward() external{
        User storage user = stakers[msg.sender];

        uint256 earned = calculateReward(msg.sender);

        require(earned > 0,"NO REWARD");

        user.reward = 0;
        user.stakeTime = block.timestamp;

        bool success = rewardToken.transfer(msg.sender, earned);
        require(success,"TRANSFER FAILED");
    }

    function unstake() external {
        User storage user = stakers[msg.sender];

        require(user.amount > 0,"NOT STAKED");

        uint256 amount = user.amount;
        uint256 earned = calculateReward(msg.sender);
        totalStaked -= amount;

        delete stakers[msg.sender];

        bool s1 = stakeToken.transfer(msg.sender, amount);
        require(s1,"STAKE TRANSFER FAILED");

        bool s2 = rewardToken.transfer(msg.sender, earned);
        require(s2,"REWARD TRANSFER FAILED");
    }

    function withdrawReward() external {
        User storage user = stakers[msg.sender];
        
        uint256 earned = calculateReward(msg.sender);

        require(earned > 0, "NO REWARD");

        user.reward = 0;
        user.stakeTime = block.timestamp;

        bool success = rewardToken.transfer(msg.sender, earned);
        require(success, "REWARD TRANSFER FAILED");
    }
    
    function setRewardRate(uint256 rate) external onlyOwner{
        rewardRate = rate;
    }
}