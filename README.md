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

## Development

These are just notes for myself so I don't forget how to publish my gem.  

```bash
# for better version bumping
gem install bump
# bump --help
# bump a patch|minor|major version like this
# bump patch
# if you don't a commit for this
# bump patch --no-commit
# create a new gem
gem build jekyll-nav-gen.gemspec
# push it to the registry
gem push jekyll-nav-gen-0.0.4.gem
```


## License


The MIT License (MIT)
Copyright © 2017 Fabian Morón Zirfas <fabian.moron.zirfas@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
