module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

  def form_error_notification(object)
    return unless object&.errors&.any? # Ensures object and errors are present

    tag.div class: "error-message" do
      object.errors.full_messages.to_sentence.capitalize
    end
  end
end
