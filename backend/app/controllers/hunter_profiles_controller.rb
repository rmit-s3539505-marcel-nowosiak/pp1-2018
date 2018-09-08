class HunterProfilesController < ApplicationController

  def index
    @hunter_profile = HunterProfile.find(params[:id])
  end

  def show
    @hunter_profile = HunterProfile.find(params[:id])
    @user = @hunter_profile.user
  end

  def new
    @hunter_profile = HunterProfile.new
    @skills = Skill.all.map{|u| { id: u.id, name: u.name, industry: u.industry}}
  end

  def create
    @hunter_profile = HunterProfile.new(params[:hunter_profile])
    if params[:add_skill]
      @hunter_profile.skill.build
    elsif params[:remove_skill]
    else
      if @hunter_profile.save
        flash[:notice] = "Job hunter profile created."
        redirect_to @hunter_profile and return
      end
    end
    render :action => 'new'
  end

  def edit
    @hunter_profile = HunterProfile.find(params[:id])
  end

  def update
    @hunter_profile = HunterProfile.find(params[:id])
    if params[:add_skill]
      unless params[:hunter_profile][:skill_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
        for attribute in params[:hunter_profile][:skill_attributes]
          @hunter_profile.skill.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
        end
      end
      @hunter_profile.skill.build
    elsif params[:remove_skill]
      removed_skill = params[:hunter_profile][:skill_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
      Skill.delete(removed_skill)
      flash[:notice] = "Skill removed."
        for attribute in params[:hunter_profile][:skill_attributes]
          @hunter_profile.skill.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
        end
    else
      if @hunter_profile.update_attributes(params[:hunter_profile])
        flash[:notice] = "Successfully updated job hunter profile."
        redirect_to @hunter_profile and return
      end
    end
    render :action => 'edit'
  end

  def destroy
    @hunter_profile = hunter_profile.find(params[:id])
    @hunter_profile.destroy
    flash[:notice] = "Successfully destroyed job hunter profile."
    redirect_to hunter_profiles_url
  end
end
