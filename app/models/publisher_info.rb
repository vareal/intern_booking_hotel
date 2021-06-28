class PublisherInfo < ApplicationRecord
  belongs_to :user

  scope :get_req_publishers, -> { where status: 0 }

  enum status: {pending: 0, saved: 1}
end
