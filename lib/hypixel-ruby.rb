require 'open-uri'
require 'json'

class HypixelAPI
  
  def fetch(url)
    source = (open URI(url)).read
    return JSON.parse(source, :symbolize_names => true)
  end
  def initialize(key)
    @key = key
  end
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
  
  def boosters(args={})
    fetch(url(:"boosters", args))
  end
  
  def findguild(args={})
    fetch(url(:"findguild", args))
  end
  
  def friends(args={})
    fetch(url(:"friends", args))
  end
  
  def guild(args={})
    fetch(url(:"guild", args))
  end
  
  def key(args={})
    fetch(url(:"key", args))
  end
  
  def leaderboards(args={})
    fetch(url(:"leaderboards", args))
  end
  
  def player(args={})
    fetch(url(:"player", args))
  end
  
  def session(args={})
    fetch(url(:"session", args))
  end
  
  def watchdogstats(args={})
    fetch(url(:"watchdogstats", args))
  end
  
end