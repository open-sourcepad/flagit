class AddAttachments < ActiveRecord::Migration[5.0]
  def change
    add_attachment :speeches, :audio
  end
end
