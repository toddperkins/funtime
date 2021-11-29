# Scope


Outline of scope:

- Nginx load balancer
- App server capable of scaling
- Docker Compose / Dockerfile
- Postgres DB
- Rails 6
- Twitter Bootstrap 5


# Setup

Run the following in your shell to bring up the environment:


```bash
docker-compose run app rails db:create
docker-compose run app yarn add bootstrap jquery popper.js
docker-compose run app rails webpacker:install
docker-compose up --build
```


You can also scale the containers:
```bash
docker-compose up --scale app=3

```

Access the server via:
```bash
127.0.0.1
```

The load balancer will automatically direct traffic round robin to a set of app servers.


# Issue

When I insert the following code between my ```<head></head>``` tags in app/views/layouts/application.html.erb:


```ruby
<!-- before -->
<%= stylesheet_pack_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
<!-- after -->


<%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>

```

The following is what it prints out in the browser:


```html

<!-- before -->

<!-- after -->

<script src="/packs/js/application-c3ea794f378760157125.js" data-turbolinks-track="reload"></script>
```

When I click the javascript url, it returns the JS code. However, The stylesheet tag is completely gone. If I switch it to stylesheet_link_tag it prints a stylesheet in the console, but does not style anything either. It looks like the proper way is to use the stylesheet_pack_tag, but I am getting no output to the browser.

Any help would be greatly appreciated!


