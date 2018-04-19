pragma solidity ^0.4.18;

contract MappingAndStruct{
	struct Instructor{
		uint age;
		string firstName;
		string lastName;
	}

	mapping(address => Instructor) instructors;
	address[] public instructorAccts;

	function setInstructor(address _address, uint _age, string _firstName, string _lastName) public {
		var instructor = instructors[_address];

		instructor.age = _age;
		instructor.firstName = _firstName;
		instructor.lastName = _lastName;

		instructorAccts.push(_address) -1;
	}

	function getInstructors() view public returns(address[]) {
		return instructorAccts;
	}

	function getInstructor(address _address) view public returns (uint, string, string){
		return (instructors[_address].age, instructors[_address].firstName, instructors[_address].lastName);
	}

	function countInstructors() view public returns(uint){
		return instructorAccts.length;
	}
}
