#!/usr/bin/env ruby

require 'cinch'
require 'cinch-twitterstatus'

#updog plugin - !updog
class Updog
  include Cinch::Plugin
  match /updog/, method: :whats_updog
  def whats_updog(m)
    m.reply "What's updog, #{m.user.nick}?"
  end
end

#here's the bot
bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.nick  = 'botallybot'
    c.channels = ["#botallytest"]

    c.plugins.plugins = [ 
      Cinch::Plugins::TwitterStatus,
      Updog
    ]

    #needed to look up tweets
    c.plugins.options[Cinch::Plugins::TwitterStatus] = { 
      consumer_key:    ENV['TWITTER_CONSUMER_KEY'],
      consumer_secret: ENV['TWITTER_CONSUMER_SECRET'],
      access_token:    ENV['TWITTER_ACCESS_TOKEN'],
      access_secret:   ENV['TWITTER_ACCESS_TOKEN_SECRET'] 
    }

  end
end

bot.start
