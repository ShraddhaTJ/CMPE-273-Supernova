function getUserDetails() {
    var user = "";
    get_user_by_address(web3.eth.accounts[0], function(user_details){
        user = user_details;
    });
    return user;
}


function showHideBuySilver() {
    if (document.getElementById('buy-silver')) {
        document.getElementById('buy-gold').disabled = true;
        document.getElementById('buy-platinum').disabled = true;
    }
}
function showHideBuyGold() {
    if (document.getElementById('buy-gold')) {
        document.getElementById('buy-silver').disabled = true;
        document.getElementById('buy-platinum').disabled = true;
    }
}
function showHideBuyPlatinum() {
    if (document.getElementById('buy-platinum')) {
        document.getElementById('buy-silver').disabled = true;
        document.getElementById('buy-gold').disabled = true;
    }
}
function goToBuyPage() {
    window.location = 'homepage.html';
}

function goToClaimPage() {
  window.location = 'claim.html';
}

function goBackToIndex()
{
  window.location = 'index.html';
}
