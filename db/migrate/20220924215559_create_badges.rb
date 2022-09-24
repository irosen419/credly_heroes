class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|

      t.timestamps
    end
  end
end
