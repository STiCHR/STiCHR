pragma solidity 0.4.24;

contract STiCHR {
	//Nme
    string public name = "STiCHR";
	string public symbol = "STi";
	string public idev = "STiCHR Dev 2018";
	uint256 public totalSupply;
	
	event Transfer(
		address indexed _from,
		address indexed _to,
		uint256 _value
	);

	event Approval( 
		address indexed _owner, 
		address indexed _spender, 
		uint256 _value 
	);

	mapping(address => uint256) public balanceOf;
	mapping(address => mapping(address => uint256)) public allowance;

	constructor (uint256 _initSup) public {
		balanceOf[msg.sender] = _initSup;
		totalSupply = _initSup;
	}
	  // SEND/REC Tokes, EXCEP, EVENT, Bool
	function transfer(address _to, uint256 _value) public returns (bool success) {
		 require(balanceOf[msg.sender] >= _value);
		 balanceOf[msg.sender] -= _value;
		 balanceOf[_to] += _value;
		
		emit Transfer(msg.sender, _to, _value);

		return true;
		    
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
    	allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;

    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;
        
       Transfer(_from, _to, _value);

        return true;
    }
}

