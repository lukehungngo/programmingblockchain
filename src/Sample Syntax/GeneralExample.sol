pragma solidity 0.4.8; 

contract owned {
    function owned() { owner = msg.sender; }
    address owner;
}

contract mortal is owned{

	function kill(){
		selfdestruct(owner);
	}

}

contract User is owned, mortal{
	string public UserName;
	function User(string _name){
		UserName = _name;
	}
}




