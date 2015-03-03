function both_env
  env RAILS_ENV=test        $argv
  env RAILS_ENV=development $argv
end
