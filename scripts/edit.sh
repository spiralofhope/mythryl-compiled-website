#!/usr/bin/env sh



:<<'HEREDOC'
TODO:  Various mythryl-specific modifications, removing the old Ruby-specific stuff.

FIXME: I will eventually change my setup to automatically start the compiled website daemon.
When that is done, this file will have to kill the old process and start a new one.

HEREDOC



_setup() {
  __FILE__=$( \readlink  --canonicalize $0 )
  working=$( \dirname  $__FILE__ )/../../

  # TODO - an example has to be given for users to know what's going on in this ini file.
  \. $working/compiled-website.ini

  repo=$working/git
  src=$working/src
  live=$working/live

  \cd  $working
}



_launch_web_browser() {
  \firefox \
    -new-tab "file://$working/live/compiled-website-to-do.html" \
    -new-tab "file://$working/live/compiled-website-bugs.html" \
    -new-tab "file://$working/live/sandbox.html" \
    -new-tab "file://$working/live/index.html" &
  #links -g TODO
  #midori TODO &
  #netsurf TODO &
  # TODO - what other very simple web browsers would be appropriate for quick testing purposes?
}



:<<'HEREDOC'
  "$repo/my/testing.lib" \
  "$repo/my/general.lib" \
  "$repo/my/project.lib" \
  "/z/compiled-website/git/rb/tests/tc_main.rb" \
  "/z/compiled-website/git/rb/tests/tc_common.rb" \
  "/z/compiled-website/git/rb/lib/lib_common.rb" \
  "/z/compiled-website/git/rb/lib/lib_main.rb" \

FIXME - bring ruby-compiled-website back from archives
  ` # The original Ruby project:` \
  "/z/compiled-website/git/rb/main.rb" \

HEREDOC
_launch_editor() {
# I can't start autotest first and then load this stuff into that very-previous instance.  It'll open in the very first instance of geany.  Sigh.
\geany --new-instance \
  "$repo/CHANGELOG.markdown" \
  "$repo/TODO.markdown" \
  "$repo/README.markdown" \
  "$working/compiled-website.txt" \
  "$working/../mythryl.txt" \
  "$repo/demo/header.html" \
  "$repo/demo/footer.html" \
  "$repo/demo/target/css/common.css" \
  ` # TODO:  CSS ` \
  "$repo/demo/source/sandbox.asc" \
  "$repo/my/compiled-website.config" \
  ` # Make sure this first tab is selected.` \
  "$repo/CHANGELOG.markdown" \
  &
}



_launch_autotest() {
  \cd  $working/git/my/

  # lxterminal supports ansi cursor position save/restore.
  # https://github.com/spiralofhope/shell-random/blob/master/autotest.sh
  \lxterminal  --command=" \
    /l/shell-random/git/live/autotest.sh  \"main.my\"  --nodebug" &
}



_teardown() {
  # (All of this would need to be stashed in the _launch_autotest() lxterminal commandline string.
  # TODO/FIXME:  If I'm using lxterminal above, then the stuff below would need to be patient.

  # Sync the examples from my live website into the git repository.
  \cd $working
  \cp  --force  $src/w/compiled-website-demo.asc   $repo/examples/demo.asc
  \cp  --force   $live/compiled-website-demo.html  $repo/examples/demo.html

  # TODO:  Kill the daemon pid on exit.
  # It's not the pid of autotest.sh, it has to be determined from the /tmp pid files.
  \killall  mythryl  mythryld
}



_setup
#_launch_web_browser
_launch_editor
_launch_autotest
#_teardown
