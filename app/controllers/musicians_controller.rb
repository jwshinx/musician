class MusiciansController < ApplicationController
  before_filter :require_user,
    :only => [:create, :new, :edit, :update, :destroy]
  def get_category_dropdown
    categories = Category.find(:all, :order => "name ASC").map do |x|
      [x.name, x.id]
    end
  end
  # GET /musicians
  # GET /musicians.xml
  def index
    puts "===> MC.index 0"
    @musicians = Musician.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @musicians }
    end
  end

  # GET /musicians/1
  # GET /musicians/1.xml
  def show
    @musician = Musician.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @musician }
    end
  end

  # GET /musicians/new
  # GET /musicians/new.xml
  def new
    @musician = Musician.new
    @categories = get_category_dropdown

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @musician }
    end
  end

  # GET /musicians/1/edit
  def edit
    @musician = Musician.find(params[:id])
    @categories = get_category_dropdown

  end

  # POST /musicians
  # POST /musicians.xml
  def create
    @musician = Musician.new(params[:musician])
    @category = Category.find(params[:musician][:category_id])
    @musician.category = @category

    respond_to do |format|
      if @musician.save
        format.html { redirect_to(@musician, :notice => 'Musician was successfully created.') }
        format.xml  { render :xml => @musician, :status => :created, :location => @musician }
      else
        @categories = get_category_dropdown
        #@musician.errors[:name] << "hahhahah"
        format.html { render :action => "new" }
        format.xml  { render :xml => @musician.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /musicians/1
  # PUT /musicians/1.xml
  def update
    @musician = Musician.find(params[:id])
    @category = Category.find(params[:musician][:category_id])
    @musician.category = @category

    respond_to do |format|
      if @musician.update_attributes(params[:musician])
        format.html { redirect_to(@musician, :notice => 'Musician was successfully updated.') }
        format.xml  { head :ok }
      else
        @categories = get_category_dropdown
        format.html { render :action => "edit" }
        format.xml  { render :xml => @musician.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /musicians/1
  # DELETE /musicians/1.xml
  def destroy
    @musician = Musician.find(params[:id])
    @musician.destroy

    respond_to do |format|
      format.html { redirect_to(musicians_url) }
      format.xml  { head :ok }
    end
  end
end
