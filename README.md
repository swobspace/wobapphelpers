wobapphelpers
=============

Rails helpers and more shared between common wob rails applications. Depends on twitter bootstrap. 

**THIS PLUGIN IS WORK IN PROGRESS AND NOT FUNCTIONAL YET!**
You will loose all your hair and teeth if you use it ;-)

Requirements
------------
* rails >= 4.1
* ruby >= 2.0

System dependencies
-------------------

* bootstrap-sass

Installation
------------

    gem 'wobappshelper', github: 'swobspace/wobappshelper', branch: master

Usage
-----

    # myapp/app/helpers/application_helper.rb:
    module ApplicationHelper
      include Wobapphelpers::Helpers::ApplicationHelper
      ...
    end


Deployment
----------
TBD

Licence
-------

boskop Copyright (C) 2014  Wolfgang Barth

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

This plugin makes use of use of the famous Glyphicon Halflings set which is
include in bootstrap for free of cost. You find more information about
Glyphicon at http://glyphicons.com/
