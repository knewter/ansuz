# For the queasy, this is MIT licensed. See comment at the end.

module ExceptionMacros
  # Make sure a block raises an exception.
  # Call with optional arguments :instance_of/:kind_of and :message
  # If :instance_of or :kind_of is specified, assert on the given type. 
  #   Otherwise only assert that an exception is raised.
  #   Note: The shorthand should_raise(LoadError) is equivalent to should_raise(:instance_of => LoadError)
  # If :message is specified, will assert that exception.message =~ :message.
  #
  # Examples:
  #   should_raise {a block}
  #   should_raise(LoadError) {a block}
  #   should_raise(:instance_of => LoadError) {a block}
  #   should_raise(:kind_of => LoadError) {a block}
  #   should_raise(:message => "no such file to load") {a block}
  #   should_raise(:message => /load/) {a block}
  #   should_raise(LoadError, :message => /load/) {a block}
  #   should_raise(:kind_of => LoadError, :message => /load/) {a block}
  #   should_raise(:instance_of => LoadError, :message => /load/) {a block}
  def should_raise(*args, &block)
    opts = args.last.is_a?(Hash) ? args.pop : {}
    
    if args.first.is_a?(Class)
      type  = args.first
      exact = true
    else
      type  = opts[:instance_of] || opts[:kind_of]
      exact = !!opts[:instance_of]
    end
    message = opts[:message]
    
    # Make sure we don't have a false sense of security and bork if incorrect options are supplied.
    [:message, :instance_of, :kind_of].each { |acceptable_arg| opts.delete(acceptable_arg) }
    raise ArgumentError, "Unknown parameter(s): #{opts.keys.inspect}. Only :message, :instance_of and :kind_of are supported." if opts.size > 0
    
    context "block #{block.inspect}" do # To avoid dupes
      if type
      
        should "raise an exception of type #{type.inspect}" do
          begin
            yield
          rescue Exception => ex
            @raised_exception = ex
          end
          if exact
            assert_instance_of type, @raised_exception
          else
            assert_kind_of type, @raised_exception
          end
        end
      
      else
      
        should "raise an exception" do
          has_raised = false
          begin
            yield
          rescue Exception => ex
            has_raised = true
          end
          assert has_raised, "The block was expected to raise an exception, but didn't"
        end
      
      end
    end
    
    if message
      context "raising an exception" do
        setup do
          begin
            yield
          rescue Exception => ex
            @raised_exception = ex
          end
        end
        
        should "contain a message that matches #{message.inspect}" do
          assert_match message, @raised_exception.message
        end
      end
    end
  end
end

Test::Unit::TestCase.send :extend, ExceptionMacros

# A test suite for the macro

=begin
require "#{ File.dirname(__FILE__) }/../test_helper"

class ExceptionMacroTest < Test::Unit::TestCase
  # All of the basic Ruby 1.8 exceptions, except for 'fatal'
  EXCEPTIONS = [
    Exception,
      NoMemoryError, 
      ScriptError, 
        LoadError, 
        NotImplementedError, 
        SyntaxError, 
      SecurityError, 
      SignalException, 
        Interrupt, 
      StandardError, 
        ArgumentError, 
        IndexError, 
        IOError, 
          EOFError, 
        LocalJumpError, 
        NameError,
          NoMethodError, 
        RangeError, 
          FloatDomainError, 
        RegexpError, 
        RuntimeError, 
        SystemCallError, 
        ThreadError, 
        TypeError, 
        ZeroDivisionError,
      SystemExit, 
      SystemStackError]
  
  EXCEPTIONS_WITH_PARAMS = {
    Interrupt => 0,
    SystemCallError => 2,
    SignalException => 2
  }
  
  PLAIN_EXCEPTIONS = EXCEPTIONS - EXCEPTIONS_WITH_PARAMS.keys

  context "Raising all the types of exceptions" do
    PLAIN_EXCEPTIONS.each do |x|
      context "for exception #{x.inspect}, with a straight exception class argument" do
        should_raise(x) { raise x }
      end
    end
    
    EXCEPTIONS_WITH_PARAMS.each_pair do |x, p|
      context "for exception #{x.inspect} with param #{p.inspect}, with a :kind_of exception" do
        should_raise(:kind_of => x) { raise x, p }
      end
    end
    
    (PLAIN_EXCEPTIONS - [SystemCallError]).each do |x|
      context "for exception #{x.inspect}, with an :instance_of exception" do
        should_raise(:instance_of => x) { raise x }
      end
    end
  end
  
  context "Using an unknown param_type" do
    should_raise(ArgumentError, :message => /:unknown_param_type/) do
      should_raise(:unknown_param_type => 'foo') {}
    end
  end
  
  should_raise do
    require "more vespene gas"
  end
  # 1 assertion
  
  should_raise(LoadError) do
    require "more vespene gas"
  end
  # 1 more restrictive assertion
  
  should_raise(:instance_of => LoadError) do
    require "more vespene gas"
  end
  # 1 assertion, the same as should_raise(LoadError)
  
  should_raise(:kind_of => ScriptError) do
    require "more vespene gas"
  end
  # 1 assertion, slightly less strict than with :instance_of (note: LoadError < ScriptError)
  
  should_raise(:message => "no such file to load") do
    require "more vespene gas"
  end
  # 2 assertions
  
  should_raise(:message => /vespene/) do
    require "more vespene gas"
  end
  # 2 assertions
  
  should_raise(LoadError, :message => "such file to load") do
    require "more vespene gas"
  end
  # 2 assertions
  
  should_raise(:kind_of => LoadError, :message => "file to load") do
    require "more vespene gas"
  end
  # 2 assertions
  
  should_raise(:instance_of => LoadError, :message => "to load") do
    require "more vespene gas"
  end
  # 2 assertions
end
=end


=begin
Copyright (c) 2008 Mathieu Martin

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
=end
