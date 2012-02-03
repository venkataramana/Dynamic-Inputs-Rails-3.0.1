class UsersController < ApplicationController
        def index
                @questions=Question.find(:all)
                @answers=Answer.find(:all)
                @user=User.new
        end
        def create
                @questions=Question.find(:all)
                @extra=Extratab.count
                @user=params[:a]
                #render :text=> @questions.size.inspect and return false
                 if @questions.size==params[:a].length
                        @user.each do |question_id, a|
                                if !params[:a][question_id].blank?
                                        if params[:a][question_id].class==Array
                                                User.create(:question_id=>question_id, :question_answer=>a.join(","), :extra_id=> @extra+1)
                                        else
                                                User.create(:question_id=>question_id, :question_answer=>a, :extra_id=> @extra+1)
                                        end
                                else
                                        flash[:error]="Error Report: No field should be left blank"
                                        redirect_to "/users" and return false
                                 end
                        end
                        @extra=Extratab.create()
                        #render :text=> @extra.id.inspect and return false
                        redirect_to "/users/#{@extra.id}"
                 else
                         flash[:error]="All fields must be filled"
                         redirect_to "/users"
                end
        end

        def show
                @questions=Question.find(:all)
                @users=User.find(:all, :conditions=>['extra_id=?', params[:id]])
        end
        def edit
                #@xx=User.find_by_question_id_and_extra_id(1,1)
                #render :text=> @xx.inspect and return false
                @questions=Question.find(:all)
                @answers=Answer.find(:all)
                #@users=User.find(:all, :conditions=>['extra_id=? and question_id=?', params[:id], params[:id]])
                @users=User.find(:all, :conditions=>['extra_id=?', params[:id]])
                #render :text=> @users.inspect and return false
        end
        def update
                @user=User.find(:all, :conditions=>['extra_id=?', params[:id]])
                        #render :text=> params[:a].inspect and return false
                @user.each do |a|
                       # render :text=> params[:a][a.question_id.to_s].inspect and return false
                        if params[:a][a.question_id.to_s].class==Array
                                a.update_attribute("question_answer", params[:a][a.question_id.to_s].join(","))
                        else
                                a.update_attribute("question_answer", params[:a][a.question_id.to_s])
                        end
                end
                redirect_to "/users/#{params[:id]}"
        end
end

