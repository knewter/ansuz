require 'open-uri'

class FeedReadersController < ApplicationController
  unloadable

  def get_feed
    str = ""
    open params[:targeturl] do |f|
      str = f.read
    end
    render :xml => str
  end
end
