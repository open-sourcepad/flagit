class AddSummarizedTextToSpeeches < ActiveRecord::Migration[5.0]
  def change
    add_column :speeches, :summarized_text, :text
  end
end
