class FundisController < ApplicationController
  before_action :find_fundi, only: [:upvote, :downvote]
  def new
    @skill = Skill.find(params[:skill_id])
    @fundi = @skill.fundis.new
  end
    def show
     @fundi = Fundi.find(params[:id])
     render :show
   end
    def create
      @skill = Skill.find(params[:skill_id])
      @fundi = @skill.fundis.new(fundi_params)
      if @fundi.save
        redirect_to skill_path(@fundi.skill)
      else
        render :new
      end
    end
    def edit
       @skill = Skill.find(params[:skill_id])
       @fundi = @skill.fundis.find(params[:id])
       render :edit
     end
     def update
       @skill = Skill.find(params[:skill_id])
       @fundi = @skill.fundis.find(params[:id])
       if @fundi.update(fundi_params)
         redirect_to skill_path(@fundi.skill)
       else
         render :edit
       end
     end
     def upvote
       @fundi.upvote_by current_user
       redirect_to :back
     end
     def downvote
       @fundi.downvote_by current_user
       redirect_to :back
     end
     def destroy
       @skill = Skill.find(params[:skill_id])
       @fundi = @skill.fundis.find(params[:id])
       @fundi.destroy
       redirect_to skill_path(@fundi.skill)
     end
  private
    def fundi_params
      params.require(:fundi).permit(:first_name, :surname, :location, :contacts, :about, :image)
    end
    def find_fundi
      @fundi = Fundi.find(params[:id])
  end
end
