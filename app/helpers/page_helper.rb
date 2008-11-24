module PageHelper
	def next_page(page, options = {})
		return nil unless (page.current_page < page.total_pages)
		options[:class] ||= 'next_page'
		options[:label] ||= 'Next &gt;'
		options[:separator] ||= ""
		[ '<span class="', options[:class], '">', options[:separator], link_to(options[:label], (page.current_page+1).to_s), '</span>' ]
		
	end

	def prev_page(page, options = {})
		return nil unless (page.current_page > 1)
		options[:class] ||= 'prev_page'
		options[:label] ||= '&lt; Previous'
		options[:separator] ||= ""
		[ '<span class="', options[:class], '">', link_to(options[:label], (page.current_page-1).to_s), options[:separator], '</span>' ]
	end

	def page_controls(page, options = {})
		options[:separator] = ' | '
		buffer = []
		label = prev_page(page)
		buffer << label.join if label
		label = next_page(page)
		buffer << label.join if label
		buffer.join(options[:separator])
	end

  def render_special(name)
    # TODO: this needs to be cached
    page = Page.find_or_create_page_by_path("special/#{name}")
    render :partial => 'content/page', :object => page
  end
end
