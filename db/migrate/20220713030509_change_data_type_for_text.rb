class ChangeDataTypeForText < ActiveRecord::Migration[7.0]
   change_table :posts do |post|
    post.change :Text, :text
  end
end
