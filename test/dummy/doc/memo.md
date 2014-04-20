Customizing dummy application
=============================

    # config/application.rb
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  false
      g.stylesheets     false
      g.javascripts     false
    end
