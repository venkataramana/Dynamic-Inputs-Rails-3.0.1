class User < ActiveRecord::Base
        belongs_to :question
       validates_presence_of :question_answer
end

