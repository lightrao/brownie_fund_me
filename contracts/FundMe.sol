// SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

// interface AggregatorV3Interface {
//     function decimals() external view returns (uint8);

//     function description() external view returns (string memory);

//     function version() external view returns (uint256);

//     // getRoundData and latestRoundData should both raise "No data present"
//     // if they do not have data to report, instead of returning unset values
//     // which could be misinterpreted as actual reported values.
//     function getRoundData(uint80 _roundId)
//         external
//         view
//         returns (
//             uint80 roundId,
//             int256 answer,
//             uint256 startedAt,
//             uint256 updatedAt,
//             uint80 answeredInRound
//         );

//     function latestRoundData()
//         external
//         view
//         returns (
//             uint80 roundId,
//             int256 answer,
//             uint256 startedAt,
//             uint256 updatedAt,
//             uint80 answeredInRound
//         );
// }

contract FundMe {
    using SafeMathChainlink for uint256;

    mapping(address => uint256) public addressToAmountFunded; // 储户地址=>存钱数量
    address[] public funders; // 储户地址数组
    address public owner; // 合同拥有者地址
    AggregatorV3Interface public priceFeed;

    constructor(address _priceFeed) public {
        priceFeed = AggregatorV3Interface(_priceFeed);
        owner = msg.sender;
    }

    function fund() public payable {
        // fund me at least $50, everything has eighteen decimals
        uint256 minimumUSD = 50 * 10**18;
        require(
            getConversionRate(msg.value) >= minimumUSD,
            "You need to spend at least $50 worth of ETH!"
        );

        addressToAmountFunded[msg.sender] += msg.value; // msg.value小数点左移18位得到eth数量，msg.value以Wei为单位
        // what the ETH -> USD conversion rate

        funders.push(msg.sender);
    }

    function getVersion() public view returns (uint256) {
        // AggregatorV3Interface priceFeed = AggregatorV3Interface(
        //     0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        // );
        return priceFeed.version();
    }

    // 返回结果小数点左移18位得到eth价格
    function getPrice() public view returns (uint256) {
        // AggregatorV3Interface priceFeed = AggregatorV3Interface(
        //     0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        // );
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        return uint256(answer * 10**10); // Include eighteen decimals: 4160.387231600000000000
    }

    // ethAmount in Wei: Gwei = 1000000000 Wei
    // 输入eth数量，返回eth价格，以美元计价
    function getConversionRate(uint256 ethAmount)
        public
        view
        returns (uint256)
    {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 10**18;
        return ethAmountInUsd; // Include eighteen decimals: 0.000004160387231600
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Want to wtihdraw balance? You should be the owner of this conctract!"
        );
        _;
    }

    // https://youtu.be/M576WGiDBdQ?t=11308
    function withdraw() public payable onlyOwner {
        msg.sender.transfer(address(this).balance);

        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);
    }

    // resetting: https://youtu.be/M576WGiDBdQ?t=11883
}
