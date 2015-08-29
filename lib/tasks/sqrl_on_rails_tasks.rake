namespace :sqrl_on_rails do
  description = "Installs Sqrl On Rails on your app."

  desc description
  task :install => :environment do
    p 'Creating tables...'
    p Dir.entries('db/migrate')
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate("db/migrate", ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
    Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    p 'Tables created.'
  end
end
