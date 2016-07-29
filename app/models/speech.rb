class Speech < ApplicationRecord

  has_attached_file :audio  content_type: { content_type: " /.*/" }
end
