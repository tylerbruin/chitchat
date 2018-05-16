function ajaxRequest(method, url, data, callback){

	let request = new XMLHttpRequest();
    request.open(method,url,true);
	
	if(method == "POST"){
		request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	}
    
  	request.onreadystatechange = function() {
		if (request.readyState == 4) {
			if (request.status == 200) {
                let response = request.responseText;
				callback(response);
			}
		}
    }
    
	request.send(data);
}

// Global vars

var currentuser = "";
var newdate = "";
    
//////////////////////////////////////// Get Messages \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function getMessages(response)
{

    var data = JSON.parse(response);
    var chatbox = "";  
    var currentChat = document.getElementById("info").innerHTML; 
    for(var i = 0; i < data.length; i++)
    {
        document.getElementById("info").innerHTML = chatbox + "<br><strong>" + data[i]['datetime'].substr(11,5) + " - " + data[i]['username'] + ": </strong> " + data[i]['content'] + "<hr>";
        // console.log("testing datetime: " + data[i]['datetime'].substr(11,5));
       
     
       chatbox = document.getElementById("info").innerHTML;
    }

    if(currentChat != document.getElementById("info").innerHTML){
        autoChatScroll();
    }
}

//////////////////////////////////////// Auto Scroll \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function autoChatScroll()
{

    var objDiv = document.getElementById("chatbox")
    objDiv.scrollTop = objDiv.scrollHeight;
    //console.log(objDiv.scrollHeight);
}

//////////////////////////////////////// Send Messages \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function sendMessage()
{ 

    var chatmsg = document.getElementById("messagebox").value;
    //console.log("Message Details: " + chatmsg + " " + currentuser);
    ajaxRequest("POST", "sendChatMessage.php?message=" + chatmsg + "&currentuser=" + currentuser, null, blank);
    document.getElementById('messagebox').value = '';
}

//////////////////////////////////////// Refresh Chat \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
document.addEventListener("DOMContentLoaded", function() { 
    setInterval(function() {
        if(currentuser == ""){

            document.getElementById("info").innerHTML = "Please Log In to view chat messages."
        }
        else{
        
            //console.log("testing newdate:" + newdate)
            //document.getElementById("info").innerHTML = "";
            ajaxRequest("GET", "getChatMessages.php?newdate=" + newdate, null, getMessages);
            //console.log("test" + document.getElementById("info").innerHTML);

            if(document.getElementById("info").innerHTML == "" || document.getElementById("info").innerHTML == "Please Log In to view chat messages." ){

                document.getElementById("info").innerHTML = "No messages for date: " + newdate;
            }
        }
    }, 1500); 
})


//////////////////////////////////////// Login Function \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function login() {

    var userLogin = document.getElementById("userLogin").value;
    var userPass = document.getElementById("userPass").value;
    //console.log("Login Information: " + userLogin + " and " + userPass);

    if (userLogin==null || userLogin=="",userPass==null || userPass=="")
    {
        alert("Please Fill All Required Field");
        return false;
    }
    else
    {   
        ajaxRequest("POST", "login.php?userLogin=" + userLogin + "&userPass=" + userPass, null, currentUser);
        currentuser = userLogin;
    }
} 

//////////////////////////////////////// Set Current User / Check Login Creds \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function currentUser(response) {
    
    document.getElementById("loggedInUser2").innerHTML = "Current User: " + currentuser;
    //console.log("Current user attempting to sign in: " + currentuser) 
    var no = JSON.parse(response);
    //console.log(no);
    
    if(no == 1) {

        alert("Logged In as: " + currentuser);
        toggleLoginView();
    }
    else {

        currentuser = "";
        alert("Wrong Username or Password");
        document.getElementById("loggedInUser2").innerHTML = "Login Error";
    }
}

