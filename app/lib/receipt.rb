require 'date'
require 'json'
require_relative '../helpers/json_helper'

class Receipt
  attr_reader :order

  include JsonModelHelper

  def initialize(options = {})
    @order = options if options
  end

  def date
    time = Time.now.strftime('%T')
    date = Time.now.strftime('%D')
    date + ' ' + time
  end

  def customers_count
    @customers.count
  end
end
