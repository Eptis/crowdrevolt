module ApplicationHelper
  def broadcast(channel, &block)
    # raise channel.inspect
    message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN}}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end

  def admin?
    controller.class.name.split("::").first=="Admin"
  end
end
