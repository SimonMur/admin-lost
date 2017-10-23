class AddPostsToPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :posts, :string
  end
end
