=begin
module ProtectViaHoneypots::FormTagHelperExtensions
  #alias_method :old_extra_tags_for_form, :extra_tags_for_form
  #def extra_tags_for_form(html_options)
  #  tags = ProtectViaHoneypots.honeypot_tags.collect do |tag| 
  #    tag(:input, :type => "hidden", :name => tag, :value => "") 
  #  end

  #  old_extra_tags_for_form(html_options) + content_tag(:div, tags, :style => 'margin:0;padding:0;display:inline')
  #end

  def extra_tags_for_form(html_options)
    raise "ERROR"
    tags = ProtectViaHoneypots.honeypot_tags.collect do |tag| 
      tag(:input, :type => "hidden", :name => tag, :value => "") 
    end

    super + content_tag(:div, tags, :style => 'margin:0;padding:0;display:inline')
  end
end
=end

module ActionView
  module Helpers
    module FormTagHelper
      alias_method :old_extra_tags_for_form, :extra_tags_for_form
      def extra_tags_for_form(html_options)
        tags = ProtectViaHoneypots::HONEYPOT_TAGS.collect do |tag| 
          tag(:input, :type => "text", :name => tag, :value => "") 
        end

        old_extra_tags_for_form(html_options) + content_tag(:div, tags, :style => 'margin:0;padding:0;display:none')
      end

    end
  end
end

module ActionController #:nodoc:
  class InvalidHoneyPots < ActionControllerError #:nodoc:
  end
end
