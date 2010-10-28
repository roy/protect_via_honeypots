module ProtectViaHoneypots
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def protect_via_honeypots
      include InstanceMethods

      before_filter :verify_honeypots
    end
  end

  module InstanceMethods
    def verify_honeypots
      verified_request? || raise (ActionController::InvalidHoneyPots)
    end

    def verified_request?
      [:email_pot, :name_pot].all?{ |x| x.blank? }
    end
  end
end


# Set it all up
if Object.const_defined?("ActiveController")
  ActiveController::Base.send(:include, ProtectViaHoneypots)
end
