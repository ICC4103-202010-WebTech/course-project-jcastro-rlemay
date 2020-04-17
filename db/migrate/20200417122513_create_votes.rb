class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.date :answerDate
      t.belongs_to :poll
      t.belongs_to :user

      t.timestamps
    end
  end
end
