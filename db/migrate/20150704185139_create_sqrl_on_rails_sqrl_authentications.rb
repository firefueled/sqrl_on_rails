class CreateSqrlOnRailsSqrlAuthentications < ActiveRecord::Migration
  def change
    create_table :sqrl_on_rails_sqrl_authentications do |t|
      t.string :csrf, null: false
      t.string :nut, null: false, index: true
      t.string :session, null:false
      t.boolean :authenticated, null:false, default: false

      t.timestamps null: false
    end
  end
end
