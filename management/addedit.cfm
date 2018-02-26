<!--- The CFTRY tag runs the code inside of it and then, if and only if there is an error, runs the code in the cfcatch tag --->
<cftry>
    <cfparam name="book" default="">
    <cfparam name="qterm" default="">
    <!--- We run process forms first so all additions and upddates happen before the rest of the page is processed --->
    <cfset processForms()>

    <script>
        function toggleNewISBNForm(){
            var newISBNArea=document.getElementById('newisbn13area');
            if(newISBNArea.style.display==='none'){
                newISBNArea.style.display='inline';
            }
            else{
                newISBNArea.style.display='none';
            }
        }
    </script>

    <!--- This is the area for our main edit form. The actual form is in the mainForm() Function lower on the page --->
    <div id="main" class="col-lg-9 col-lg-push-3">
        <cfoutput>#mainForm()#</cfoutput>
    </div>

<!--- This is the area for our side navigation. The actual code is in the sideNav() Function lower on the page --->
    <div id="leftgutter" class="col-lg-3 col-lg-pull-9">
        <cfoutput>#sideNav()#</cfoutput>
    </div>

    <!--- The code that runs if there is an error above. --->
    <cfcatch type="any">
        <cfoutput>
            <!--- CFCatch is a structure that has several keys in it.
            One of these is the message. You might want to change this to be <cfdump var="#cfcatch#">
            if you want to get more insight into what is happening --->
            #cfcatch.message#
        </cfoutput>
    </cfcatch>
</cftry>


