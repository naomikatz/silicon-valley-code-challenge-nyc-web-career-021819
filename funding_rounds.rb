require 'pry'
require_relative './startup.rb'
require_relative './venture_capitalists.rb'

class Funding_round

  attr_accessor :type
  attr_reader :startup_object, :vc_object, :investment

  @@all = []

  def initialize(startup_object, vc_object, type, investment)
    @startup_object = startup_object
    @vc_object = vc_object
    @type = type
    self.investment = investment
    @@all << self
  end

  def self.all
    @@all
  end

  def investment=(investment)
    if investment < 0
      puts "Investment cannot be negative"
    else
      @investment = investment.to_f
    end
  end


end

# binding.pry
