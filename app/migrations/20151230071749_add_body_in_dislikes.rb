class AddBodyInDislikes < ActiveRecord::Migration
  def change
  	add_column :dislikes, :body, :text
  end
end
