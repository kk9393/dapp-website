pragma solidity ^0.4.20;


/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address public owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );


    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() public {
        owner = msg.sender;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param _newOwner The address to transfer ownership to.
     */
    function transferOwnership(address _newOwner) public onlyOwner {
        _transferOwnership(_newOwner);
    }

    /**
     * @dev Transfers control of the contract to a newOwner.
     * @param _newOwner The address to transfer ownership to.
     */
    function _transferOwnership(address _newOwner) internal {
        require(_newOwner != address(0));
        emit OwnershipTransferred(owner, _newOwner);
        owner = _newOwner;
    }
}



contract CodeXpertDGames is Ownable{

    uint256 public amounttocontinue;
    event continuePlayingEvent();

    constructor() public{
        amounttocontinue = 10;
    }

    function continuePlaying() public payable returns (bool){

        require(msg.value >= 1 trx, "should be more than 1 TRX sent");

        emit continuePlayingEvent();
        return true;
    }

    function changeAmountToContinue(uint256 _amounttocontinue) onlyOwner public returns (bool){
        amounttocontinue = _amounttocontinue;
        return true;
    }

    function getBalance() onlyOwner public view returns (uint256)
    {
        return address(this).balance;
    }

    // @dev Transfers TRX from contract to specified address
    function withdrawTRX(address _address, uint256 _amount) onlyOwner public returns (uint256)
    {
        uint256 _value = _amount*(1 trx);

        // to prevent spamming
        require(_value >= 1 trx, "Send at least 1 TRX");

        // transfer reward to account
        _address.transfer(_value);

    }

    // @dev Transfers TRX from specified address to contract
    function depositTRX() public payable onlyOwner returns (bool) {

        return true;
    }

}