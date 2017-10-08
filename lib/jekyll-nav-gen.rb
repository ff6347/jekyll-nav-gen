Dir[File.dirname(__FILE__) + "/nav-gen/*.rb"].each {|file| require file[0..-4] }
require "nokogiri"
def inject(page)
  # puts page.inspect
  doc = Nokogiri.HTML(page.output)
  navstr = ""
  doc.xpath("//h2").each do |node|
    txt = node.content
    id = node["id"]
    item = "<li class=\"menu-item\"><a href=\"##{id}\" class=\"jump-link\">#{txt}</a></li>\n"
    navstr+=item
  end
  navstr += "<li class=\"menu-item\" id=\"last-item\">"
  page.output = page.output.gsub(/(<li\ class\="menu\-item"\ id\="last\-item">)/i, navstr)
end

Jekyll::Hooks.register :documents, :post_render do |page|
  inject(page)
end