class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :name
      t.date :birthdate
      t.time :breakfast_time
      t.datetime :party_time
      t.timestamp :interview_time
      t.timestamps
    end
  end
end
