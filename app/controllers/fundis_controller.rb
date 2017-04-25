class FundisController < ApplicationController
    def show
     @fundi = Fundi.find(params[:id])
     render :show
   end
   def new
     @skill = Skill.find(params[:skill_id])
     @fundi = @skill.fundis.new
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

  private
    def fundi_params
      params.require(:fundi).permit(:first_name, :surname, :location, :contacts, :about)
    end
  end
