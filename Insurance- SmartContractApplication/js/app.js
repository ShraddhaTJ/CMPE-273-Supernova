App = {
  web3Provider: null,
  contracts: {},
  account: 0x0,
  loading: false,

  init: function() {
    return App.initWeb3();
  },

  initWeb3: function() {
    // Initialize web3 and set the provider to the testRPC.
    if (typeof web3 !== 'undefined') {
      App.web3Provider = web3.currentProvider;
      web3 = new Web3(web3.currentProvider);
    } else {
      // set the provider you want from Web3.providers
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:8545');
      web3 = new Web3(App.web3Provider);
    }


    /*web3.eth.getAccounts(function(err, accounts){
        if (err != null) console.error("An error occurred: "+err);
        else if (accounts.length == 0) console.log("User is not logged in to MetaMask");
        else console.log("User is logged in to MetaMask "+accounts);
*/
    });

    return App.initContract();
  },

  initContract: function() {
    $.getJSON('Insurance.json', function(insuranceArtifact) {
      // Get the necessary contract artifact file and use it to instantiate a truffle contract abstraction.
      App.contracts.Insurance = TruffleContract(insuranceArtifact);

      // Set the provider for our contract.
      App.contracts.Insurance.setProvider(App.web3Provider);
     
    });
  },

  getInstance: function() {
	  return App.contracts.Insurance;
  }


};


$(function() {
  $(window).load(function() {
    App.init();
  });
});
