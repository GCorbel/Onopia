Dir["lib/**/*.rb"].each do |path|
  require_dependency path
end
