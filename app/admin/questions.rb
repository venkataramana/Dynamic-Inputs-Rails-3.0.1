ActiveAdmin.register Question do
        form do |f|
                f.inputs "New Question" do
                        f.input :question_name
                        f.input :question_type, :as=> :select, :collection=> {"text"=>"text_field", "checkbox"=>"checkbox_tag", "radio"=> "radio_button", "select"=>"select_tag"}, :prompt=>"Select type"
                end
                f.buttons
        end
        filter :question_name, :as=> :select, :collection=> Question.all.map{|x| x.question_name}
        filter :question_type, :as=> :select, :collection=> Question.all.map{|x| x.question_type}

end

