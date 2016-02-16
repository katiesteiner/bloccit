class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :title
      t.text :body
      t.references :post, index: true

      t.timestamps
    end
  end
end