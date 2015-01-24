#!/usr/bin/env ruby

#updog plugin - !updog
class Cinch::Updog
  include Cinch::Plugin
  match /updog/
  def execute(m)
    m.reply "What's updog, #{m.user.nick}?"
  end
end
 
