class CreateSqrlOnRailsSqrlAuthentications < ActiveRecord::Migration
  def change
    create_table :sqrl_on_rails_sqrl_authentications do |t|
      t.string :csrf
      t.string :nut
      t.string :session
      t.boolean :authenticated

      t.timestamps null: false
    end
  end
end
