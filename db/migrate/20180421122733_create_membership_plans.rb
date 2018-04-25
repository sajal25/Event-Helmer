class CreateMembershipPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :membership_plans do |t|
      t.string :name
      t.integer :price_per_six_month
      t.string :feature_1
      t.string :feature_2
      t.string :feature_3
      t.string :feature_4
      t.string :feature_5

      t.timestamps
    end
  end
end
