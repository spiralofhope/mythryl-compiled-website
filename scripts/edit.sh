#!/usr/bin/env sh

:<<'heredoc'
TODO:  Various mythryl-specific modifications, removing the old Ruby-specific stuff.

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

#/l/Linux/bin/Firefox/firefox \
        #-new-tab "file://$working/live/compiled-website-to-do.html" \
        #-new-tab "file://$working/live/compiled-website-bugs.html" \
        #-new-tab "file://$working/live/sandbox.html" \
        #-new-tab "file://$working/live/index.html" &
#links -g ...
#midori &
#netsurf &

# I can't start autotest first and then load this stuff into that very-previous instance.  It'll open in the very first instance of geany.  Sigh.
\geany --new-instance \
  "$repo/CHANGELOG.markdown" \
  "$repo/TODO.markdown" \
  "$working/compiled-website.txt" \
  "$working/../../mythryl.txt" \
  "$repo/my/testing.lib" \
  "$repo/my/general.lib" \
  "$repo/my/project.lib" \
  "$repo/demo/header.html" \
  "$repo/demo/footer.html" \
  "$repo/demo/target/css/common.css" \
  ` # TODO:  CSS ` \
  "$repo/demo/source/sandbox.asc" \
  "$repo/my/compiled-website.config" \
  ` # The original Ruby project: ` \
  "/z/compiled-website/git/rb/main.rb" \
  "/z/compiled-website/git/rb/tests/tc_main.rb" \
  "/z/compiled-website/git/rb/tests/tc_common.rb" \
  "/z/compiled-website/git/rb/lib/lib_common.rb" \
  "/z/compiled-website/git/rb/lib/lib_main.rb" \
  "$repo/CHANGELOG.markdown" \
  &

cd $working/git/my/

# lxterminal supports ansi cursor position save/restore.
# https://github.com/spiralofhope/shell-random/blob/master/autotest.sh
lxterminal --command=" \
  /l/Linux/bin/sh/live/autotest.sh \"main.my\" --nodebug" &

# (All of this would need to be stashed in the above lxterminal commandline string.
# TODO/FIXME:  If I'm using lxterminal above, then the stuff below would need to be patient.

# Sync the examples from my live website into the git repository.
#\cd $working
#\cp --force  $src/w/compiled-website-demo.asc   $repo/examples/demo.asc
#\cp --force   $live/compiled-website-demo.html  $repo/examples/demo.html

# TODO:  Kill the daemon pid on exit.
# It's not the pid of autotest.sh, it has to be determined from the /tmp pid files.
#\killall mythryl mythryld
