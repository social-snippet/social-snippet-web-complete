host = "localhost"
port = 27017

database_name = case ::Padrino.env
  when :development then "completer_development"
  when :production  then "completer_production"
  when :test        then "completer_test"
end

::Mongoid::Config.sessions =
  if ENV["MONGO_URI"]
    {default: {uri: ENV["MONGO_URI"]}}
  else
    {default: {hosts: ["#{host}:#{port}"], database: database_name}}
  end

