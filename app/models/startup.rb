require 'pry'

class Startup

  attr_accessor :startup_name, :domain
  attr_reader :founder_name
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

  def funding_rounds
    Funding_round.all.select do |funding_round|
      funding_round.startup_object == self
    end
  end

  def num_funding_rounds
    funding_rounds.length
  end


  def total_funds
    total_investment_array = funding_rounds.map do |funding_round|
      funding_round.investment
    end
    total_investment_array.inject(:+)
  end

  def investors
    all_investors = funding_rounds.map do |funding_round|
      funding_round.vc_object
    end

    all_investors.uniq

  end

  def big_investors
    self.investors.select do |investor|
      Venture_capitalist.tres_commas_club.include?(investor)
    end
  end


end



# binding.pry
