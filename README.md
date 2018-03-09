# hypixel-rubyed [![Build Status](https://travis-ci.org/PenguinOwl/hypixel-rubyed.svg?branch=master)](https://travis-ci.org/PenguinOwl/hypixel-rubyed)
A barebones API wrapper for the Hypixel Public API.
# Getting started
Im not a big fan of sifting through documentation, so lets get to the point.
```code:ruby
api = HypixelAPI.new("API KEY HERE")
level = api.player(:uuid => "some uuid")[:stats][:bedwars][:bedwars_level].to_i
```
Nice, consice, and barebones.
# Installation
Add the following to your Gemfile
```
  gem "hypixel-ruby"
```
Run `bundler install` and require it in your source with `require 'hypixel-ruby'` and get cracking!
# Resources 
