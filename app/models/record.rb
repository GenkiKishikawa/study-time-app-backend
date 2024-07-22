class Record < ApplicationRecord
  belongs_to :user

  attribute :study_time, :integer
  attribute :start_time, :string
  attribute :end_time, :string
end
