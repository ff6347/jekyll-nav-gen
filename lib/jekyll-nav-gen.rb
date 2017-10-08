Dir[File.dirname(__FILE__) + "/nav-gen/*.rb"].each {|file| require file[0..-4] }
require "nokogiri"
def inject(page)
  # print "working on page"
  # puts page.inspect
  doc = Nokogiri.HTML(page.output)
  # navul = doc.css('nav ul')
  # puts navul
  # home.add_next_sibling "<li>one</li>"
  navstr = ""

  doc.xpath("//h2").each do |node|
    txt = node.content
    id = node["id"]
    item = "<li class=\"menu-item\"><a href=\"##{id}\" class=\"jump-link\">#{txt}</a></li>\n"
    # li = Nokogiri::HTML::Node.new('li',doc)
    # li["class"] = "menu-item"
    # a = Nokogiri::HTML::Node.new('a',doc)
    # a["href"] = "##{id}"
    # a.content = txt
    # li.add_child(a)
    # navul.children.add_child(li)
    navstr+=item
  end
  # navul << navstr

  # puts navstr
  navstr += "<li class=\"menu-item\" id=\"last-item\">"
  # page.output = page.output.gsub(/<\/head>/i,"baz" )
  page.output = page.output.gsub(/(<li\ class\="menu\-item"\ id\="last\-item">)/i, navstr)
  # puts page.output
end

Jekyll::Hooks.register :documents, :post_render do |page|
  inject(page)
end