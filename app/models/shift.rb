class Shift < ApplicationRecord
    validates :login_id, presence:true
    validates :name, presence:true
    validates :work_date, presence:true
    validates :start_time, presence:true
    validates :end_time, presence:true
end
