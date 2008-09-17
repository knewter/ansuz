class Admin::MenuEntriesController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app

  layout 'admin'
  before_filter :load_menu_entry,     :only => [:show, :edit, :update]
  before_filter :load_new_menu_entry, :only => [:new, :create]
  before_filter :load_menu_entries,   :only => [:index]

  protected
  def load_menu_entry
    @menu_entry = Ansuz::JAdams::MenuEntry.find(params[:id])
  end

  def load_new_menu_entry
    @menu_entry = Ansuz::JAdams::MenuEntry.new(params[:menu_entry])
  end

  def load_menu_entries
    @menu_entries = Ansuz::JAdams::MenuEntry.find(:all, :order => 'created_at DESC')
  end
  public
  def new
  end

  def create
    if @menu_entry.save
      flash[:notice] = "Menu Entry was created successfully."
      redirect_to admin_menu_entries_path
    else
      flash.now[:error] = "There was a problem creating the menu entry."
      render :action => 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @menu_entry.update_attributes(params[:menu_entry])
      flash[:notice] = "Menu Entry has been updated."
      redirect_to admin_menu_entry_path(@menu_entry)
    else
      flash.now[:error] = "There was a problem updating the Menu Entry.  Please try again."
      render :action => 'edit'
    end
  end

  def destroy
    @menu_entry.destroy
    flash[:notice] = "Menu Entry was deleted."
    redirect_to admin_menu_entries_path
  end
end
