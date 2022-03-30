class Event < ApplicationRecord

    belongs_to :event_host, class_name: 'User', primary_key: :id, foreign_key: :user_id
    belongs_to :sport
    belongs_to :location, optional: true

    enum status: [ :active, :canceled, :completed ]

    has_many :comments
    has_many :applicants
    
end


# validar en show que el host sea el que cambie el status del applicant