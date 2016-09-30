# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ProgramistokChannel < ApplicationCable::Channel
  def subscribed
    stream_from "familiada"
  end

  def custom_action(data)
    # we can call this action from out react component, using this.perform('custom_action', {data})
  end

end

