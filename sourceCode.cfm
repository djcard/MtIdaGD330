<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Week 9 Source Code</title>
</head>
<link href="/includes/bootstrap/css/bootstrap.css" rel="stylesheet">
<body>
<cfdirectory action="list" directory="#expandpath('.')#" name="mainarea" recurse="no">
<cfdirectory action="list" directory="#expandpath('management')#" name="managearea" recurse="no">
<cftry>
    <div id="wrapper" class="container">
    <legend>Week 9</legend>
    <div class="col-lg-12">
        This week's main objective are to
        <ol>
            <li>Add personaliation to the site by adding a state in the session</li>
            <li>Adding permissions to the site using a session.user.isadmin value. This imapacts several files. </li>
        </ol>.</div>
    <div class="col-lg-3">
        <legend>Main Site</legend>
    <cfoutput>
        <ul class="nav nav-pills nav-stacked">
        <cfloop query="mainarea">
            <cfif type eq "file">
                    <li><a href="#cgi.SCRIPT_NAME#?page=#name#">#name#</a></li>
            </cfif>
        </cfloop>
        </ul>
            <legend>Management</legend>
        <ul class="nav nav-pills nav-stacked">
        <cfloop query="managearea">
            <cfif type eq "file">
                    <li><a href="#cgi.SCRIPT_NAME#?page=management/#name#">#name#</a></li>
            </cfif>
        </cfloop>
        </ul>
    </cfoutput>
    </div>
    <div class="col-lg-9">
    <cfif isdefined('url.page')><cffile action="read" file="#expandpath('.')#/#url.page#" variable="sourcecode" /><pre><cfoutput><cfdump var="#sourcecode#"></cfoutput></pre>
    </cfif>

    </div>
    </div>
    <cfcatch type="any">
        <cfdump var="#cfcatch#" />
    </cfcatch>
</cftry>
</body>
</html>
