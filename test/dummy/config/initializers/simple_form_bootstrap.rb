# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.error_notification_class = 'alert alert-danger'
  config.button_class = 'btn btn-default'
  config.boolean_label_class = nil

  config.wrappers :vertical_form, tag: 'div', class: 'mb-3', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'control-label'

    b.wrapper tag: 'div' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :vertical_file_input, tag: 'div', class: 'mb-3', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'control-label'

    b.wrapper tag: 'div' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :vertical_boolean, tag: 'div', class: 'mb-3', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder

    b.wrapper tag: 'div', class: 'checkbox' do |ba|
      ba.use :label_input
    end

    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :vertical_radio_and_checkboxes, tag: 'div', class: 'mb-3', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label_input
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :horizontal_form, tag: 'div', class: 'mb-3 row', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'col-sm-3 col-md-2 col-form-label'

    b.wrapper tag: 'div', class: 'col-sm-9 col-md-10' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_file_input, tag: 'div', class: 'mb-3', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'col-sm-3 col-md-2 control-label'

    b.wrapper tag: 'div', class: 'col-sm-9 col-md-10' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_boolean, tag: 'div', class: 'mb-3', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder

    b.wrapper tag: 'div', class: 'offset-sm-3 col-sm-9 offset-md-2 col-md-10' do |wr|
      wr.wrapper tag: 'div', class: 'checkbox' do |ba|
        ba.use :label_input, class: 'col-sm-9 col-md-10'
      end

      wr.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      wr.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_radio_and_checkboxes, tag: 'div', class: 'mb-3', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder

    b.use :label, class: 'col-sm-3 col-md-2 control-label'

    b.wrapper tag: 'div', class: 'col-sm-9 col-md-10' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  # Wrappers for forms and inputs using the Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :horizontal_form
end