//////////////////////////////////////// Log Out Feature \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function logout() {

    var userLogout = currentuser;
    ajaxRequest("POST", "logout.php?currentUser=" + userLogout, null, blank);
    alert("User " + currentuser + " has been logged out.");
    //console.log("Current user PRE LOG " + currentuser) 
    currentuser = "";
    //console.log("Current user POST LOG " + currentuser) 
    toggleLogoutView();

    newdate = "";
    document.getElementById('selectedDate').value = '';
    changeDate(); 
}
//////////////////////////////////////// Logs out user as page is closed. \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
window.addEventListener("beforeunload", function(e){
    if(currentuser != "") {
        logout();
    }
 }, false); 

//////////////////////////////////////// Prompts Refresh warning \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
/* window.onbeforeunload = function(event)
 {
        return confirm("Confirm Refresh? User will be logged out.");
    
 }; */
//////////////////////////////////////// Online / Offline Status \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function getStatus(response) {
    
    var data = JSON.parse(response);

    var users = "";
    for(var i = 0; i < data['online'].length; i++)
    {
        users = users + "<br>" + data['online'][i]['username'];
    }
    document.getElementById("infoOnline").innerHTML = users;

    users = "";
    for(var i = 0; i < data['offline'].length; i++)
    {
        users = users + "<br>" + data['offline'][i]['username'];
    }
    document.getElementById("infoOffline").innerHTML = users;
}
document.addEventListener("DOMContentLoaded", function() { 
    setInterval(function() {
        ajaxRequest("GET", "getUserStatus.php", null, getStatus);
    }, 4000); 
})


//////////////////////////////////////// Register Users \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function registerUser() {

    var ruser = document.getElementById("ruser").value;
    var rpass = document.getElementById("rpass").value;
    var fname = document.getElementById("fname").value;
    var lname = document.getElementById("lname").value;
    var email = document.getElementById("email").value;

    //console.log("test log Register User Details: " + ruser + rpass + fname + lname + email);

    if (ruser==null || ruser=="",rpass==null || rpass=="",fname==null || fname=="",lname==null || lname=="",email==null || email=="")
    {
        alert("Please Fill All Required Field");
        return false;
    }
    else
    {
        ajaxRequest("POST", "registerUser.php?ruser=" + ruser + "&rpass=" + rpass + "&fname=" + fname + "&lname=" + lname + "&email=" + email, null, checkRegisterName);
    }

}

//////////////////////////////////////// Check Register Users Creds\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function checkRegisterName(response) {
    
    var no = JSON.parse(response);
    //console.log(no);
    
    if(no != 0) {

        alert("Invaild Username. Pick another.");
        document.getElementById("loggedInUser2").innerHTML = "Sorry, Username has already been Taken - Error";
        
    }
    else {

        var ruser = document.getElementById("ruser").value;
        document.getElementById("loggedInUser2").innerHTML = "Successfully registered user: " + ruser + "!";
        alert("User '" + ruser + "' has been registered!");
        document.getElementById("registerForm").reset();
    }
}

//////////////////////////////////////// Blank function to test callback \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function blank() {
    console.log("function blank")
}

//////////////////////////////////////// Date Selector \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function changeDate() {

    newdate = document.getElementById("selectedDate").value;
    //console.log(newdate + " Selected Date");

    var today = new Date();
    var year = today.getFullYear();  
    var month = today.getMonth()+1;
    var day = today.getDate();

    if(day<10) {
        day = '0'+day
    } 
    
    if(month<10) {
        month = '0'+month
    } 
    today = year + '-' + month + '-' + day;
    //console.log("testing newdate/today: " + today)

    if(newdate == "")
    {
        document.getElementById("info").innerHTML = ""; 
        newdate = today;
        document.getElementById("currentDate").innerHTML = "Currently showing messages from: " + newdate + ".";
    }
    else{
        document.getElementById("info").innerHTML = ""; 
        newdate = document.getElementById("selectedDate").value;
        document.getElementById("currentDate").innerHTML = "Currently showing messages from: " + newdate + ".";

        if(newdate != today){
            document.getElementById("sndButton").disabled = true;
        }
        else{
            document.getElementById("sndButton").disabled = false;
        }
    }
}

