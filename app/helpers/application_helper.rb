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
        when 'error' then "alert alert-danger"
        when 'alert' then "alert alert-danger"
        when 'danger' then "alert alert-danger"
    end
  end

  def collection_link(collection:, label:, order:, url_helper:)
    links_array =  collection.map do |x| 
      link_to( x.public_send(label), Rails.application.routes.url_helpers.public_send(url_helper, order, x.slug) )
    end
    links_array.join(', ').html_safe
  end
  def title(title)
    content_for(:title) { title }
  end
end
