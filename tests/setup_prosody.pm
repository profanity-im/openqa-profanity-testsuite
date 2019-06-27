# Copyright (C) 2014-2018 SUSE LLC
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
    script_run 'zypper ref';
    script_run 'zypper in -y prosody';
    script_run 'clear';
    script_run 'which prosody';

    assert_screen 'installed', 300;

    script_run 'systemctl start prosody';
    script_run 'systemctl status prosody';

    assert_screen 'startprosody';
}

1;
