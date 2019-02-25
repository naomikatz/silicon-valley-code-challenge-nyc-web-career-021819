require 'pry'

class Startup

  attr_accessor :startup_name
  attr_reader :founder_name, :domain
  @@all = []

  def initialize(founder_name)
    @founder_name = founder_name
    @@all << self
  end

  def pivot(domain, startup_name)
    @domain = domain
    @startup_name = startup_name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder_name)
    self.all.find do |startup|
      # binding.pry
       startup.founder_name == founder_name
    end.startup_name
  end


  def sign_contract(vc_object, type, investment)
    Funding_round.new(self, vc_object, type, investment)
  end

end



# binding.pry
