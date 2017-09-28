pragma solidity ^0.4.12;

import "./lib/BurnableToken.sol";
import "./lib/UpgradeableToken.sol";

contract AlfaToken is BurnableToken, UpgradeableToken {

  string public name;
  string public symbol;
  uint public decimals;

  function AlfaToken(address _owner)  UpgradeableToken(_owner) {
    name = "AlfaToken";
    symbol = "ALFA";
    totalSupply = 100000000000000000;
    decimals = 9;

    balances[_owner] = totalSupply;
  }
}