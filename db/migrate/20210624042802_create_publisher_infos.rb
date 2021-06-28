class CreatePublisherInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :publisher_infos do |t|
      t.string :address
      t.integer :age
      t.string :gender
      t.text :survey_quest
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
