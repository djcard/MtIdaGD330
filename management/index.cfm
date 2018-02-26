<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Week 9 Management</title>
    <link href="/bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />
    <link href="/includes/css/mycss.css" rel="stylesheet" />
    <script src="/bower_components/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="/bower_components/react/react.js" type="text/javascript"></script>
    <script src="/bower_components/react/react-dom.js" type="text/javascript"></script>
</head>
<cfparam name="tool" default="addedit">
<!--- If the user is not an admin, don't let me into the management area
<cfif not session.user.isadmin>
    <cflocation url="/week9/" />
</cfif>--->
<body>
<div class="container">
<div class="col-lg-12 row">
<cfinclude template="managementnav.cfm" />
</div>
<div class="col-lg-12 row">
<cfinclude template="#tool#.cfm">
</div>
</div>
</body>
</html>
