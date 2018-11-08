class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  attr_accessor :add_user, :remove_user

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    puts @group.users.map(&:id).inspect

    if !@group.users.any?
      @available_users = User.order(:last_name).map{|u| [u.last_name_first_name, u.id]}
    else
      @available_users = User.where("id NOT IN (?)", @group.users.map(&:id)).order(:last_name).map{|u| [u.last_name_first_name, u.id]}
    end
    puts @available_users.inspect
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @available_users = User.order(:last_name).map{|u| [u.last_name_first_name, u.id]}
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|

      if @group.save
        flash[:success] = "Groups successfully created."
        format.html { redirect_to groups_path}
        format.json { render :show, status: :created, location: @group }
        format.js {render :js => "window.location.href='#{groups_path}'"} 
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
        format.js {render 'new'} 
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if !group_params[:add_user].nil?
        user = User.find(group_params[:add_user])
        @group.users << user
        flash[:success] = "User was successfully added."
        format.html { redirect_to @group}
        format.json { render :show, status: :ok, location: @group }
        format.js {render :js => "window.location.href='#{group_path(@group)}'"} 
      elsif !group_params[:remove_user].nil?
        user = User.find(group_params[:remove_user])
        @group.users.delete user
        flash[:success] = "User was successfully removed."
        format.html { redirect_to @group}
        format.json { render :show, status: :ok, location: @group }
        format.js {render :js => "window.location.href='#{group_path(@group)}'"} 
      elsif @group.update(group_params)
        flash[:success] = "Group was successfully updated."
        format.html { redirect_to @group}
        format.json { render :show, status: :ok, location: @group }
        format.js {render :js => "window.location.href='#{group_path(@group)}'"} 
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
        format.js {render 'edit'} 
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      flash[:success] = 'Group was successfully destroyed.'
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :description, :add_user, :remove_user, permission_ids: [])
    end
end
