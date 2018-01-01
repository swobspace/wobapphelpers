wobapphelpers
=============

Rails helpers and more shared between common wob rails applications. Depends on twitter bootstrap. 

This is the ''master'' branch, for use with rails 5.1.

Requirements
------------

| branch     | rails | ruby   | bootstrap | icons       | 
|------------|-------|--------|-----------|-------------|
| master     | 5.1   | >= 2.3 | v4        | fontawesome |
| 2-0-stable | 5.0   | >= 2.2 | v3        | glyphicons  |        
| 1-0-stable | 4.2   | >= 2.0 | v3        | glyphicons  |

* simple_form >= 3.3

Installation
------------

    gem 'wobapphelpers', github: 'swobspace/wobapphelpers', branch: "2-0-stable"
    gem 'wobapphelpers', github: 'swobspace/wobapphelpers', branch: "1-0-stable"
    gem 'wobapphelpers', github: 'swobspace/wobapphelpers', branch: "master"

Generators
----------

wobapphelpers comes with some generators to install templates and so on:

  * rails g wobapphelpers:install : installs some locales 
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

### Breadcrumbs

Build breadcrumbs in the sense of backtrace, not of deepness. An example for 
classical breadcrumbs is 

    Home >> Posts >> posts#show

Wobapphelpers::Breadcrumbs store a the last 6 urls like this:

    Home >> Posts >> Post(1) >> Others >> Posts

A breadcrumb will only be 
added if the url differs from the last breadcrumb on the stack. 
Wobapphelper::Breadcrumbs should be use in normal display actions like index 
or show, but not in actions which are redirecting to others (not in :create,
:update) and best not to use in form actions like :edit and :new. The latter 
is a question of user experience, not a technical question. The back_link 
from Wobapphelpers::Helpers::ActionViewHelper uses breadcrumbs, if available,
so it would be better to build your own back link if you set breadcrumbs for
:new and :edit.

#### Breadcrumbs for #index

Setting breadcrumbs for index can be done in ApplicationController:

    # myapp/app/controllers/application_controller.rb
    class ApplicationController < ActionController::Base
      include Wobapphelpers::Breadcrumbs
      before_filter :add_breadcrumb_index, only: [:index]
      ...
    end

#### Breadcrumbs for #show

Breadcrumbs for @post must be set after retrieving the object from database.
Pay attention to the correct order of before_actions:

    # myapp/app/controllers/posts_controller.rb
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :edit, :update, :destroy]
      before_action :add_breadcrumb_show, only: [:show]
      ....
    
      private
    
      def set set_post
       @post = Post.find(params[:id])
      end
    end

#### Generic Functions

    # add a breadcrumb manually
    add_breadcrumb(name, url)

    # get the last breadcrumb from stack
    last_breadcrumb_url

#### Styling breadcrumbs

Use builtin styling:

    /* application.css
    *= require wobapphelpers/breadcrumbs
    /* ...

or build your own stuff. :render_breadcrumbs gives you 
a div#breadcrumbs tag.


For :add_breadcrumb_show the variable must be named after your Model. For 
other variable names you have to use :add_breadcrumbs_for, i.e.

    # myapp/app/controllers/posts_controller.rb
    class PostsController < ApplicationController
      ...
      def show
        @other = Post.find(params[:id])
        add_breadcrumbs_for(@other)
      end
      ...
    end


Licence
-------

Wobapphelpers Copyright (C) 2014-2018  Wolfgang Barth

MIT License, see [LICENSE](LICENSE)

