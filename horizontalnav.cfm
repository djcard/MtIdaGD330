<!---
  Created by djcar on 5/20/2017.
--->
<!--- The wrapper element for the navigation. The nav element helps establish what this section is --->
<nav class="navbar navbar-default">
    <!--- THe inner wrapper which is needed according to bootstrap --->
    <div class="container-fluid">
        <!--- The first section of the bar --->
        <div class="navbar-header">
            <!--- The menu toggle which only appears on small screens --->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#readDeseNav">
                <!--- The sr-only class indicates that it is only seen by screen readers and therefore read outloud to identify what this is --->
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!--- The RDB Graphic --->
            <a class="navbar-brand" href="index.html">
                <img src="/CodeBase/includes/classimages/rdb.png"/>
            </a>
        </div>

        <!--- The Main buttons of the Nav Bar. These collapse when the screen size is small --->
        <div class="collapse navbar-collapse" id="readDeseNav">
            <ul class="nav navbar-nav">
                <cfoutput>
                    <li class="active"><a href="index.html">Home</a></li>
                    <li><a href="#cgi.script_name#?p=content&contentid=A7EE957B-C14B-95E1-5D36844A4408C572">Store Information</a></li>
                    <li><a href="#cgi.script_name#?p=content&contentid=91D5E37C-CFCA-6EBC-9C0D268160FED36C">About Us</a></li>
                    <li><a href="#cgi.script_name#?p=content&contentid=2143ECAD-0FEC-3E79-4920312EB06351BF">Speed Reading</a></li>
                </cfoutput>
                <!--- One of hte items is the search form --->
                <cfoutput>
                    <li>
                        <form action="#cgi.script_name#?p=details" method="post" class="navbar-form navbar-left" role="search">
                            <div class="form-group">
                                <input type="text" name="searchme" class="form-control" placeholder="Search">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </li>
                </cfoutput>
            </ul>
            <!--- This list pulls to the right and puts the login button off on it's own --->
            <cfoutput>
                <ul class="nav navbar-nav navbar-right">
                    <!--- Is the person is logged in --->
                    <cfif session.isLoggedIn>
                        <li><a>Welcome #session.user.firstname#</a></li>
                        <!--- If the person is an admin --->
                        <cfif session.user.isadmin>
                                <li><a href="management">Management</a></li>
                        </cfif>
                        <!--- Show a logout/logoff link --->
                        <li><a href="#cgi.script_name#?p=logoff">Logout</a></li>
                    <cfelse>
                        <!--- By default show a login link --->
                        <li><a href="#cgi.script_name#?p=login">Login</a></li>
                    </cfif>
                </ul>
            </cfoutput>
        </div>
    </div>
</nav>