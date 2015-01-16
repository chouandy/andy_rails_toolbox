Rails.application.routes.draw do
  get 'test/timeago'

  root 'welcome#index'
end
