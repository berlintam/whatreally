module ApplicationHelper
  def markdown(text)
    redcarpet = Redcarpet::Markdown.new(
        Redcarpet::Render::HTML,
        :autolink => true,
        :space_after_headers => false,
        :underline => true
    )
    raw redcarpet.render(text)
  end

  def icon_minus
    '<i class="icon-minus"></i>'.html_safe
  end

  def icon_plus
    '<i class="icon-plus"></i>'.html_safe
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s + "/form", :f => builder)
    end
    link_to_function(name, ERB::Util.h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end

end
