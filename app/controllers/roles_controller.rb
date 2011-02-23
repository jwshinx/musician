class RolesController < ApplicationController
=begin
  def create
    @role = Role.new(params[:role])
    respond_to do |format|
      if @role.save
        format.html { redirect_to(@role, :notice => 'Role was successfully created.') }
        format.xml  { render :xml => @role, :status => :created, :location => @role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end
=end

  def commit_assign
    puts "===> RC.commit_assign 0 #{@params}"
    params.each_pair { |k,v| puts "===>    [#{k}]:[#{v}]" }
    puts "===> RC.commit_assign 1"
    @user = User.find(params[:user])
    puts "===> RC.commit_assign 2"
    @role = Role.find(params[:role])
    puts "===> RC.commit_assign 3"
    @user.role = @role

    respond_to do |format|
      if @user.save
        puts "===> RC.commit_assign 4"
        format.html { redirect_to(roles_url, :notice => "Role #{@role.name}  was successfully assigned to #{@user.username}.") }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        puts "===> RC.commit_assign 5"
        flash[:notice] = "That Role assignment failed."
        format.html { render :action => "assign" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  def assign
    puts "===> RC.assign 0 #{@params}"
    @roles = Role.find(:all, :order => "name ASC")
    @users = User.find(:all, :order => "username ASC")
  end
  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roles }
    end
  end

  # GET /roles/1
  # GET /roles/1.xml
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @role }
    end
  end

  # GET /roles/new
  # GET /roles/new.xml
  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @role }
    end
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /roles
  # POST /roles.xml
  def create
    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        format.html { redirect_to(@role, :notice => 'Role was successfully created.') }
        format.xml  { render :xml => @role, :status => :created, :location => @role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.xml
  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to(@role, :notice => 'Role was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.xml
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to(roles_url) }
      format.xml  { head :ok }
    end
  end
end
