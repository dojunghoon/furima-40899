class CreateBuyerDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :buyer_destinations do |t|

      t.timestamps
    end
  end
end
