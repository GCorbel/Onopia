Dir["#{Rails.root}/lib/**/*.rb"].each do |path|
  require path
end
