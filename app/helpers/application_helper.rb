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

  def searchlink(obj)
    case obj
    when Post
      return [obj.channel, obj]
    when Channel
      return [obj]
    when Episode
      return [obj.channel, obj]
    when Idea
      return [obj.channel, obj]
    when Solution
      return [obj.channel, obj.challenge, obj]
    end
  end


  def smart_truncate(s, opts = {})
    opts = {:words => 12}.merge(opts)
    if opts[:sentences]
      return s.split(/\.(\s|$)+/)[0, opts[:sentences]].map{|s| s.strip}.join('. ') + '.'
    end
    a = s.split(/\s/) # or /[ ]+/ to only split on spaces
    n = opts[:words]
    v= a[0...n].join(' ') + (a.size > n ? '...' : '')
    v.sub(/&nbsp;/,"")

  end

  def karmarank(score)
    case score
      when(0..100)
        return t("ranks.follower")
      when(101..10)
        return t("ranks.speaker")
      when(51..100)
        return t("ranks.unknown")
      when(score > 200)
        return t("ranks.changemaker")
    end
  end
end
