# Copyright (C) 2019 Michael Vetter <jubalh@iodoru.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, see <http://www.gnu.org/licenses/>.

use base 'basetest';
use strict;
use testapi;

sub first_instance {
    script_run 'profanity', timeout => 0;
    assert_screen 'launchprofanity';

    type_string "/connect schiller\@localhost\n";
    assert_screen 'connect';
    type_string "\n";
    assert_screen 'connectfail';

    type_string "/tls always\n";
    assert_screen 'connectfail2';

    type_string "/connect schiller\@localhost\n";
    assert_screen 'connect';
    type_string "glocke\n";
    assert_screen 'connectschillersuccess';
}

sub second_instance {
    script_run 'profanity', timeout => 0;
    assert_screen 'launchprofanity';

    type_string "/connect goethe\@localhost\n";
    wait_still_screen 10;
    type_string "faust\n";
    assert_screen 'connect-goethe-success';
}

sub run {
    first_instance;

    select_console "console2";
    type_string "root\n";
    type_string "nots3cr3t\n";
    wait_still_screen(2);
    type_string "clear\n";

    assert_screen 'logged-in', 300;

    second_instance;
}

1;
