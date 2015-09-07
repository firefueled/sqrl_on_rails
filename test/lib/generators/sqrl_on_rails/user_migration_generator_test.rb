require 'test_helper'
require 'generators/user_migration/user_migration_generator'

module SqrlOnRails
  class UserMigrationGeneratorTest < Rails::Generators::TestCase
    tests UserMigrationGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
