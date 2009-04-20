require 'hpricot'

module HpricotTestHelper
  # returns the inner content of
  # the first tag found by the css query
  def tag(css_query)
    process_output
    @output.content_for(css_query)
  end
  
  # returns an array of tag contents
  # for all of the tags found by the
  # css query
  def tags(css_query)
    process_output
    @output.content_for_all(css_query)
  end
  
  # returns a raw Hpricot::Elem object
  # for the first result found by the query
  def element(css_query)
    process_output
    @output[css_query].first
  end
  
  # returns an array of Hpricot::Elem objects
  # for the results found by the query
  def elements(css_query)
    process_output
    @output[css_query]
  end
  
  # small utility class for working with
  # the Hpricot parser class
  class DocumentOutput
    def initialize(response_body)
      @parser = Hpricot.parse(response_body)
    end

    def content_for(css_query)
      @parser.search(css_query).first.inner_text
    end

    def content_for_all(css_query)
      @parser.search(css_query).collect(&:inner_text)
    end

    def [](css_query)
      @parser.search(css_query)
    end
  end
  
  protected
    # creates a new DocumentOutput object from the response
    # body if hasn't already been created. This is
    # called automatically by the element and tag methods
    def process_output(force=false)      
      @output = HpricotTestHelper::DocumentOutput.new(@response.body) if @output.nil? || force  
    end
end
