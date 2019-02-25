require 'pry'

class Venture_capitalist

  attr_accessor :vc_name, :vc_total_worth

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select do |venture_capitalist|
      venture_capitalist.vc_total_worth >= 1000000000
    end
  end

  def offer_contract(startup_object, type, investment)
    Funding_round.new(startup_object, self, type, investment)
  end

  def funding_rounds
    Funding_round.all.select do |funding_round|
      funding_round.vc_object == self
    end
  end

  def portfolio
    portfolio_array = self.funding_rounds.map do |funding_round|
      funding_round.startup_object
    end
    portfolio_array.uniq
  end

  def biggest_investment
    sorted_investments = self.funding_rounds.sort_by do |funding_round|
      funding_round.investment
    end
    sorted_investments.last
  end

  def invested(domain)
    correct_funding_rounds = self.funding_rounds.select do |funding_round|
      funding_round.startup_object.domain == domain
    end

    investment_array = correct_funding_rounds.map do |funding_round|
      funding_round.investment
    end

    investment_array.inject(:+)
  end


end
