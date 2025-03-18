pragma solidity ^0.8.19;

contract SoliditySoccer {
    struct Player {
        string name;
        uint256 attack;
        uint256 defense;
    }
    
    struct Team {
        string name;
        address owner;
        Player[3] players;
    }
    
    mapping(address => Team) public teams;
    address[] public teamOwners;
    
    function createTeam(string memory _name, string[3] memory _playerNames) public {
        require(teams[msg.sender].owner == address(0), "Team already exists");
        
        teams[msg.sender] = Team({
            name: _name,
            owner: msg.sender,
            players: [
                Player(_playerNames[0], _randomStat(), _randomStat()),
                Player(_playerNames[1], _randomStat(), _randomStat()),
                Player(_playerNames[2], _randomStat(), _randomStat())
            ]
        });
        teamOwners.push(msg.sender);
    }
    
    function playMatch(address opponent) public view returns (string memory) {
        require(teams[msg.sender].owner != address(0), "You must have a team");
        require(teams[opponent].owner != address(0), "Opponent must have a team");
        
        uint256 myScore = _calculateScore(teams[msg.sender]);
        uint256 opponentScore = _calculateScore(teams[opponent]);
        
        if (myScore > opponentScore) return "You win!";
        if (myScore < opponentScore) return "You lose!";
        return "It's a draw!";
    }
    
    function _calculateScore(Team memory team) internal pure returns (uint256) {
        uint256 score;
        for (uint256 i = 0; i < team.players.length; i++) {
            score += team.players[i].attack + team.players[i].defense;
        }
        return score;
    }
    
    function _randomStat() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 100;
    }
}
