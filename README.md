# Solidity Soccer ⚽

Solidity Soccer is an on-chain football (soccer) game built with Solidity, allowing players to create teams, train players, and compete in simulated matches using smart contracts. The game ensures fairness and transparency through blockchain technology.

## Features 🚀
- **Team Creation**: Players can form their own teams with custom names.
- **Player Attributes**: Each player has randomized attack and defense stats.
- **Match Simulation**: Compete against other teams based on total team stats. 
- **Decentralized & Transparent**: The game logic is executed on-chain for fairness.  

## How It Works 🏆
1. **Create a Team**: Call `createTeam()` with a team name and three player names.
2. **Randomized Player Stats**: Each player gets attack and defense stats between 0-99.
3. **Play Matches**: Use `playMatch(opponentAddress)` to challenge another team.
4. **Win or Lose**: The team with the highest combined stats wins the match.  

## Smart Contract 📜 
The game is powered by a Solidity smart contract that handles:  
- Team management
- Randomized player stats 
- Match results based on team strength 

## Example Usage 🛠️
```solidity
// Create a team
createTeam("Blockchain FC", ["Alice", "Bob", "Charlie"]);

// Play a match
string memory result = playMatch(opponentAddress);
```

## Future Improvements 🔥
- **Token Rewards** for match winners 🎁
- **Player Training** to upgrade stats 📈
- **League System** with rankings 🏅
- **NFT Player Cards** for trading 🔄

## License 📝
This project is open-source under the MIT License.
