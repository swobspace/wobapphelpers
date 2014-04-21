wobapphelpers
=============

Rails helpers and more shared between common wob rails applications. Depends on twitter bootstrap. 

**THIS PLUGIN IS WORK IN PROGRESS AND NOT FUNCTIONAL YET!**
You will loose all your hair and teeth if you use it ;-)

Requirements
------------
* rails >= 4.1
* ruby >= 2.0
* bootstrap v3; must be included by by yourself (via gem or manually)
* simple_form >= 3.1


Installation
------------

    gem 'wobapphelpers', github: 'swobspace/wobapphelpers', branch: master

and may be

    gem 'bootstrap-sass', '~> 3.1.1'
    gem 'simple_form', '~> 3.1'

Generators
----------

wobapphelpers comes with some generators to install templates and so on:

  * rails g wobapphelpers:init : installs some locales 
  * rails g wobapphelpers:scaffold_templates : installs scaffold erb and templates 
and a controller template using simple_form and bootstrap, responders and the 
famous respond_with method.

Usage
-----

### Helpers

Helpers to ease use of glyphicon icons, predefined action links (i.e. edit_link),
show_flash, and more ...

    # myapp/app/helpers/application_helper.rb:
    module ApplicationHelper
      include Wobapphelpers::Helpers::All
      ...
      #or use specific modules
      include Wobapphelpers::Helpers::IconHelper
      include Wobapphelpers::Helpers::ActionViewHelper
      ...
    end

### Responders

Predefined settings for FlashResponder in gem 'responders' 
(https://github.com/plataformatec/responders) including german locales.

    # myapp/app/controllers/application_controller.rb
    class ApplicationController < ActionController::Base
      self.responder = Wobapphelpers::Responders
      ...
    end


Licence
-------

Wobappshelper Copyright (C) 2014  Wolfgang Barth

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
