class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :score, :default => 0
      t.belongs_to :user
      t.belongs_to :question

      t.timestamps
    end
  end
end
