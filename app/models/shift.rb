class Shift < ApplicationRecord
    belongs_to :user, foreign_key: "login_id", primary_key: "login_id"
    
    validates :login_id, presence:true
    validates :name, presence:true
    validates :work_date, presence:true
    validates :start_time, presence:true
    validates :end_time, presence:true
end
