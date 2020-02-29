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
        fu.setPensionYear(_pensionAge-_currentAge);
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
        if(msg.value == fu.getMonthlyAmount() && d.month > fu.getLastPaymentMonth()) {
            fu.setPaidAmount(fu.getPaidAmount()+msg.value);
            fu.setLastPayment(d.day, d.month, d.year);
        }
    }

    function payPension() public isPension() payable {
        address fuAddress = userFundMapping[msg.sender];
        Fund fu = Fund(fuAddress);
        if(d.month > fu.getLastPensionMonth()) {
            uint amount = fu.getPaidAmount()/fu.getPensionYear()/12;
            msg.sender.transfer(amount);
            fu.setLastPension(d.day, d.month, d.year);
        }
    }

    function refundAll() public payable {
        Fund fu = Fund(userFundMapping[msg.sender]);
        msg.sender.transfer(fu.getPaidAmount());
        fu.setPaidAmount(0);
    }

    modifier isPension() {
        Fund fu = Fund(userFundMapping[msg.sender]);
        require(fu.getPensionYear()+fu.getYear() == d.year);
        _;
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
    date public lastPayment;
    date public lastPension;
    uint public pensionYear;

    constructor() public {
        owner = msg.sender;
        pig = Pigleth(msg.sender); // what happen here?
        paidAmount = 0;
        monthlyAmount = 0;
        pensionAge = 0;
        currentAge = 0;
        lastPayment = 0;
        lastPension = 0;
        pensionYear = 0;
    }

    function setLastPayment(uint _day, uint _month, uint _year) public isOwner() {
        lastPayment.day = _day;
        lastPayment.month = _month;
        lastPayment.year = _year;
    }

    function setLastPension(uint _day, uint _month, uint _year) public isOwner() {
        lastPension.day = _day;
        lastPension.month = _month;
        lastPension.year = _year;
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
    function setPensionYear(uint _pensionYear) public isOwner() {
        pensionYear = _pensionYear;
    }
    function getPensionYear() public returns(uint) {
        return pensionYear;
    }
    function getPaidAmount() public isOwner() returns (uint) {
        return paidAmount;
    }
    function getMonthlyAmount() public returns (uint) {
        return monthlyAmount;
    }

    function getPensionAge() public returns (uint) {
        return pensionAge;
    }
    function getCurrentAge() public returns (uint) {
        return currentAge;
    }

    function getDay() public returns (uint) {
        return d.day;
    }
    function getMonth() public returns (uint) {
        return d.month;
    }
    function getYear() public returns (uint) {
        return d.year;
    }
    function getLastPaymentDay() public returns (uint) {
        return lastPayment.day;
    }
    function getLastPaymentMonth() public returns (uint) {
        return lastPayment.month;
    }
    function getLastPaymentYear() public returns (uint) {
        return lastPayment.year;
    }
        function getLastPensionDay() public returns (uint) {
        return lastPayment.day;
    }
    function getLastPensionMonth() public returns (uint) {
        return lastPayment.month;
    }
    function getLastPensionYear() public returns (uint) {
        return lastPayment.year;
    }

    modifier isOwner() {
        require(owner == msg.sender);
        _;
    }
}