<!--- This function has the actual adding/editing form in it. By seperateing our code into smaller pieces it makes it easier to read and debug --->
<cffunction name="mainForm">
    <cfif book neq ''>
        <!--- Get the details for this book --->
        <cfquery name="thisbook" datasource="#application.dsource#">
            select * from books where isbn13='#book#'
        </cfquery>
        <!--- Get all theh publishers for the drop down --->
        <cfquery name="allPubs" datasource="#application.dsource#">
            select * from publishers order by name
        </cfquery>

        <!--- All the genres in the system --->
        <cfquery name="allgenres" datasource="#application.dsource#">
            select * from genres order by genrename
        </cfquery>
        <cfdump var="#allgenres#">

        <!--- All genres which this book i assigned --->
        <cfquery name="bookgenres" datasource="#application.dsource#">
            select * from genresToBooks where bookid='#book#'
        </cfquery>

        <!--- determine whether to show the isbn13 edit or display --->
        <!--- Note: this might differ from the docs but is a cleaner way to do this--->
        <!--- By default show the display --->
        <cfset isbnfield="none">
        <cfset isbndisplay="inline">
        <cfset req=''>

        <!--- If the ISBN13 from the db is blank, show the isbn13 input --->
        <cfif thisbook.isbn13[1] eq ''>
            <cfset isbnfield='inline'>
            <cfset isbndisplay='none'>
            <cfset req="required">
        </cfif>




        <cfoutput>
            <!--- By using #cgi.script_name# this form will submit the form data to this same page by reponeing it--->
            <form action="#cgi.script_name#?tool=addedit" method="post" class="form-horizontal" enctype="multipart/form-data">
                <!--- This is here to preserve the "search term" for the side nav --->
                <input type="hidden" name="qterm" value="#qterm#" />
                <!--- The ISBN13 form group --->
                <div class="form-group">
                    <label for="isbn13" class="col-lg-3 control-label">ISBN13</label>
                    <div class="col-lg-9">
                        <span id="newisbn13area" style="display:#isbnfield#">
                            <input type="text" class="form-control" id="newisbn13" name="newisbn13" placeholder="ISBN13" value="#thisbook.isbn13[1]#" #req# pattern=".{13}" title="Please enter 13 characters only. No dashes necessary."/>
                        </span>
                        <span style="display:#isbndisplay#">
                            #thisbook.isbn13[1]#
                            <!--- Only show the edit ISBN button if the user is an admin --->
                            <cfif session.user.isadmin>
                                <button type="button" onclick="toggleNewISBNForm()" class="btn btn-warning btn-xs">Edit ISBN</button>
                            </cfif>
                            <input type="hidden" class="form-control" id="isbn13" name="isbn13" placeholder="ISBN13" value="#thisbook.isbn13[1]#"/>
                        </span>
                    </div>
                </div>

                <!--- The Book Title area --->
                <div class="form-group">
                    <label for="title"class="col-lg-3 control-label">Book Title</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="title" name="title" placeholder="Book Title" value="#thisbook.title[1]#" required maxlength="45" />
                    </div>
                </div>

                <!--- The Year Group --->
                <div class="form-group">
                    <label for="title"class="col-lg-3 control-label">Year</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="year" name="year" placeholder="Year of Publication" value="#thisbook.year[1]#"/>
                    </div>
                </div>

                <!--- The weight group --->
                <div class="form-group">
                    <label for="title"class="col-lg-3 control-label">Weight</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="weight" name="weight" placeholder="Book Weight (lbs)" value="#thisbook.weight[1]#" />
                    </div>
                </div>

                <!--- The ISBN group --->
                <div class="form-group">
                    <label for="title"class="col-lg-3 control-label">ISBN</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="isbn" name="isbn" placeholder="ISBN 10" value="#thisbook.isbn[1]#" />
                    </div>
                </div>

                <!--- The Pages Group --->
                <div class="form-group">
                    <label for="title"class="col-lg-3 control-label">Pages</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="pages" name="pages" placeholder="No. Pages" value="#thisbook.pages[1]#" />
                    </div>
                </div>

                <!--- The Publisher Group --->
                <div class="form-group">
                    <label for="title"class="col-lg-3 control-label">Publisher</label>
                    <div class="col-lg-9">
                            <select class="form-control" id="publisher" name="publisher">
                                <option value=""></option>
                                <cfloop query="allpubs">
                                    <cfset sel=''>
                                    <cfif trim(id) eq thisbook.publisher[1]>
                                        <cfset sel='selected="selected"'>
                                    </cfif>
                                    <option value="#trim(id)#" #sel#>#trim(name)#</option>
                                </cfloop>
                            </select>
                    </div>
                </div>

                <!--- The Image Group --->
                <div class="form-group">
                    <label for="title"class="col-lg-3 control-label">Cover</label>
                    <div class="col-lg-9">
                        <img src="/Codebase/week9/images/#trim(thisbook.image[1])#" height="150">
                        <input type="file" class="form-control" id="coverimage" name="uploadimage" />
                        <input type="hidden" name="image" value="#thisbook.image[1]#" />
                    </div>
                </div>

                <!--- The Description Group --->
                <div class="form-group">
                    <label for="title"class="col-lg-12 control-label" style="text-align: left">Description</label>
                    <div class="col-lg-12">
                        <textarea id="bookdesc" name="description">#trim(thisbook.description[1])#</textarea>
                        <script>CKEDITOR.replace("bookdesc")</script>
                    </div>
                </div>

                <!--- The Genres Group --->
                <div class="form-group">
                    <label class="col-lg-12 control-label" style="text-align: left">Genres</label>
                <div class="col-lg-12">
                    <cfloop query="allgenres">
                        <input id="genre#genreid#" type="checkbox" name="genre" value="#genreid#">#genrename# <br/>
                    </cfloop>
                    <cfloop query="bookgenres">
                        <script>document.getElementById('genre#genreid#').checked=true;</script>
                    </cfloop>
            </div>
            </div>

                <!--- The Submit Button--->
                <div class="form-group">
                    <label class="col-lg-3 control-label">&nbsp;</label>
                    <div class="col-lg-9">
                        <button type="submit" class="btn btn-primary">Add Book</button>
                    </div>
                </div>

            </form>
        </cfoutput>
    </cfif>
