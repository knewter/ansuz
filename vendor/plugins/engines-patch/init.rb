# Patching Engines as per http://www.ruby-forum.com/topic/166578
require 'dispatcher'

Engines::Plugin.class_eval do
  def apply_mixin_to_model(model_class, mixin_module)
    Dispatcher.to_prepare {
      model_class  = Kernel.const_get(model_class.to_s)  # \ weird, yet
      mixin_module = Kernel.const_get(mixin_module.to_s) # / required.
      model_class.send(:extend,  mixin_module.const_get("ClassMethods"))
      model_class.send(:include, 
                      mixin_module.const_get("InstanceMethods"))
      model_class.instance_eval &(mixin_module.class_definition())
    }
  end
end
