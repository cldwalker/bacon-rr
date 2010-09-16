require 'rr'
require 'bacon'

module Bacon
  module Rr
    VERSION = '0.1.0'

    RR.trim_backtrace = true

    def self.included(mod)
      mod.send :include, RR::Adapters::RRMethods
      mod.module_eval %[
        alias_method :old_it, :it
        def it(description, &block)
          old_it(description) do
            begin
              # Add at least one requirement to ensure mock-only tests don't fail
              Bacon::Counter[:requirements] += 1
              yield
              #Bacon::Counter[:requirements] -= 1 if RR.double_injections.size.zero?
              RR.verify
            rescue RR::Errors::RRError=>e
              raise Bacon::Error.new(:failed, e.message)
            ensure
              RR.reset
            end
          end
        end
      ]
    end
  end
end

Bacon::Context.send :include, Bacon::Rr
