require 'protect_via_honeypots/form_tag_helper_extensions'

module ProtectViaHoneypots
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def protect_via_honeypots
      include InstanceMethods

      before_filter :verify_honeypots
      ActionView::Helpers::FormTagHelper.include ProtectViaHoneypots::FormTagHelperExtensions
    end

    def honeypot_tags
      [:email_pot, :name_pot]
    end
  end

  module InstanceMethods
    def verify_honeypots
      verified_request? || raise (ActionController::InvalidHoneyPots)
    end

    def verified_request?
      honeypot_tags.all?{ |x| params[x].blank? }
    end

  end
end


# Set it all up
if Object.const_defined?("ActionController")
  ActionController::Base.send(:include, ProtectViaHoneypots)
end
