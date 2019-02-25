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

end






# binding.pry
