module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to 'Registration', new_user_registration_path, class: "#{style} #{active? new_user_registration_path}") +
      " ".html_safe +
      (link_to 'Login', new_user_session_path, class: "#{style} #{active? new_user_session_path}")
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(styles)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}, please feel free to #{ link_to 'contact me', contact_path } if you would like to work together"
      content_tag(:div, greeting.html_safe, class: styles)
    end
  end

  def copyright_generator
    KulasViewTool::Renderer.copyright 'Kamil Kula', "All right reserved"
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_path,
        title: 'About'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
      {
        url: tech_news_path,
        title: 'TechNews'
      }
    ]
  end

  def nav_helper style, tag_type, tag_class=nil
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type} class='#{tag_class}'><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Kamil Kula Portfolio", sticky: false)
  end

  class CodeRayify < Redcarpet::Render::HTML
     def block_code(code, language)
       CodeRay.scan(code,language).div
     end
   end

   def markdown(text)
     coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

     options = {
       fenced_code_blocks: true,
       no_intra_emphasis: true,
       autolink: true,
       lax_html_blocks: true,
     }

     markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
     markdown_to_html.render(text).html_safe
   end

end
