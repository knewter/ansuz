class CalendarEventsController < ApplicationController
	before_filter :login_required

  def index
    list
    render :action => 'list'
  end

  def list
    @calendar_event_page, @calendar_event = paginate :calendar_event, :order => 'date DESC', :per_page => 50
  end

  def list_by_tag
    @tag_filter = params[:calendar_tag]
    @calendar_event_page, @calendar_event = paginate :calendar_event, :order => 'date DESC', :per_page => 50, 
      :conditions => [ 'calendar_tag_id = ?', @tag_filter ]
    render :action => 'list'
  end

  def show
    @calendar_event = CalendarEvent.find(params[:id])
  end

  def new
    @calendar_tags = CalendarTag.find_all
    @calendar_event = CalendarEvent.new
  end

  def new_copy
    @calendar_tags = CalendarTag.find_all
    @calendar_event = CalendarEvent.new_copy(CalendarEvent.find(params[:id]))
    render :action => 'new'
  end

  def selectNewTag
    @new_tag = CalendarTag.new( :name => params[:tag_name] )
    if @new_tag.save 
      #@calendar_event = CalendarEvent.find(params[:id])
      #@calendar_event.calendar_tag_id = new_tag.id
 
      @calendar_tags = CalendarTag.find_all
      render :partial => 'tagSelector'
    else
      render :text => "500 - Internal Server Error: unable to save new calendar tag", :status => 500
    end
  end

  def create
    @calendar_event = CalendarEvent.new(params[:calendar_event])
    if @calendar_event.save
      flash[:notice] = 'Calendar event was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @calendar_tags = CalendarTag.find_all
    @calendar_event = CalendarEvent.find(params[:id])
  end

  def update
    @calendar_event = CalendarEvent.find(params[:id])
    if @calendar_event.update_attributes(params[:calendar_event])
      flash[:notice] = 'CalendarEvent was successfully updated.'
      redirect_to :action => 'show', :id => @calendar_event
    else
      render :action => 'edit'
    end
  end

  def destroy
    CalendarEvent.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
