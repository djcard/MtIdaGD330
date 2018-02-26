<!---
  Created by djcar on 5/20/2017.
--->
<!--- This doctype establishes that we are using HTML5 --->
<!doctype html>
<html>
<head>
    <title>Week 9 Code Example</title>
    <!--- Links to Bootstrap and our custom CSS. You'll have /username/includes....--->
    <link href="/bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />
    <link href="/includes/css/mycss.css" rel="stylesheet" />

    <!--- Link to jQuery and the bootstrap Javascript --->
    <script src="/bower_components/jQuery/dist/jquery.js" type="text/javascript"></script>
    <script src="/bower_components/bootstrap/dist/js/bootstrap.js" type="text/javascript"></script>
</head>
<body>
    <cfparam name="p" default="carousel" />
    <cfinclude template="stateinfo.cfm" />
    <!--- This div "wraps" the visible portions of the site --->
    <div class="container">
        <!--- This establishes the header area and the cfinclude pulls in the header.cfm file --->
        <div id="topHeader" class="row">
            <cfinclude template="header.cfm">
        </div>

        <!--- This establishes the Horoontal Navigation area and the cfinclude pulls in the horiontalnav.cfm file --->
        <div id="horizontalnav" class="row">
            <cfinclude template="horizontalnav.cfm">
        </div>

        <!--- This establishes the main content area which has two columns in it --->
        <div id="maincontent" class="row">
            <!--- This establishes the Center area and the cfinclude pulls in the header.cfm file.
            The center area comesfirst so that on mobile sites it was be on top and read first.
            The "push" css moves it over so the genrenav can appear on the right on larger browsers --->
            <div id="center" class="col-sm-7 col-lg-7 col-md-7 col-sm-push-3">
                <cfinclude template="#p#.cfm">
            </div>

            <!--- This establishes the genrenav area and the cfinclude pulls in the genrenav.cfm file. The "pull" css makes it appear on the left hand side of the screen on large screens even though it comes second in the hierarchy --->
            <div id="leftgutter" class="col-sm-3 col-lg-3 col-md-3 col-sm-pull-7">
                <cfinclude template="genrenav.cfm" >
            </div>
        </div>

        <!--- This establishes the footer area and the cfinclude pulls in the footer.cfm file --->
        <div id="footer" class="row">
            <cfinclude template="footer.cfm">
        </div>
    </div>
</body>
</html>