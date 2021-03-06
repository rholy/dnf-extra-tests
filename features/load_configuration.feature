# -*- coding: utf-8 -*-
#
# Copyright 2015 dnf-extra-tests Authors. See the AUTHORS file found
# in the top-level directory of this distribution and at
# https://github.com/rholy/dnf-extra-tests/.
#
# Licensed under the GNU General Public License;
# either version 2, or (at your option) any later version. See the
# LICENSE file found in the top-level directory of this distribution
# and at https://github.com/rholy/dnf-extra-tests/. No part of
# dnf-extra-tests, including this file, may be copied, modified,
# propagated, or distributed except according to the terms contained
# in the LICENSE file.

Feature: Load configuration
  In order facilitate repetitive configuration, I want it to load a
  configuration from a file.

  Scenario: Load default file
     When I execute DNF with the default configuration
     Then I should have the default configuration file loaded

  Scenario: Load custom file
     When I execute DNF with the following configuration on command line:
       | Option   | Value                     |
       | --config | /tmp/dnf-extra-tests.conf |
     Then I should have the /tmp/dnf-extra-tests.conf configuration file loaded

  Scenario: Load custom relative file
     When I execute DNF with the following configuration on command line:
       | Option   | Value                |
       | --config | dnf-extra-tests.conf |
     Then I should have the dnf-extra-tests.conf configuration file loaded

  Scenario: Load guest's file if the root is different
     When I execute DNF with the following configuration on command line:
       | Option        | Value                |
       | --installroot | /tmp/dnf-extra-tests |
     Then I should have the guest's default configuration file loaded

  Scenario: Load custom host's file if the root is different
     When I execute DNF with the following configuration on command line:
       | Option        | Value                     |
       | --config      | /tmp/dnf-extra-tests.conf |
       | --installroot | /tmp/dnf-extra-tests      |
     Then I should have the /tmp/dnf-extra-tests.conf configuration file loaded

  Scenario: Load custom relative host's file if the root is different
     When I execute DNF with the following configuration on command line:
       | Option        | Value                |
       | --config      | dnf-extra-tests.conf |
       | --installroot | /tmp/dnf-extra-tests |
     Then I should have the dnf-extra-tests.conf configuration file loaded