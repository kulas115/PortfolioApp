class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

require 'rubygems'
require 'httparty'

class God
  include HTTParty
  base_uri "pairguru-api.herokuapp.com/api/v1/movies/"

  def content
    self.class.get('Godfather')
  end
end

god = God.new
puts god.content
