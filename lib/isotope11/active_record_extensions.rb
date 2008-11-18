module ActiveRecord
  module Associations
    module ClassMethods
      def create_extension_modules(association_id, block_extension, extensions)
        if block_extension
          extension_module_name = "#{self.to_s.demodulize}#{association_id.to_s.camelize}AssociationExtension"

          silence_warnings do
            Object.const_set(extension_module_name, Module.new(&block_extension))
          end
          Array(extensions).push(extension_module_name.constantize)
        else
          Array(extensions)
        end
      end
    end
  end
end
