<!---
  Created by djcar on 5/20/2017.
--->
<cfquery name="allgenres" datasource="#application.dsource#">
    select distinct genres.genreid,genres.genrename from genrestobooks
    inner join genres on genres.genreid = genrestobooks.genreid
    order by genres.genrename
</cfquery>
<ul class="nav nav-stacked">
    <cfoutput query="allgenres">
        <li><a href="#cgi.script_name#?p=details&genre=#genreid#">#genrename#</a></li>
    </cfoutput>
<!---
    <li><a>Childrens's Books</a></li>
    <li><a>Mysteries</a></li>
    <li><a>Non-Fiction</a></li>
    <li><a>Self Help</a></li>
    <li><a>Philosophy</a></li>
    <li><a>Religion</a></li>
    <li><a>Technology</a></li>--->
</ul>