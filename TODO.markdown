### TODO

Stuff nearer the top is higher priority.

Sections are entirely another animal.  They're in whatever order I happened to write them in, but are referred-to in the following list.

  - Create a syntax cheat sheet, and use that as a todo list.
      - e.g. https://github.com/spiralofhope/mythryl-compiled-website/blob/master/examples/demo.html

  - Figure out test cases / sanity checking for functions.  I haven't found anything specific.
      - http://mythryl.org/my-Unit_Test.html
      - http://mythryl.org/my-Red-Black_Trees__Testing_on_Empty.html
      - http://mythryl.org/pipermail/mythryl/2009-August/000106.html

  - Review and update all items in `scripts/`

  - Figure out how I can do test cases with Mythryl.

  - Create a project logo.  Just 'cause.

  - A templating engine.

  - Determine how I can build everything as individual components which could be run separately (commandline or .. gui?) and are brought together through this project.

  - Begin two external libraries.
      - Project-specific.
      - Project-nonspecific.
      - I haven't been able to get this functionality working.  See the `mythryl-random/multi-file-test` repository for that experimentation.

  - Implement a configuration file (see notes below).

  - Provide default templating, artwork, css, etc.  De-personalize everything and separate my own customization from the project itself.

  - Implement an in-content templating system.
    - Do content templating the same way I'm doing the header/footer templating.
    - Additionally, do a second and final pass which can go over the header+content+footer and deal with very specialized things like a redirect.
      - Search for something like [[redirect:pagename]] and, if found, do a search/replace for whatever stuff in <head> and replace with a meta redirect.


### Implement a configuration file

  - Move user-serviceable variables out of the code, and implement a separate config.ini-type file.
    - Then I can provide a default config file, and move all my personalized stuff aside.
    - Afterwards I could provide a great default template which refers to those defaults.

The big problem to solve is for complex user variables like statistics/counter code.  Imagine a very complex string.

  - HEREDOCs don't exist in the traditional sense.
  - Escaping quotes is horrifying
  - Being forced to add \n manually sucks.

So.  Fix this by implementing a HEREDOC concept while pushing user variables into a config file.  I'd just have to know how to parse that config file intelligently.

```
variable
{{
content
}}

variable
{{
content
}}
```

So this means I can do something like..

```
site_name
{{{
Example Website
}}}

counter_code
{{{
<!-- Start of StatCounter Code for Default Guide -->
<script type="text/javascript">
var sc_project=xxxxxxx; 
var sc_invisible=0; 
var sc_security="xxxxxxxx"; 
</script>
<script type="text/javascript"
src="http://www.statcounter.com/counter/counter.js"></script>
<noscript><div class="statcounter"><a title="tumblr
statistics" href="http://statcounter.com/tumblr/"
target="_blank"><img class="statcounter"
src="http://c.statcounter.com/xxxxxxx/x/xxxxxxxx/x/"
alt="tumblr statistics"></a></div></noscript>
<!-- End of StatCounter Code for Default Guide -->
}}}
```
