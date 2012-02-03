ActiveAdmin.register Answer do
        index do
                column :id
                column :question_id
                column :question_answer
                column :created_at
                default_actions
        end
        #def create
        collection_action :create, :method => :post do
                #@answers = params[:answer]
                        #render :text=>params.inspect and return false
                              # render :text=>params[:answer][:range_start].to_f.inspect and return false
                if !params[:answer][:range_start].blank? && !params[:answer][:range_stop].blank?
                       #for i in params[:answer][:range_start].to_i..params[:answer][:range_stop].to_i
                       (params[:answer][:range_start].to_f..params[:answer][:range_stop].to_f).step(0.2) do |i|
                            Answer.create(:question_id=>params[:answer][:question_id], :question_answer=> i.round(1))
                        end
                else
                             Answer.create(:question_id=>params[:answer][:question_id], :question_answer=> params[:answer][:question_answer])
                end
                redirect_to admin_answers_path
        end
        #end
        form do |f|
                f.inputs "New Answer" do
                        f.input :question_id, :as => :select, :collection=> Question.all.map{|x| [x.question_name,x.id]} , :prompt=> "Select Question"
                        f.input :question_answer
                        f.input :range_start
                        f.input :range_stop
                end
                f.buttons
        end
        filter :question_answer
        filter :question_id, :as => :select, :collection=> Question.all.map{|x| [x.question_name,x.id]}

end

