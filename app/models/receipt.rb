require 'date'
require 'json'
require_relative '../helpers/json_helper'

class Receipt
  include DataMapper::Resource

  property :id, Serial
  property :date, Text
  property :number_of_customers
  attr_accessor :date

  include JsonModelHelper

  def date
    time = Time.now.strftime('%T')
    date = Time.now.strftime('%D')
    @date = date + ' ' + time
  end
end
