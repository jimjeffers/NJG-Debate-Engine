ActionController::Routing::Routes.draw do |map|
  map.resources :comments
  map.resources :categories
  
  map.resources :articles
  map.article_status '/articles/:id/status/:state', :controller => 'articles', :action => 'set_status'
  
  map.resources :sports
  
  map.resources :users
  map.user_add_role '/users/:id/add_role/:name', :controller => 'users', :action => 'add_role'
  map.user_remove_role '/users/:id/remove_role/:name', :controller => 'users', :action => 'remove_role'
  
  map.resources :questions do |question|
    question.resources :answers
  end
  
  map.resources :users do |user|
    user.resources :answers
  end
  
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resource :session
  
  map.news_column '/news/column/:id/:guid', :controller => 'news', :action => 'column'
  map.news_sport '/news/sport/:guid', :controller => 'news', :action => 'sport'
  map.news_author '/news/author/:login', :controller => 'news', :action => 'author'
  map.news_article '/news/:guid', :controller => 'news', :action => 'article'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.connect '/', :controller => 'news', :action => 'index'
end
