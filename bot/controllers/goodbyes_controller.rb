# fb-bot-steath/bot/controllers/goodbyes_controller.rb

class GoodbyesController < BotController

  def say_goodbye
    send_replies
    step_to state: 'ask_restart'
  end
  
  def ask_restart
    send_replies
    update_session_to state: 'get_restart'
  end
  
  def get_restart
    payload = current_message.payload
    restart_buttons = %w[restart\ pressed restart_button].freeze
    
    unless restart_buttons.include?(payload)
      send_replies
      update_session_to state: 'get_restart'
    end
  end
  
  def say_hello_again
    send_replies
    step_to flow: 'hello', state: 'ask_colour'
  end


end
