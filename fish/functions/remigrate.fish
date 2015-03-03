function remigrate
  env RAILS_ENV test rake db:rollback
  env RAILS_ENV test rake db:migrate
  env RAILS_ENV development rake db:rollback
  env RAILS_ENV development rake db:migrate
end
