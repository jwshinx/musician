class UserSessionsController < ApplicationController
  def new
    puts "===> USC.new 0 #{params}"
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  def create
    puts "===> USC.create 0 #{params}"
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        # cant have it redirected tu :users (users_controller)
        # or else will be asked to log in as joel
        format.html { redirect_to(:musicians, :notice => 'Login successful.') }
        #format.html { redirect_to(:users, :notice => 'Login successful.') }
 
        #flash[:notice] = 'LLLLogin successful.'
        #redirect_back_or_default :musicians
 
        format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    puts "===> USC.destroy 0 #{params}"

    #@user_session = UserSession.find
    #@user_session.destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful."

    respond_to do |format|
       # cant have it redirected tu :users (users_controller)
       # or else will be asked to log in as joel
      format.html { redirect_to(:musicians, :notice => 'Goodbye!') }
      #format.html { redirect_to(:users, :notice => 'Goodbye!') }

      #puts "===> USC.destroy 0 #{categories_url}"
      #redirect_back_or_default categories_url
      format.xml  { head :ok }
    end
  end
end
