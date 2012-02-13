### TODO

Stuff nearer the top is higher priority.

Sections are entirely another animal.  They're in whatever order I happened to write them in, but are referred-to in the following list.

  - Create a syntax cheat sheet, and use that as a todo list.
      - e.g. https://github.com/spiralofhope/mythryl-compiled-website/blob/master/examples/demo.html

  - Figure out test cases / sanity checking for functions.  I haven't found anything specific.
      - http://mythryl.org/my-Unit_Test.html
      - http://mythryl.org/pipermail/mythryl/2009-August/000106.html

  - Review and update all items in `scripts/`

  - Create a project logo.  Just 'cause.

  - A templating engine.

  - Determine how I can build everything as individual components which could be run separately (commandline or .. gui?) and are brought together through this project.

  - Begin external libraries.
      - Project-specific.
      - Project-specific, test cases.
      - Project-nonspecific, general.
      - Project-nonspecific, test cases.
      - I haven't been able to get this functionality working.  See the `mythryl-random/multi-file-test` repository for that experimentation.

  - Implement a configuration file (see notes below).

  - Provide default templating, artwork, css, etc.  De-personalize everything and separate my own customization from the project itself.

  - Implement an in-content templating system.
    - Do content templating the same way I'm doing the header/footer templating.
    - Additionally, do a second and final pass which can go over the header+content+footer and deal with very specialized things like a redirect.
      - Search for something like [[redirect:pagename]] and, if found, do a search/replace for whatever stuff in <head> and replace with a meta redirect.

  - FIXME:  I have a major looming issue with regular expression search/replace
            match for xx.*xx and replace with xxyyxx
            I would expect xxzzxxzzxx => xxyyxxyyxx but instead I get xxyyxxzzxx (the second xxzzxx is not matched)
