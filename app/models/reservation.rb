class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :start_date, presence:true
    validates :end_date, presence:true
    validates :number_of_people, presence:true, numericality: { less_than_or_equal_to: 20, greater_than_or_equal_to: 1 }

    validate :start_end_check
    validate :date_before_start

    def start_end_check
      errors.add(:end_date, "は開始日以降の日を選択してください") unless
      self.start_date < self.end_date 
      
   end

   def date_before_start
    errors.add(:start_date, "は今日以降の日を選択してください") if
    start_date < Date.today
    
   end




end
