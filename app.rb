require 'redcarpet'
require 'erb'

# Set up markdown renderer
renderer = Redcarpet::Render::HTML.new(render_options = {})
markdown = Redcarpet::Markdown.new(renderer, extensions = {
	autolink: true,
	tables: true
})

# Set up template engine
template = File.read("./views/index.erb")
content = ""
renderer = ERB.new(template)

baseURL = "/Users/firebug/Desktop/b/"

files = Dir.glob("./data/**/*.{markdown,md}")
files.map do |filePath|
	file = File.read(filePath)
	content = markdown.render(file)
	File.write(filePath+'.html', renderer.result())
end
