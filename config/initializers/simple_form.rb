SimpleForm.setup do |config|
  config.wrappers :default, class: "form__group" do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: "form__label"
    b.use :input, class: "form__input", error_class: "form__input--invalid"
    b.use :hint,  wrap_with: { tag: "small", class: "form__hint" }
  end

  # Default configuration
  config.generate_additional_classes_for = [ :input ]
  config.default_wrapper                 = :default
  config.button_class                    = "btn"
  config.label_text                      = lambda { |label, _, _| label }
  config.error_notification_tag          = :div
  config.error_notification_class        = "form__error"
  config.browser_validations             = false
  config.boolean_style                   = :nested
  config.boolean_label_class             = "form__checkbox-label"
end
