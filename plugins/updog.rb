#!/usr/bin/env ruby

#updog plugin - !updog
class Updog
  include Cinch::Plugin
  match /updog/, method: :whats_updog
  def whats_updog(m)
    m.reply "What's updog, #{m.user.nick}?"
  end
end
 
