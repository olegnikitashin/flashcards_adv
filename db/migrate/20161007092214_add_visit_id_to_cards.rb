class AddVisitIdToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :visit_id, :integer
  end
end
