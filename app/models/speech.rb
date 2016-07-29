class Speech < ApplicationRecord
  has_attached_file :audio
  do_not_validate_attachment_file_type :audio

  serialize :key_points, Array
end
