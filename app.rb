require 'sinatra'
require_relative 'config/application'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all
  erb :'meetups/index'
end

get '/meetups/:id' do
  mid = params['id']
  @meetup = Meetup.find(mid)
  @attendees = Attendee.where(meetup_id: mid)
  erb :'meetups/details'
end

post '/meetups/:id' do
  if session[:user_id].nil?
    flash[:notice] = "You need to sign in to join this event."
  else
    Attendee.create(user_id: session[:user_id], meetup_id: params['id'])
    flash[:notice] = "You have joined this event."
  end
  redirect "/meetups/#{params['id']}"
end

get '/create' do
  erb :'meetups/create'
end

post '/create' do
  Meetup.create(time: params[:time], duration: params[:duration],
  name: params[:name], location: params[:location], date: params[:date],
  description: params[:description], creator_id: session[:user_id])
  redirect '/meetups'
end
