<cfparam name="contentid" default="">

<cfquery name="whatContent" datasource="#application.dsource#">
    select * from content where contentid='#contentid#'
</cfquery>

<cfif contentid neq '' and whatContent.recordcount gt 0>
    <cfoutput>
        <legend>#whatContent.title[1]#</legend>
        <div>#whatContent.description[1]#</div>
    </cfoutput>
<cfelse>
    Sorry, we couldn't find what you were looking for. Please Try again.
</cfif>
