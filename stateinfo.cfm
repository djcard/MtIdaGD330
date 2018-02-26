<!--- This ensures that there is a session.user at all times --->
<cfif not isdefined('session.user')>
    <cfset makeCleanUser()>
</cfif>

<!--- This handles the login function from our login.cfm module. Its here beccause we want the new state to be in place as high up on the page as possible --->
<cfif isdefined('form.loginemail')>
    <!--- Search for the person via their email and hashed password --->
    <cfquery name="access" datasource="#application.dsource#">
        select * from people
        inner join passwords on people.id = passwords.personid
        where email='#form.loginemail#' and password='#hash(form.loginpass,"SHA-256")#'
    </cfquery>

    <!--- If the user is in the database with that email and password --->
    <cfif access.recordcount gt 0>
        <!--- Populate the session.user --->
        <cfset session.user={
            firstname:access.firstname[1],
            lastname:access.lastname[1],
            email:access.email[1],
            acctnuumber:access.personid[1]
        }>
        <!--- Register the person as logged in --->
        <cfset session.isLoggedin=true>
        <!--- Change the "P" value to the carousel so it returns the user to the front page but logged in --->
        <cfset p="carousel">
        <!--- If the user is an admin, make sure that is in the session --->
        <cfif access.isadmin[1] neq ''>
            <cfset session.user.isadmin=access.isadmin[1]>
        </cfif>
    <cfelse>
        <!---If the user is not in the db with that email and hashed password then set the message to appear on the login.cfm --->
            <cfset loginmessage="Sorry, that log doesn't match">
    </cfif>
</cfif>

<!--- Handle the logoff link. Again, this is so the new state takes place as high up on the page as possible --->
<cfif isdefined('url.p') and url.p eq 'logoff'>
    <cfset structClear(session)>
    <cfset session.isLoggedIn=false>
    <cfset makeCleanUser()>
    <cfset p="carousel">
</cfif>





<!--- Since we create  "clean" user from more than one place, we put it in its own function so we only need to edit it in one place --->
<cffunction name="makeCleanUser">
    <!--- Make sure the person is logged out --->
    <cfset session.isLoggedIn=false>
    <!--- We want these variables to exist so we don't throw errors when / if we reference them. The isAdmin is 0 by default because normal users are not admins --->
    <!---

        IMPORTANT NOTE: THIS SAMPLE AUTOMATICALLY MAKE ALL USERS ADMINS FOR DEMO PURPOSSES. IN YOUR PROJECTS, USE ISADMIN:0

    --->
    <cfset session.user={firstName:'',lastname:'',acctnumber:'',email:'',isAdmin:1}>
</cffunction>