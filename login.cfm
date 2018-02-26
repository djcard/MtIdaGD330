<!--- This is a variable to store any messages about the new account --->
<cfparam name="AccountMessage" default="">
<!--- This is a variable to store any messages about logging in --->
<cfparam name="LoginMessage" default="">

<!--- This JS checks whether the password and the confirm password match before trying to submit the form ---->
<script>
    function validateNewAccount(){
        var originalPassword=document.getElementById('newaccountpassword').value;
        var confirmPassword=document.getElementById('newaccountpasswordconfirm').value;
        console.dir(originalPassword);
        console.dir(confirmPassword);
        if(originalPassword===confirmPassword && originalPassword!==''){
            document.getElementById('submitnewaccountform').click();
            document.getElementById('newAccountMessage').innerHTML="";
        }
        else{
            document.getElementById('newAccountMessage').innerHTML="";
        }
    }
</script>
<cfset preProcess()>

<div class="col-lg-6">
    <cfoutput>
        #newUserForm()#
    </cfoutput>
</div>
<div class="col-lg-6">
    <cfoutput>
        #loginForm()#
    </cfoutput>
</div>


<!--- This handles the new acccount. Handling the login is done on the stateinfo.cfm page --->
<cffunction name="preProcess">
    <cfif isdefined('form.newpersonid')>
        <!--- Make a new UUIS since we are going to use the same one in two different queries--->
        <cfset newid=createuuid()>
        <!--- Check to see if the email is already in our system --->
        <cfquery name="getEmail" datasource="#application.dsource#">
            select * from people where email='#form.email#'
        </cfquery>
        <!--- If the email is NOT in our system --->
        <cfif getEmail.recordcount eq 0>
            <!--- Insert the person into the people table --->
            <cfquery name="putin" datasource="#application.dsource#">
                insert into people (id,firstname,lastname,email,isadmin) values ('#newid#','#form.firstname#','#form.lastname#','#form.email#','0')
            </cfquery>
            <!--- Insert the person's id and hashed password into the passwords table --->
            <cfquery name="passw" datasource="#application.dsource#">
                insert into passwords (personid,password) values ('#newid#','#hash(form.password,"SHA-256")#')
            </cfquery>
        <!--- Otherwise make a message to be displayed saying so.--->
        <cfelse>
            <cfset AccountMessage="That Email Account is Already in our System. Please login.">
        </cfif>
    </cfif>
</cffunction>

<cffunction name="newUserForm">
    <cfoutput>
        <legend>New User</legend>
        <!--- This div will display the CF variable #AccountMessage# and also be manipulated by JS to display message via that method --->
        <div id="newAccountMessage">#AccountMessage#</div>
        <form action="#cgi.script_name#?p=login" class="form-horizontal" method="post">
            <!--- This Hidden input flags the preprocess function to handle the newaccount subission --->
            <input type="hidden" name="newPersonId" value="">
            <div class="form-group">
                <label class="col-lg-3 control-label">First Name</label>
                <div class="col-lg-9">
                    <input type="text" class="form-control" name="firstname" required />
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">Last Name</label>
                <div class="col-lg-9">
                    <input type="text" class="form-control" name="lastname" required/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Email</label>
                <div class="col-lg-9">
                    <input type="email" class="form-control" name="email" required/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Password</label>
                <div class="col-lg-9">
                    <input type="text" class="form-control" name="password" id="newaccountpassword" required/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Confirm Password</label>
                <div class="col-lg-9">
                    <input type="text" class="form-control" id="newaccountpasswordconfirm" required/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">&nbsp;</label>
                <div class="col-lg-9">
                    <!--- This button is visible and trggers the JS function to compare the password and password confirm.
                    If this passes, the JS function will click the hidden submit button and trigger the HTML5 validations--->
                    <button type="button" id="newAccountButton" class="btn btn-warning" onclick="validateNewAccount()">Make Account</button>
                    <input type="submit" id="submitnewaccountform" style="display:none" />

                </div>
            </div>
        </form>
    </cfoutput>
</cffunction>

<cffunction name="loginForm">
    <cfoutput>
        <!--- This displays messages from both the CF (via variable) and JS (via the id) methods --->
        <div id="loginmessage">#loginmessage#</div>
        <form action="#cgi.script_name#?p=login" method="post" class="form-horizontal">
            <legend>Login</legend>
            <div class="form-group">
                <label class="col-lg-3 control-label">
                    Username:
                </label>
                <div class="col-lg-9">
                    <input type="text" name="loginemail" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">
                    Password:
                </label>
                <div class="col-lg-9">
                    <input type="password" name="loginpass" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">
                    &nbsp;
                </label>
                <div class="col-lg-9">
                    <button class="btn btn-primary" type="submit">Login</button>
                    <div><a href="#cgi.script_name#?p=forgotPassword">Forgot Password</a></div>
                </div>
            </div>
        </form>
    </cfoutput>
</cffunction>