# frozen_string_literal: true

class BotController < Stealth::Controller
  helper :all

  def route
    if current_message.payload.present?
      handle_payloads
      current_message.payload = nil
      return
    end

    if current_session.present?
      step_to session: current_session
    else
      step_to flow: 'hello', state: 'say_hello'
    end

  end

  private

  def handle_payloads
    payload = current_message.payload
    restart_buttons = %w[restart\ pressed restart_button].freeze
    new_start_buttons = %w[new_user dev_button].freeze

    if new_start_buttons.include?(payload)
      step_to flow: 'hello', state: 'say_hello'
    elsif restart_buttons.include?(payload)
      step_to flow: 'goodbye', state: 'say_hello_again'
    else
      return
    end
  end

end
