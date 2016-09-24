class AddCustomNotificationJob < ApplicationJob

  def perform(content)
    content = content.present? ? content : '<h1> custom notification </h1>'
    ActionCable.server.broadcast('familiada',
      action: 'ADD_CUSTOM_NOTIFICATION', content: content
    )
  end

end
