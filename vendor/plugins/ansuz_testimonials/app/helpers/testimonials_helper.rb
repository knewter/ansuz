module TestimonialsHelper
  def show_testimonial
    render :partial => 'testimonials/testimonial', :object => Ansuz::JAdams::Testimonial.random
  end

  def show_testimonials
    if testimonials_exist?
      testimonials = []
      10.times do
        testimonials << Ansuz::JAdams::Testimonial.random
      end
      render :partial => 'testimonials/fadelist', :locals => { :testimonials => testimonials }
    end
  end

  def testimonials_exist?
    Ansuz::JAdams::Testimonial.count > 0
  end
end
