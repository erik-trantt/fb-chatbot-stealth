web: bundle exec puma -C config/puma.rb
sidekiq: bundle exec sidekiq -C config/sidekiq.yml -q webhooks -q default -r ./config/boot.rb
release: bundle exec rake db:migrate
