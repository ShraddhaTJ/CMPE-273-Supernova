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

    enum policy_status {ACTIVE, EXPIRED, CLAIMED}
    
    uint policy_no = 0;
    mapping(address => User) public users_list;
    mapping(address => Policy) public user_policies;

    
    function register(string fname, string lname, string email, string password) public {
        if(users_list[msg.sender].active == 1){
            return;
        }
        users_list[msg.sender] = User(email, password, msg.sender, fname, lname, 1);
    }


    function take_insurance(string b_email) public 
    {
        user_policies[msg.sender] = Policy(policy_no, b_email, msg.sender, policy_status.ACTIVE);
    }

    function get_policy_status() public constant returns (policy_status){
        return user_policies[msg.sender].flag;
    }

    function claim_money() public {
        user_policies[msg.sender].flag = policy_status.CLAIMED;
    }
}
