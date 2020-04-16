class CreateCommentReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_replies do |t|
      t.text :content
      t.string :image
      t.belongs_to :user
      t.belongs_to :comment

      t.timestamps
    end
  end
end
