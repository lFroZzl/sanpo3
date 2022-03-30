class Applicant < ApplicationRecord
    
    belongs_to :user, class_name: 'User', primary_key: :id, foreign_key: :my_id
    belongs_to :event

    enum status: [ :pending, :approved, :rejected ]

end


# cuando un aplicante es aceptado en un evento no ser aceptado en otro
# tener la edad correspondiente al evento