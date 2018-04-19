pragma solidity ^0.4.11;

/// @title OneTwoThree with delegation.
contract OneTwoThree {
    // This game is only for two player
    uint public constant MAXPLAYER = 2;
    uint public constant DEFAULTCHOICE = 999;
    // Logging participant
    event logParticipant(address, uint);
    // Logging participant’s choice
    // In reality, we must hide participant’s choice from other participants
    event logParticipantChoice(address, uint);
    // Logging winera
    event logWinning(string, address, uint);
    // Logging draw game
    event logDrawing(string);
    // Participants address and others information
    address[2] participants;
    mapping (address => bool) isChosen;
    //defaut value: 0
    mapping (address => uint) participantChoice;
    // Game owner
    address owner;
    // Start time and end time of the game;
    uint public startTime;
    uint public endTime;
    // Number of current participant
    uint public numOfCurPlayer = 0;
    // Number of player vote
    uint public numOfCurVote = 0;
    // Game rule
    int public winner;
    int[3][3] winnings_table;
    
    function OneTwoThree() public payable {
        owner = msg.sender;
        startTime = now;
        
        // Input: bao -> 1, bua -> 0, keo -> 2
        // Output: draw -> -1, participant 1 win -> 0, participant 2 win -> 1
        winnings_table[0][0] = -1;
        winnings_table[1][1] = -1;
        winnings_table[2][2] = -1;
        
        winnings_table[0][2] = 0;
        winnings_table[2][0] = 1;
        winnings_table[2][1] = 0;
        
        winnings_table[1][2] = 1;
        winnings_table[1][0] = 0;
        winnings_table[0][1] = 1;
    }
    
    // Add player to the game
    function addPlayer() public payable {
        // Check if the game is full of participant or not?
        // One player must deposit to the game only 1 ether.
        if (numOfCurPlayer < MAXPLAYER && msg.value == 1 ether){
            participants[numOfCurPlayer] = msg.sender;
            isChosen[msg.sender] = false;
            
            // defaut choice is 999
            participantChoice[msg.sender] = DEFAULTCHOICE;
            numOfCurPlayer += 1;
            logParticipant(msg.sender, msg.value);
        }
    }
    
    // Participant will choose one value from three option (1,2,3)
    function choice(uint playerChoice) public {
        // if Participant choose a value of out range then throw exception
        require(playerChoice >= 0 && playerChoice <= 2);
        require(numOfCurVote < MAXPLAYER);
        require(isChosen[msg.sender] == false);
        
        isChosen[msg.sender] = true;
        participantChoice[msg.sender] = playerChoice;
        numOfCurVote += 1;
        logParticipantChoice(msg.sender, playerChoice);
    }
    
    modifier ownerOnly {
        require(msg.sender == owner);
        _;
    }
    
    modifier timeUp {
        endTime = now;
        require (endTime > startTime + 1 minutes);
        _;
    }
    
    modifier enoughVote {
        require (numOfCurVote >= MAXPLAYER);
        _;
    }
    
    function gameResult() public payable {
        // Check wether two player have make a choice
        if (numOfCurVote == MAXPLAYER){
            winner = winnings_table[participantChoice[participants[0]]][participantChoice[participants[1]]];
            // Player 1 win
            if (winner == 0){
                participants[0].transfer(1.8 ether);
                owner.transfer(0.2 ether);
                logWinning("The winner is: ",participants[0],participantChoice[participants[0]]);
            }
            // Player 2 win
            else if (winner == 1){
                participants[1].transfer(1.8 ether);
                owner.transfer(0.2 ether);
                logWinning("The winner is: ",participants[1],participantChoice[participants[1]]);
                
            }
            // Draw game because of the same vote.
            else{
                participants[0].transfer(0.9 ether);
                participants[1].transfer(0.9 ether);
                owner.transfer(0.2 ether);
                logDrawing("Draw game");
            }
        }
        // Draw game because of not enough votes.
        else{
            participants[0].transfer(0.9 ether);
            participants[1].transfer(0.9 ether);
            owner.transfer(0.2 ether);
            logDrawing("Draw game");
        }
    }
    
    function whoIsWin() public ownerOnly enoughVote payable {
        gameResult();
    }
    
    function whoIsWinTimeUp() public timeUp payable{
        gameResult();
    }
    
    function() public payable {}
}