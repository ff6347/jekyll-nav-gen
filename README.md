Jekyll Nav Generator
====================

This could be more generic. Currently it needs a menu structure like this one:  

```html
    <header>
<div class="inner">

  <nav>
    <a href="{{ site.baseurl }}/" class="logo"></a>
      <input type="checkbox" id="nav" />
      <label for="nav"></label>
  <a href="#" id="menu-icon"></a>
    <ul id="menu-list">
      {% for item in site.data.menu %}
        <li class="menu-item"{%if forloop.last == true %} id="last-item"{%endif%}>
          <a href="{{site.baseurl}}{{item.url}}">{{item.title}}</a>
        </li>
        {% comment %}{% if item.sub != nil %}
          <ul>{% for sub in item.sub %}
              <li class="menu-item"><a href="{{site.baseurl}}{{sub.url}}">{{sub.title}}</a></li>{% endfor %}
          </ul>{% endif %}{% endcomment %}
        {% endfor %}
    </ul>
  </nav>
</div>
</header>
```

To work properly.  

To install it add the following code to your Gemfile:  

```Gemfile
    source "https://rubygems.org"
gem "jekyll"
gem "nokogiri"

group :jekyll_plugins do
  gem "jekyll-nav-gen", :git => 'git@github.com:fabianmoronzirfas/jekyll-nav-gen.git'
end
```

and run `bundle install`.  

You also need to update your `_config.yml` accordingly.  

```yaml
plugins: [jekyll-nav-gen]
```

## License

