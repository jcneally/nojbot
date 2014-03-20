class Robut::Plugin::Points
  include Robut::Plugin

  desc "show points - List the scoreboard of hipchat points (separate from nojpoints!)"

  def handle(time, sender_nick, message)
    if without_nick(message).match(/^show points/i) and sent_to_me?(message)
      show_points
    else
      sender_nick = sender_nick.gsub(/[^0-9a-z]/i, '')
      if msgmatch = message.match(/@([0-9a-z]+?)\s+?(\-?\+?\d+)/i)
        nick, points = msgmatch.captures
        retort = give_points(sender_nick, nick, points.to_i)
        reply(retort)
      end
    end
  end

  def show_points
    storage.sort_by {|nick, points| -points}.each do |nick, points|
      reply("#{nick}:\t#{points}")
    end
  end

  def give_points(from, to, points)
    if from != to || points < 0
      store_points(to, points)
      return "/me records your points in the background, like a ninja in the shadows."
    else
      if Random.rand(100) <= 25
        store_points(to, points)
        return "/me is amused by your antics.  Points have been awarded."
      else
        return "/me is not amused."
      end
    end
  end

  def store_points(nick, points)
    storage[nick] ||= 0
    storage[nick] += points
    store["points"] = storage
  end

  def storage
    store["points"] ||= {}
  end
end
