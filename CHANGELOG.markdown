### 2012-01-31

  - Implemented block_matcher() which is the groundwork for upcoming functionality like not applying markup inside of already-marked-up or html blocks.

### 2012-01-21

  - Implemented short horizontal rules.
  - Implemented paragraphs.


### 2012-01-20

  - Implemented a second-pass "post-processing" system which allows for complex templating.
    - Leveraging that, implemented redirect functionality.


### 2012-01-19

  - Began the groundwork on providing a default template.
  - Implemented basic header/footer search and replace.


### 2012-01-18

  - Working on some basic search/replace to allow variables in the header and footer.
    - This is so that things like the filename can be included in the page's title.
  - Moved the header and footer into the project structure.
  - Implemented source and target directories.


### 2012-01-16

  - More farting around with regexes.  Ugh.


### 2012-01-14

  - Cleaned up the markup language regex stuff.


### 2012-01-14

  - Escaping an asterisk ( * ) was an issue solved by updating from Mythryl 6.0.0 to Mythryl 6.1.0.
    - An escaped slash ( / ) is still not working.  Fine, I'll implement <em> emphasis tags using dashes ( -emphasis- => <em>emphasis</em> ).
  - Ran into a wall with regular expressions.  I don't know how to escape an asterisk ( * ) or slash ( / ).  Asking for help.
  - Anonymous functions, neato.
  - Search/replace regex baby steps.
  - Basic header + content + footer merging.


### 2012-01-08

  - File read/write initial experimentation.


### 2012-01-07

  - The OOP experimentation was moved into my `mythryl-random` repository.

    - Until I really understand things, and can implement oo functionality with multiple parameters, I will not have that stuff cluttering up this project.


### 2011-11-06

  - I got GitHub:pages figured out, so [this project's homepage](http://spiralofhope.github.com/mythryl-compiled-website/index.html) can be there now.

    - Everything had to be moved into the `gh-pages` branch to make this work in the long run.


### 2011-11-03

  - Empty git repository creation.
