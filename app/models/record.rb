class Record < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  attribute :study_minutes, :integer
end
