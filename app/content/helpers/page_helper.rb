module PageHelper
  # Creates a hyperlink to a page using the `title` key. Change the default in the args
  # below if you use a different key for page titles.
  def link_to_page(page, title_key: "title")
    link_to page.data.fetch(title_key, page.request_path), page.request_path
  end

  # Quick and easy way to change the class of a page if its current. Useful for
  # navigation menus.
  def link_to_if_current(text, page, active_class: "active")
    if page == current_page
      link_to text, page.request_path, class: active_class
    else
      link_to text, page.request_path
    end
  end

  # Conditionally renders the block if an arg is present. If all the args are nil,
  # the block is not rendered. Handy for laconic templating languages like slim, haml, etc.
  def with(*args, &block)
    block.call(*args) unless args.all?(&:nil?)
  end

  # Render a block within a layout. This is a useful, and prefered way, to handle
  # nesting layouts, within Sitepress.
  def render_layout(layout, **, &)
    render(html: capture(&), layout: "layouts/#{layout}", **)
  end

  # `url_for` doesn't create a url when a string is passed
  def path_url path
    URI.const_get(request.scheme.upcase).build({
      host: Rails.application.routes.default_url_options.fetch(:host, request.host),
      port: Rails.application.routes.default_url_options.fetch(:port, request.port),
      path: path
    }).to_s
  end

  def to_meta_tags page
    {
      title: page.data.title,
      description: page.data.description,
      keywords: page.data.keywords,
      image_src: page.data.image,
      canonical: canonical(page),
      noindex: page.data.noindex,
      index: page.data.index,
      nofollow: page.data.nofollow,
      follow: page.data.follow,
      noarchive: page.data.noarchive,
      prev: page.data.prev,
      next: page.data.next,
      og: page.data.og,
      twitter: page.data.twitter
    }.compact
  end

  def canonical page
    path_url(page.request_path.gsub(/index\.html\z/, "").gsub(/\.html\z/, "").gsub(/\/\z/, ""))
  end
end
