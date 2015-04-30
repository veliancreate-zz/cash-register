env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/till_#{env}")
DataMapper.finalize
