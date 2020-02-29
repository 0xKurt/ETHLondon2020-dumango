pragma solidity >=0.4.21 <0.7.0;

contract Pigleth {

    struct date {
        uint day;
        uint month;
        uint year;
    }

    address public owner;
    date public d;
    mapping(address => address) public userFundMapping;

    function createFund(uint _currentAge, uint _pensionAge, uint _monthlyAmount) public returns (address) {
        Fund fu = new Fund();
        fu.setCurrentAge(_currentAge);
        fu.setPensionAge(_pensionAge);
        fu.setMonthlyAmount(_monthlyAmount);
        fu.setPiglethAddress(address(this));
        fu.setDate(d.day, d.month, d.year);
        userFundMapping[msg.sender] = address(fu);
        return address(fu);
    }

    function setDate(uint _day, uint _month, uint _year) public {
        d.day = _day;
        d.month = _month;
        d.year = _year;
    }

    function fund() public payable {
        address fuAddress = userFundMapping[msg.sender];
        Fund fu = Fund(fuAddress);
        if(msg.value == fu.getMonthlyAmount()) {
            fu.setPaidAmount(fu.getPaidAmount()+msg.value);
        }
    }

    function refundAll() public payable {
        Fund fu = Fund(userFundMapping[msg.sender]);
        msg.sender.transfer(fu.getPaidAmount());
        fu.setPaidAmount(0);
    }

    modifier isOwner() {
        require(owner == msg.sender);
        _;
    }

}


contract Fund {

    Pigleth pig;

    struct date {
        uint day;
        uint month;
        uint year;
    }

    address public owner;
    address public piglethAddress;
    uint public currentAge;
    uint public pensionAge;
    uint public monthlyAmount;
    uint public paidAmount;
    date public d;

    constructor() public {
        owner = msg.sender;
        pig = Pigleth(msg.sender); // what happend here?
        paidAmount = 0;
        monthlyAmount = 0;
        pensionAge = 0;
        currentAge = 0;
    }

    function setDate(uint _day, uint _month, uint _year) public isOwner() {
        d.day = _day;
        d.month = _month;
        d.year = _year;
    }
    function setOwner(address _owner) public isOwner() {
        owner = _owner;
    }
    function setCurrentAge(uint _age) public isOwner() {
        currentAge = _age;
    }
    function setPensionAge(uint _age) public isOwner() {
        pensionAge = _age;
    }
    function setMonthlyAmount(uint _monthlyAmount) public isOwner() {
        monthlyAmount = _monthlyAmount;
    }
    function setPaidAmount(uint _amount) public {
        paidAmount = _amount;
    }
    function setPiglethAddress(address _piggy) public {
        piglethAddress = _piggy;
    }
    function getPaidAmount() public isOwner() returns (uint) {
        return paidAmount;
    }
    function getMonthlyAmount() public returns (uint) {
        return monthlyAmount;
    }

    modifier isOwner() {
        require(owner == msg.sender);
        _;
    }
}
