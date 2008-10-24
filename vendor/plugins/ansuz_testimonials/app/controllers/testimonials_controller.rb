class TestimonialsController < ApplicationController
  unloadable # This is required if you subclass a controller provided by the base rails app

  before_filter :load_testimonials, :only => [:index]

  protected
  def load_testimonials
    @testimonials = Ansuz::JAdams::Testimonial.find(:all)
  end

  public

  def index
    respond_to do |format|
      format.html{ render }
    end
  end
end
