module UsersHelper
        def collection(select)
                Answer.find(:all, :conditions=>['question_id=?', select])
        end
        def check_edit(x, y)
                 @xx=User.find_by_question_id_and_extra_id(x,y)
                 return @xx.question_answer
        end

end

