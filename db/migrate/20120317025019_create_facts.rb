class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.text :description

      t.timestamps
    end
  end
end
