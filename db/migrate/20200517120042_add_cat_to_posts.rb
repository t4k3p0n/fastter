# frozen_string_literal: true

class AddCatToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :cat, :string
  end
end
