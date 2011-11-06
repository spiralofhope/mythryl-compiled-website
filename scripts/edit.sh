#!/bin/env sh

:<<'heredoc'
----
TODO:  Review this now that I'm doing things in Mythryl.
----








FIXME: I will eventually change my setup to automatically start the compiled website daemon.
When that is done, this file will have to kill the old process and start a new one.

heredoc

__FILE__=$( \readlink -f $0 )
working=$( \dirname $__FILE__ )/../../

\. $working/compiled-website.ini

repo=$working/git
src=$working/src
live=$working/live

# ---

\cd $working

/home/user/bin/firefox/firefox \
        -new-tab "file://$working/live/compiled-website-to-do.html" \
        -new-tab "file://$working/live/compiled-website-bugs.html" \
        -new-tab "file://$working/live/sandbox.html" \
        -new-tab "file://$working/live/index.html" &
#links -g ...
#midori &
#netsurf &

# I can't start autotest first and then load this stuff into that very-previous instance.  It'll open in the very first instance of geany.  Sigh.
\geany --new-instance \
  "$repo/CHANGELOG" \
  "$working/compiled-website.txt" \
  "$live/css/common.css" \
  "$repo/rb/header_and_footer.rb" \
  "$src/w/compiled-website-to-do.asc" \
  "$src/w/compiled-website-bugs.asc" \
  "$src/w/sandbox.asc" \
  "$repo/rb/lib/lib_main.rb" \
  "$repo/rb/tests/tc_main.rb" \
  "$repo/CHANGELOG" \
  &

# TODO:  My autotest script is still to be prepared and made public.
/home/user/bin/autotest.sh "$working/git/my/main.my" --nodebug

# Sync the examples from my live website into the git repository.
\cd $working
\cp --force  $src/w/compiled-website-demo.asc   $repo/examples/demo.asc
\cp --force   $live/compiled-website-demo.html  $repo/examples/demo.html

# TODO:  Kill just the ruby pid on exit.
# It's not the pid of autotest.sh, it has to be determine from the /tmp pid files.
#\killall ruby