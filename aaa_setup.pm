##
# cat /var/lib/openqa/tests/fedora/tests/applications/wxdemo/aaa_setup.pm
##
use base "installedtest";
 use strict;
 use testapi;
 use utils;
 
 sub run {
     my $self = shift;
     # switch to TTY3 for both, graphical and console tests
     $self->root_console(tty=>3);

     assert_script_run("dnf install -y gcc-c++ gcc git python3-pip wxGTK3 wxBase3-devel wxGTK3-devel make cmake", timeout => 240);
     assert_script_run("pip install --user pillow six numpy wheel", timeout => 120);
     assert_script_run("git clone https://github.com/gammasoft71/Examples_wxWidgets.git", timeout => 120);
     assert_script_run("cd Examples_wxWidgets/src/Dialogs/Wizard", timeout => 10);
     assert_script_run("mkdir build && cd build && cmake .. && cmake --build . --config Debug", timeout => 240);
     assert_script_run("cp ./Wizard /tmp && chown test:test /tmp/Wizard", timeout => 10);
     desktop_vt;
     wait_still_screen 2;
     menu_launch_type 'terminal';
     assert_screen 'terminal';
     wait_still_screen 2;
     type_safely 'ls -ltr /tmp && /tmp/Wizard';
     send_key 'ret';
     wait_still_screen 3;
     assert_screen 'Wizard';
 }
 
 
 sub test_flags {
     return { fatal => 1 };
 }
 
 1;
 
 # vim: set sw=4 et:


