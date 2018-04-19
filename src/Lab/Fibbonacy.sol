pragma solidity ^0.4.18 ;

contract Fibonacci {
	function calculate (uint number) returns (uint result) {
		if(number == 0) return 0;
		else if(number < 2) return 1;
		else return calculate(number - 1) + calculate(number - 2);
	}

    function(){
	    throw;
	}
}