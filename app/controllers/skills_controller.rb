class SkillsController < ApplicationController
    def index
        @skills = Skill.all
        render :index
    end
    def show
     @skill = Skill.find(params[:id])
     render :show
   end
   def new
     @skill = current_user.skill.build
     render :new
   end
   def create
     @skill = current_user.skill.build(skill_params)
     if @skill.save
       redirect_to  skills_path
     else
       render :new
     end
   end
   def edit
      @skill = Skill.find(params[:id])
      render :edit
    end
    def update
      @skill= Skill.find(params[:id])
      if @skill.update(skill_params)
        redirect_to skills_path
      else
        render :edit
      end
    end
    def destroy
      @skill = Skill.find(params[:id])
      @skill.destroy
      redirect_to skills_path
    end


  private
    def skill_params
      params.require(:skill).permit(:name)
    end

  end
