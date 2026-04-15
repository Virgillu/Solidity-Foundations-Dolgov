//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract BeginningSolidityTokenManual {
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;
    mapping (address => mapping(address => uint256)) private _allowances;
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    function name() public view returns (string memory) {
        return _name;
    }
    function symbol() public view returns (string memory) {
        return _symbol; 
    }
    function decimals() public view returns (uint8) {
        return _decimals;
    }
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
    function balanceOf(address _owner) public view returns (uint256) {
        return _balances[_owner];
    }
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "ERC20:transfer to the zero address");
        require(_balances[msg.sender] >= _value, "ERC20: transfer amount exceeds balance");
        _balances[msg.sender] -= _value;
        _balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;    
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    require(_from != address(0),"ERC20: transfer from the zero address");
    require(_to != address(0), "ERC20: transfer to the zero address");
    require(_balances[_from] >= _value, "ERC20: transfer amount exceeds balance");
    require(_allowances[_from][msg.sender] >= _value, "ERC20: transfer amount exceeds allowance");
    _balances[_from] -= _value;
    _balances[_to] += _value;
    _allowances[_from][msg.sender] -= _value;
    emit Transfer(_from, _to, _value);
    return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0), "ERC20: approve to the zero address");
        _allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return _allowances[_owner][_spender];
    }


}

