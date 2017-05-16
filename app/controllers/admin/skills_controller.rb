class Admin::SkillsController < Admin::ApplicationController

	def index
		@skills = Skill.all
	end

	def new
		@skill = Skill.new
	end

	def create
		@skill = Skill.new(skills_params)
		if @skill.save
			flash[:success] = "The skill was added"
			redirect_to admin_skills_path
		else
			flash[:warning] = "The skill was not added"
			render 'new'
		end
	end

	private
		def skills_params
			params.require(:skill).permit(:name)
		end
end
