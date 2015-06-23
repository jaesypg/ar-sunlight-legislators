require_relative '../config'

# this is where you should use an ActiveRecord migration to

class RenameTitleToTypeLegislators < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    rename_column :legislators, :title, :type
  end
end
