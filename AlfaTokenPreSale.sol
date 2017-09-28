pragma solidity ^0.4.11;

import "./AlfaToken.sol";

contract AlfaTokenPreSale {
    AlfaToken public token;
    address public beneficiary;
    address public cobeneficiary;
    uint public amountRaised;
    uint public bonus;

    uint constant public price = 2000000;
    uint constant public minSaleAmount = 50000000000;

    function AlfaTokenPreSale(
        AlfaToken _token,
        address _beneficiary,
        address _cobeneficiary,
        uint _bonus
    ) {
        token = AlfaToken(_token);
        beneficiary = _beneficiary;
        cobeneficiary = _cobeneficiary;
        bonus = _bonus;
    }

    function () payable {
        uint amount = msg.value;
        uint tokenAmount = amount / price;
        if (tokenAmount < minSaleAmount) throw;
        amountRaised += amount;
        token.transfer(msg.sender, tokenAmount * (100 + bonus) / 100);
    }

    function WithdrawETH(uint _amount) {
        require(msg.sender == beneficiary || msg.sender == cobeneficiary);
        msg.sender.transfer(_amount);
    }

    function WithdrawTokens(uint _amount) {
        require(msg.sender == beneficiary || msg.sender == cobeneficiary);
        token.transfer(beneficiary, _amount);
    }

    function TransferTokens(address _to, uint _amount) {
        require(msg.sender == beneficiary || msg.sender == cobeneficiary);
        token.transfer(_to, _amount);
    }

    function ChangeBonus(uint _bonus) {
        require(msg.sender == beneficiary || msg.sender == cobeneficiary);
        bonus = _bonus;
    }
}