//////////////////////////////////////// Date Selector \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function resetChangeDate() {
    document.getElementById("selectedDate").value = "";
    document.getElementById("sndButton").disabled = false;
    newdate = "";
    changeDate();
}
//////////////////////////////////////// Change User Username \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function changeUsername() {

    var newUserLogin = document.getElementById("newUserLogin").value;
    var userLogin = currentuser;
    //currentuser = newUserLogin;
    console.log("Change username to: " + newUserLogin + "  & " + currentuser + "  & " + userLogin);
    
    if (newUserLogin==null || newUserLogin=="")
    {
        alert("Please Fill All Required Field");
        return false;
    }
    else
    {
    // console.log("Change username to: " + newUserLogin + "  & " + currentuser)
    ajaxRequest("POST", "updateUsername.php?userLogin=" + userLogin + "&newUserLogin=" + newUserLogin, null, checkUsernameChange);
    //alert("Changed username to: " + newUserLogin);
    }
}

//////////////////////////////////////// Check Change Username availability \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function checkUsernameChange(response) {
    
    var no = JSON.parse(response);
    //console.log(no);
    
    if(no != 0) {

        alert("Invaild Username. Pick another.");
        document.getElementById("loggedInUser2").innerHTML = "Sorry, Username has already been Taken - Error";
        
    }
    else {

        var newUserLogin = document.getElementById("newUserLogin").value;
        document.getElementById("loggedInUser2").innerHTML = "Successfully changed username to: " + newUserLogin + "!";
        alert("Successfully changed name user: " + newUserLogin + "!");
        currentuser = newUserLogin;
    }
}

//////////////////////////////////////// Function for JS on body load \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function disableButtonsOnLoad()
{

    document.getElementById("sndButton").disabled = true;
    document.getElementById("logoutButton").hidden = true;
    document.getElementById("datePicker").disabled = true;
    document.getElementById("datePickerReset").disabled = true;

    document.getElementById("changeUsernameButton").hidden = true;
    document.getElementById("changeUsernameLabel").style.visibility = "hidden";
    document.getElementById("newUserLogin").style.visibility = "hidden";
    
}

//////////////////////////////////////// Login Toggle Buttons/Labels \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function toggleLoginView() {

    document.getElementById("loginButton").disabled = true;
    document.getElementById("logoutButton").hidden = false;
    document.getElementById("sndButton").disabled = false;
    document.getElementById("datePicker").disabled = false;
    document.getElementById("datePickerReset").disabled = false;

    document.getElementById('newUserLogin').value = '';
    document.getElementById("changeUsernameLabel").style.visibility = "visible";
    document.getElementById("newUserLogin").style.visibility = "visible";
    document.getElementById("changeUsernameButton").hidden = false;

    document.getElementById('userLogin').value = ''; 
    document.getElementById('userPass').value = '';
    document.getElementById("registerForm").hidden = true;
}

//////////////////////////////////////// Logout Toggle Buttons/Labels \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function toggleLogoutView() {

    document.getElementById("loggedInUser2").innerHTML = "No Current User.";
    document.getElementById("loginButton").disabled = false;
    document.getElementById("logoutButton").hidden = true;
    document.getElementById("sndButton").disabled = true;
    document.getElementById("datePicker").disabled = true;
    document.getElementById("datePickerReset").disabled = true;

    

    document.getElementById("changeUsernameLabel").style.visibility = "hidden";
    document.getElementById("newUserLogin").style.visibility = "hidden";
    document.getElementById("changeUsernameButton").hidden = true;

    document.getElementById('userLogin').value = '';
    document.getElementById('userPass').value = '';
    document.getElementById("registerForm").hidden = false;
}