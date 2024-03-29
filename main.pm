# Copyright (C) 2014-2018 SUSE LLC
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
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

use strict;
use testapi;
use autotest;

my $distri = testapi::get_required_var('CASEDIR') . '/lib/profdistrib.pm';
require $distri;
testapi::set_distribution(profdistrib->new());

autotest::loadtest 'tests/boot.pm';
autotest::loadtest 'tests/setup_prosody.pm';
autotest::loadtest 'tests/profanity_deps.pm';
autotest::loadtest 'tests/profanity.pm';
autotest::loadtest 'tests/profanity_msg.pm';

1;
