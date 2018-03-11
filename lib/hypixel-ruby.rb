require 'open-uri'
require 'json'
require 'hashie'

# Base object for the api. Only create one for the entire build as it keeps track of your request limits. <b>All methods are avaible at https://github.com/HypixelDev/PublicAPI/tree/master/Documentation/methods, use arguments are parms.</b>
class HypixelAPI
  
  @min = 60
  @requests = 0
  
  # Parses url to Rubyfiy the request, internal so you won't need to use it for much.
  def fetch(url)
    if @min != Time.now.min
      @min = Time.now.min
      @requests = 0
    end
    if @requests < 120
      @requests += 1
      source = (open URI(url)).read
      x = JSON.parse(source, :symbolize_names => true)
      x.extend Hashie::Extensions::DeepFind
      return x
    end
  end
  
  # Creates a new object with your API key. <b>If requests are failing for you, remember to check your key.</b>
  def initialize(api_key)
    @key = api_key
  end
  
  # Builds a url from the request type and parameters. <b>Do not specify your key in the parameters.</b>
  def url(type, hash)
    url = "https://api.hypixel.net/"
    url << type.to_s
    url << "?key=" + @key
    hash.each do |a1, a2|
      url << "&" + a1.to_s + "=" + a2.to_s
    end
    return url
  end
  
# ========================================
#              Main Methods
# ========================================
#  
# Refer to hypixel PublicAPI for parms
# ex: api.player( :uuid => "<uuid here>" )
#
  
  # Fetches boosters and their active times.
  def boosters(args={})
    fetch(url(:"boosters", args))
  end
  
  # Finds a guild by name or player.
  def findguild(args={})
    fetch(url(:"findguild", args))
  end
  
  # Refer to PublicAPI docs on this one.
  def friends(args={})
    fetch(url(:"friends", args))
  end
  
  # Fetches guild data by id.
  def guild(args={})
    fetch(url(:"guild", args))
  end
  
  # Fetches info about current status of API key.
  def key(args={})
    fetch(url(:"key", args))
  end
  
  # Gets top players in each game.
  def leaderboards(args={})
    fetch(url(:"leaderboards", args))
  end
  
  # Fetches player, recommended that you webscrape for uuid before finding them.
  def player(args={})
    fetch(url(:"player", args))
  end
  
  def session(args={})
    fetch(url(:"session", args))
  end
  
  # Gets info on bans/watchdog.
  def watchdogstats(args={})
    fetch(url(:"watchdogstats", args))
  end
  
end

if ENV['TRAVIS']
  api = HypixelAPI.new ENV['HYPIXEL_KEY']
  puts api.player( :uuid => ENV['UUID'] ).deep_find(:bedwars_level)
end
