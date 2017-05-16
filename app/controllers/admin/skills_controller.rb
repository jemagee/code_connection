class Admin::SkillsController < Admin::ApplicationController

	def index
		@skills = Skill.all
	end

	def new
		@skill = Skill.new
	end

	def create
		Skill.create(skills_params)
		flash[:success] = "The skill was added"
		redirect_to admin_skills_path

	end

	private
		def skills_params
			params.require(:skill).permit(:name)
		end
end
