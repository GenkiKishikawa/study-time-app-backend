class Record < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  attribute :study_time, :integer
  attribute :start_time, :string
  attribute :end_time, :string
end
