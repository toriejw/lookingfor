class CreateApiIssues < ActiveRecord::Migration
  def change
    create_table :api_issues do |t|
      t.string :service

      t.timestamps null: false
    end
  end
end
