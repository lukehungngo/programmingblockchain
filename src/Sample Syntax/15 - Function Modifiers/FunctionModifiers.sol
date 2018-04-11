pragma solidity 0.4.8; 

/*
* @title An Example for Solidity Course
* @author Toshendra Sharma
* @notice Example for the Solidity Course
*/

contract FunctionModifiers {

	address public creator;
    // Define consutruct here
    function FunctionModifiers() {
       // Initialize state variables here
       creator = msg.sender;
    }

    modifier onlyCreator() {
        if (msg.sender != creator) throw;
        _;
    }

    function kill() onlyCreator { 
    	selfdestruct(creator);
    }

}
pragma solidity ^0.4.18;
contract TestModifier {

    string[] public messages;
    uint256 testVariable;
    event logTest(uint256);
    event logMessage(string[]);
    event logMessage(string);
    function numberOfMessages() constant returns (uint256) {
        return messages.length;
    }

    modifier checkOne {
        messages.push("checkOne - 1");
        if (testVariable == 123) 
            throw;
        logMessage("Run checkOne 1");
        _;
        logMessage("run checkOne 2");
        messages.push("checkOne - 2");
        if (testVariable == 123) 
            throw;
        logMessage("run checkOne 3");
    }

    modifier checkTwo {
        messages.push("checkTwo - 1");
        if (testVariable == 123) 
            throw;
        _;
        messages.push("checkTwo - 2");
        if (testVariable == 123) 
            throw;
    }

    modifier checkThree {
        messages.push("checkThree - 1");
        if (testVariable == 123) 
            throw;
        _;
        messages.push("checkThree - 2");
        if (testVariable == 123) 
            throw;
        _;
        messages.push("checkThree - 3");
        if (testVariable == 123) 
            throw;
    }

    function test() checkOne returns (uint256) {
        logMessage("Run test 1");
        messages.push("test - 1");
        testVariable = 345;
        messages.push("test - 2");
        logMessage("Run test 2");
        return testVariable;
    }
}