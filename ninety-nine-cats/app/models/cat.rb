require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    CAT_COLORS = ['white', 'black', 'orange', 'pink', 'multicolor', 'brown', 'gray']
    SEX = ['F', 'M']

    validates :birth_date, :name, :color, :sex, presence: true
    validates :color, inclusion: { in: CAT_COLORS}
    validates :sex, inclusion: { in: SEX }
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        if birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "can't be in the future")
        end
    end

    def age 
        time_ago_in_words(birth_date)
    end

    

    

end
