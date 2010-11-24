
module ProtectViaHoneypots
  HONEYPOT_TAGS = [:email, :name]

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def protect_via_honeypots
      include InstanceMethods

      before_filter :verify_honeypots
      require 'protect_via_honeypots/form_tag_helper_extensions'
      #ActionView::Helpers::FormTagHelper.send(:include, ProtectViaHoneypots::FormTagHelperExtensions)
    end

  end

  module InstanceMethods
    def verify_honeypots
      verified_request? || raise(ActionController::InvalidHoneyPots)
    end

    def verified_request?
       ProtectViaHoneypots::HONEYPOT_TAGS.all?{ |x| params[x].blank? }
    end
  end
end


# Set it all up
if Object.const_defined?("ActionController")
  ActionController::Base.send(:include, ProtectViaHoneypots)
end
