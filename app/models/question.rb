class Question < ActiveRecord::Base
        has_many :answers, :dependent=> :destroy
        has_one :user, :dependent=> :destroy
end

