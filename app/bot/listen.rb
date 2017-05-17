# app/bot/listen.rb
require "facebook/messenger"
include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: "EAAGgD8qh3XoBAHFszwl3BZCJAeCxSGuZBpENGOIbLkh3bnega1NGLdZBhF3PsdZAYLk1DOZCAWDO6ZBdRLJfX8ae8ZBc1HWc9Qa4nVWZAFEL9BicW9FyvTwJ6ZCKBue8SBBfu8rpsDNYZAxYJY4xJ6hdAZAj8AWTfN3GcAeaQh1D1b1hwZDZD")
#Bot.on :message do |message|
#   puts "got your message!"
# message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
# message.sender      # => { 'id' => '1008372609250235' }
# message.sent_at     # => 2016-04-22 21:30:36 +0200
# message.text        # => 'Hello, bot!'
Bot.on :message do |message|
  
  brain = Brain.new
  brain.set_message(message)
  brain.start_typing
  brain.process_message
  brain.stop_typing
  
  
end

Bot.on :postback do |message|
  
  brain = Brain.new
  brain.set_postback(message)
  brain.start_typing
  brain.process_postback
  brain.stop_typing
 
  
end


  
  # client = Facebook::Client.new
  
  # user_data = client.get_user(message.sender["id"])
  # user_name = user_data["first_name"]
  
  
  # Bot.deliver({
  #   recipient: message.sender,
  #   message: {
  #     text: "Hi #{user_name}.",
  #   # attachment: {
  #     # type: 'image',
  #   #   payload: {
  #   #   url: 'http://wta.wpengine.netdna-cdn.com/wp-content/uploads/2016/06/File-Jun-24-2-50-37-PM-1024x576.jpeg'
  # # }
  # #}
  #   }
  # }, access_token: ENV["ACCESS_TOKEN"])
  #end