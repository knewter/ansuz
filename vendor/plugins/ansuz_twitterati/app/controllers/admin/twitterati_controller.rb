class Admin::TwitteratiController < Admin::BaseController
  before_filter :load_twitterati, :only => [:update]

  protected
  def load_twitterati
    @twitterati = Ansuz::JAdams::Twitterati.find(params[:id])
  end

  public
  def update
    @twitterati.settings = params[:settings]
    if @twitterati.save
      render :update do |page|
        page << "notify('Twitterati has been updated');"
      end
    else
      render :update do |page|
        page << "notify('An error occurred updating the Twitterati');"
      end
    end
  end
end
