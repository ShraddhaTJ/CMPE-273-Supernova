pragma solidity ^0.4.18;

contract Insurance{
    //state variables
    struct User{
        string email;
        string password;
        address user_address;
        string fname;
        string lname;
        unit active;
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
        users_list[msg.sender] = User(email, password, msg.sender, 1, fname, lname);
    }


    function take_insurance(string b_email) public 
    {
        policy_no++;
        pol = Policy(policy_no, benefactor_email, msg.sender, policy_status.ACTIVE);
        user_policies[msg.sender] = pol;
    }

    function get_policy_status() public {
        return user_policies[msg.sender].flag;
    }

    function claim_money() public {
        user_policies[msg.sender].flag = policy_status.CLAIMED;
    }
}
