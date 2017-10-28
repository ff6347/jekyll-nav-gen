Dir[File.dirname(__FILE__) + "/jekyll-nav-gen/*.rb"].each {|file| require file[0..-4] }
require "nokogiri"
def inject(page)
  # puts page.inspect
  doc = Nokogiri.HTML(page.output) # read the page output as html
  # lis_string = "" # will hold the lis
  # for every h2 element
  headers = []
  xpathExpr = Jekyll.configuration({})['nav_gen']['xpath'] # is "//h2 | //h3"
  tags = doc.xpath(xpathExpr)

  tags.each do |n|
    headers << {"node" => n.name, "value" => n.content, "id" => n["id"] }
  end
  insub = false
  headers.each_with_index {
    |ele, i|
    if ele["node"] == "h3"
      insub = true
      headers[i]["issub"] = insub
      headers[i]["html"] = "<li class=\"is-h3 menu-item sub-item\"><a class=\"jump-link\" href=\"\##{ele["id"]}\">#{ele["value"]}</a></li>\n"
    else
      insub = false
      headers[i]["issub"] = insub
      headers[i]["html"] = "<li class=\"is-h2 menu-item\"><a class=\"jump-link\" href=\"\##{ele["id"]}\">#{ele["value"]}</a>\n"
    end
  }
  
  html_str = ""
  headers.each_with_index {
    |ele, i|
    if i != 0
      if ele["issub"] == true
        if headers[i-1]["issub"] != true
          html_str += "<ul class=\"sub-list\">\n"
        end
      elsif ele["issub"] == false && headers[i-1]["issub"] == true
        html_str += "</ul></li>\n"
      end
      html_str += ele["html"]		
    else
      html_str += ele["html"]
    end
    if i == headers.length - 1
      if ele["issub"] == true
        html_str+="</ul></li>\n"
      end
    end
  }

  html_str += "<li class=\"menu-item\" id=\"last-item\">"

  
  # ###########################
  

  # doc.xpath("//h2").each do |node|
  #   txt = node.content # get the text
  #   id = node["id"] # get the id
  #   # build the string for the element
  #   li = "<li class=\"menu-item\"><a href=\"##{id}\" class=\"jump-link\">#{txt}</a></li>\n"
  #   # at it to the list
  #   lis_string+=li
  # end
  # add the last element we are going to replace to the content
  # I know this is regex magic
  # I need to use nokogiri for that but did not get it right
  #
  # for now
  # lis_string += "<li class=\"menu-item\" id=\"last-item\">"
  # replace the last string the added content
  page.output = page.output.gsub(/(<li\ class\="menu\-item"\ id\="last\-item">)/i, html_str)
  # puts page.output
end

Jekyll::Hooks.register :documents, :post_render do |page|
  inject(page)
end