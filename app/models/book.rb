require 'date'

class Book < ApplicationRecord
    validate :validateTitle, :validateAuthor, :validatePublishedDate
    validates :title, presence: true
    validates :author, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 1000000 }
    validates :published_date, presence: true

    def validateTitle
        if !title.is_a? String
            errors.add(:title, "must be a string")
        end
    end

    def validateAuthor
        if !author.is_a? String
            errors.add(:author, "must be a string")
        end
    end

    def validatePublishedDate
        logger.debug "String Date: #{published_date}"
        date = Date.parse(published_date.to_s) # rescue errors.add(:published_date, 'must be a valid date')
        if !date.before?(Date.today)
            errors.add(:published_date, "must be before the current date")
        end
    end
end
