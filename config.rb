###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

helpers do 
  def find_author(author)
   result = data.authors.select {|a| a.keys.first == author}
   raise ArgumentError unless result.any?
   result.first
  end
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets
    set :relative_links, true

  # Or use a different image path


  # set :http_prefix, "/Content/images/"
end

# Deployment
activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true

  # Optional Settings
  # deploy.remote = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message' # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end

activate :blog do |blog|
  blog.layout = "article_layout"
  blog.tag_template = "bl/tag.html"
  blog.calendar_template = "bl/calendar.html"
  blog.prefix = "bl"
  blog.default_extension = ".md"
  blog.sources = "bl/posts/{year}/{month}/{day}-{title}.html"
  blog.permalink = "bl/posts/{year}/{month}/{day}-{title}.html"

end

configure :development do
  activate :disqus do |d|
    # using a special shortname
    d.shortname = "lalo"
  end
end

configure :build do
  activate :disqus do |d|
    # using a different shortname for production builds
    d.shortname = "elodiewanang"
  end

def find_author(author_slug)
  author_slug = author_slug.downcase
  result = data.authors.select {|author| author.keys.first == author_slug }
  raise ArgumentError unless result.any?
  result.first
end

end

###image optimizations
activate :minify_html