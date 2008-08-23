module Caboose::SpiderIntegrator
  
  # This is an abstract representation of a form that we can spider.
  # It's a loose wrapper around HTML::Tag, except that we can modify its attributes
  class SpiderableForm
    def initialize(tag)
      @form = tag
      @method = @form['method']
      @action = @form['action']
    end
    
    attr_accessor :method, :action, :query_hash
    
    def find_all(*args)
      @form.find_all(*args)
    end
    
    def mutate_inputs!(mutate_existing_values = false)
      input_hash = mutate_existing_values ? { '_mutated' => true } : { '_modified' => true }
    
      @form.find_all(:tag => 'input').each do |input|
        if input['name'] == '_method' # and value.in?['put','post',..] # rails is faking the post/put etc
          self.method = input['value']
        else
          case input['type']
          when 'hidden'
            input_hash[ input['name'] ] = create_data(input, mutate_existing_values)
          when 'file'
            # nothing. todo: try uploading some data here.
          else
            input_hash[ input['name'] ] = create_data(input, mutate_existing_values)
          end
        end
      end
      @form.find_all(:tag => 'textarea').each do |input|
        input_hash[ input['name'] ] = create_data(input, mutate_existing_values)
      end

      @query_hash = input_hash
    end

    # Randomly create data to push to form values, depending on the name of the input field.
    #
    # We're trying to be clever about the sort of crap to push into the field.
    # Todo: if an existing value is given, try mutating it.
    def create_data(input, mutate = false)
      value = mutate ? nil : input['value'] 

      return value || case input['name']
        when /amount/: rand(10000) - 5000
        when /_id$/:   rand(500)
        when /uploaded_data/: # attachment_fu
          nil
        else
          rand(10000).to_s
        end
    end

    # method_missing proxy perhaps?
  end

end