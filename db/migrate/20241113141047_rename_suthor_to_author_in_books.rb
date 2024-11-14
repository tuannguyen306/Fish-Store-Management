class RenameSuthorToAuthorInBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :suthor, :author
  end
end


