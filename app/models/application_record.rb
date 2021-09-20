class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  has_secure_password
end
