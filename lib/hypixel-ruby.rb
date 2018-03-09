require 'open-uri'
require 'json'

# Base object for the api. Only create one for the entire build as it will one day keep track of your request limits. *All methods are avaible at https://github.com/HypixelDev/PublicAPI/tree/master/Documentation/methods, use arguments are parms.*
class HypixelAPI
  
  # Parses url to Rubyfiy the request, internal so you won't need to use it for much.
  def fetch(url)
    source = (open URI(url)).read
    return JSON.parse(source, :symbolize_names => true)
  end
  
  # Creates a new object with your API key. *If requests are failing for you, remember to check your key.*
  def initialize(api_key)
    @key = api_key
  end
  
  # Builds a url from the request type and parameters. *Do not specify your key in the parameters.*
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
