pragma solidity ^0.4.18;

contract Insurance{
    //state variables
    struct User{
        string email;
        string password;
        address user_address;
        string fname;
        string lname;
        uint active;
    }

    struct Policy{
        uint policy_number;
        string benefactor_email;
        address user;
        policy_status flag;
        policy_type type;
    }


    struct Pay{
        uint payment_id;
        uint policy_number;
        uint amount;
    }

    struct Claim{
        uint claim_id;
        uint policy_number;
        uint amount;
    }

    enum policy_type {SILVER, GOLD, PLATINUM}
    enum policy_status {ACTIVE, CLAIMED}
    
    uint policy_no = 0;
    mapping(address => User) public users_list;
    mapping(address => Policy) public user_policies;
    mapping(address => unit) public policies_bought;

    
    function register(string fname, string lname, string email, string password) public {
        if(users_list[msg.sender].active == 1){
            return;
        }
        users_list[msg.sender] = User(email, password, msg.sender, fname, lname, 1);
    }

    function get_user() public constant returns (string, string, string, uint){
        return (users_list[msg.sender].fname, users_list[msg.sender].lname, users_list[msg.sender].email, users_list[msg.sender].active); 
    }

    function get_user_by_address(address requestAddress) public constant returns(string,string,string, uint, uint) {
    return (users_list[requestAddress].fname, users_list[requestAddress].lname, users_list[requestAddress].email, policies_bought[requestAddress]);  
  }

    function take_insurance(string b_email) public 
    {
        user_policies[msg.sender] = Policy(policy_no, b_email, msg.sender, policy_status.ACTIVE);
        policies_bought[msg.sender] = policies_bought[msg.sender] + 1;
    }

    function get_policy_status() public constant returns (policy_status){
        return user_policies[msg.sender].flag;
    }

    function get_policy_details() public constant returns (uint, string, address, policy_status, policy_type){
        var p = user_policies[msg.sender];
        return (p.policy_number, p.benefactor_email, msg.sender, p.flag, p.type);
    }

    function claim_money() public {
        user_policies[msg.sender].flag = policy_status.CLAIMED;
    }
}
