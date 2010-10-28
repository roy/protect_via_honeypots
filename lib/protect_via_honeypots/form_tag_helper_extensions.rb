module ProtectViaHonepots::FormTagHelperExtensions
  alias_method :old_extra_tags_for_form :extra_tags_for_form
  def extra_tags_for_form(html_options)
    tags = ProtectViaHoneypots.honeypot_tags.collect do |tag| 
      tag(:input, :type => "hidden", :name => tag, :value => "") 
    end

    old_extra_tags_for_form(html_options) + content_tag(:div, tags, :style => 'margin:0;padding:0;display:inline')
  end
end


