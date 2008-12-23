class Admin::JskitRatingsController < Admin::BaseController
  unloadable

  before_filter :load_jskit_rating, :only => [:update]

  protected
  def load_jskit_rating
    @jskit_rating = Ansuz::JAdams::JskitRating.find params[:id]
  end

  public
  def update
    @jskit_rating.settings = params[:settings]
    if @jskit_rating.save
      render :update do |page|
        page << "notify('Rating has been updated');"
      end
    else
      render :update do |page|
        page << "notify('An error occurred updating the Rating');"
      end
    end
  end
end
