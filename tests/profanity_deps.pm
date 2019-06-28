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

sub run {
    assert_script_run 'zypper in -y automake autoconf libtool glib2-devel gtk2-devel libcurl-devel libexpat-devel libgpgme-devel libmesode-devel libnotify-devel libotr-devel libuuid-devel ncurses-devel python3-devel readline-devel autoconf-archive libsignal-protocol-c-devel libgcrypt-devel git gcc make', 600;

    assert_script_run 'clear';
    assert_script_run 'pwd';
    assert_script_run 'git clone https://github.com/profanity-im/profanity', 300;
    assert_screen 'gitclonedprof';

    assert_script_run 'cd profanity';
    assert_script_run 'autoreconf -fi';
    assert_script_run './configure';
    assert_script_run 'make';
    assert_screen 'makeprofanity';
    assert_script_run 'make install';
}

1;
