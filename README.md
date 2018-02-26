# My portfolio application

> This is a Ruby on Rails 5.1 application containing my portfolio. I am using it to test out and implement new features and ideas.  

## [Live site](https://kk-portfolio.herokuapp.com/)

### Features

- Real time chat engine for comments (ActionCable)
- Blog (with Markdown editor and syntax highlighting in posts)
- Portfolio (with drag and drop interface based on Ajax)
- Tweeter feed of Rails news
- Authentication with Devise and Omniauth (implemented Google authentication)
- Pagination with Kaminari gem
- TypedJS libary implemented on Home page
- Skill model showing skills distrubution in About page via bootstrap progress-bars
- Google Map iframe on Contact page
- HAML syntax on main layout's pages
- File uploader on new portfolio page with Carrierwave gem and AWS integration
- Friendly id gem for URL slugs on blog pages
- Petergate gem for authorization
- Gritter gem for growl notifications
- Mobile layout

### Testing

- RSpec
- Capybara
- FactoryBot
- Database cleaner
- Shoulda-matchers
- Selenium-webdriver configured to test JS pages with Chrome engine
