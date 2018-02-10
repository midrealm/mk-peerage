module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      tables: true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    
    markdown.render(text).html_safe if text
  end
  def flash_class(level)
    case level
        when 'notice' then "alert alert-info"
        when 'success' then "alert alert-success"
        when 'error' then "alert alert-error"
        when 'alert' then "alert alert-error"
    end
  end

  def peer_specialties_link(peer)
    peer.specialties.map{|x| link_to(x.name, specialty_path(peer.order, x.slug))}.join(', ').html_safe
  end 

  def candidate_specialties_link(candidate)
    candidate.specialties.map{|x| link_to(x.name, chambers_specialty_path(candidate.peerage_type, x.slug))}.join(', ').html_safe
  end
end