</cffunction>


<!--- This function has the actual side navigation workings in it. By separating our code into smaller pieces it makes it easier to read and debug --->
<cffunction name="sidenav">
    <cftry>
    <!--- This form allows us to filter which books we see to choose to edit --->
    <cfoutput>
        <form action="#cgi.script_name#?tool=addedit" method="post"
            class="form-inline">
                <div class="form-group">
                    <input type="text" class="form-control"
                           id="qterm" name="qterm" value="#qterm#">
                <button type="submit" class="btn btn-xs btn-primary">Search</button>
                </div>
        </form>
    </cfoutput>

    <!--- The query to find books to edit based on the criteria we choose.
        This will only run if a search term is submitted --->
    <cfif qterm neq ''>
        <cfquery name="allbooks" datasource="#application.dsource#">
            select * from books
            where title like '%#qterm#%'
            order by title
        </cfquery>
    </cfif>
    <!--- The label for our side nav --->
    <div>Book List</div>
    <cfoutput>
        <!--- A list to display our editing options --->
        <ul class="nav nav-stacked">
            <!--- Add a book link --->
            <li><a href="#cgi.script_name#?tool=addedit&book=new">Add a Book</a></li>
            <!--- Diplay the search results ONLY if the query exists--->
            <cfif isdefined('allbooks')>
                <cfloop query="allbooks">
                    <li><a href="#cgi.script_name#?tool=addedit&book=#trim(isbn13)#&qterm=#qterm#">#trim(title)#</a></li>
                </cfloop>
            </cfif>
        </ul>
    </cfoutput>
        <cfcatch type="any">
            <cfdump var="#cfcatch#">
        </cfcatch>
    </cftry>
</cffunction>


<!--- This function has the actual workings to process the adds and editsin into the DB. By seperateing our code into smaller pieces it makes it easier to read and debug --->
<cffunction name="processForms">
    <!--- THis looks for a variable called isbn13 which was submitted via a form. If it find it, it run the adds and edits Otherwise, it skips it --->
    <cfif isdefined('form.isbn13')>
        <cfif isdefined('form.uploadimage') and trim(form.uploadimage) neq ''>
            <cffile action="upload" filefield="uploadimage" destination="#expandpath('/')#CodeBase/week9/images" nameconflict="makeunique" />
            <cfset form.image=cffile.serverfile>
        </cfif>
        <cfif isdefined('form.newisbn13')>
            <cfquery name="updateisbn13" datasource="#application.dsource#">
                update books set isbn13='#form.newisbn13#' where isbn13='#form.isbn13#'
            </cfquery>
            <cfset form.isbn13=form.newisbn13>
        </cfif>
        <cftry>
            <cfquery name="adddata" datasource="#application.dsource#">
                if not exists(select * from books where isbn13='#form.isbn13#')
                insert into books (isbn13,title) values ('#form.isbn13#','#form.title#');
                update books SET
                    title='#form.title#',
                    weight='#form.weight#',
                    year='#form.year#',
                    isbn='#form.isbn#',
                    pages='#form.pages#',
                    image='#form.image#',
                    publisher='#form.publisher#',
                    description='#form.description#'
                where isbn13='#form.isbn13#'
            </cfquery>

            <!--- Delete all the genres in the genrestobooks --->
            <cfquery datasource="#application.dsource#">
                delete from genrestobooks where bookid='#form.isbn13#'
            </cfquery>
            <cfoutput>
                <!--- Looop over aall the submitted genres and insert each into the database --->
                <cfloop list="#form.genre#" index="i">
                    <cfquery name="putingenres" datasource="#application.dsource#">
                        insert into genrestobooks (bookid,genreid) values ('#form.isbn13#','#i#')
                    </cfquery>
                </cfloop>
            </cfoutput>
            <cfcatch type="any">
                <cfdump var="#cfcatch#">
            </cfcatch>
        </cftry>
    </cfif>
</cffunction>
