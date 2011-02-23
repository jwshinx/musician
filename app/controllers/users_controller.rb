class UsersController < ApplicationController
  before_filter :require_joel_user, :only => [:destroy, :index]
  # GET /users
  # GET /users.xml

  #def get_role_dropdown
  #  @roles = Role.find(:all, :order => "name ASC").map do |r|
  #    [r.name, r.id]
  #  end
  #end

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    #@roles = get_role_dropdown

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    #@roles = get_role_dropdown
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    #@role = Role.find(params[:user][:role_id])
    #@user.role = @role

    respond_to do |format|
      if @user.save
        # replaced redirect_to(@user, with...index, not show.
        format.html { redirect_to(:users, :notice => 'Registration successful.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        #@roles = get_role_dropdown
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    #@role = Role.find(params[:user][:role_id])
    #@user.role = @role

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        #@roles = get_role_dropdown
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
