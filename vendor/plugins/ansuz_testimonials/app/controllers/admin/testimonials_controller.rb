class Admin::TestimonialsController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app

  layout 'admin'
  before_filter :load_testimonial,     :only => [:show, :edit, :update]
  before_filter :load_new_testimonial, :only => [:new, :create]
  before_filter :load_testimonials,    :only => [:index]

  protected
  def load_testimonial
    @testimonial = Ansuz::JAdams::Testimonial.find(params[:id])
  end

  def load_new_testimonial
    @testimonial = Ansuz::JAdams::Testimonial.new(params[:testimonial])
  end

  def load_testimonials
    @testimonials = Ansuz::JAdams::Testimonial.find(:all)
  end
  public
  def new
  end

  def create
    if @testimonial.save
      flash[:notice] = "Testimonial was created successfully."
      redirect_to admin_testimonials_path
    else
      flash.now[:error] = "There was a problem creating the testimonial."
      render :action => 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @testimonial.update_attributes(params[:testimonial])
      flash[:notice] = "Testimonial has been updated."
      redirect_to admin_testimonials_path
    else
      flash.now[:error] = "There was a problem updating the Testimonial.  Please try again."
      render :action => 'edit'
    end
  end

  def destroy
    @testimonial.destroy
    flash[:notice] = "Testimonial was deleted."
    redirect_to admin_testimonials_path
  end
end
