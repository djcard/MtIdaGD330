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
        <cfoutput>
            <!--- The Main buttons of the Nav Bar. These collapse when the screen size is small --->
            <div class="collapse navbar-collapse" id="readDeseNav">
                <ul class="nav navbar-nav">
                    <li><a href="#cgi.script_name#?tool=addedit">Add Edit</a></li>
                    <li><a href="#cgi.script_name#?tool=createuuids">Create UUIDs</a></li>
                    <li><a href="#cgi.script_name#?tool=content">Content</a></li>

                </ul>
            </div>
        </cfoutput>
    </div>
</nav>
