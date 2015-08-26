class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :'mainindex'
  end

  get '/songs' do
  	@items = Song.all
  	@class = @items.first.class.to_s + 's'
  	erb :'index'
  end

  get '/artists' do
  	@items = Artist.all
  	@class = @items.first.class.to_s + 's'
  	erb :'index'
  end

  get '/genres' do
  	@items = Genre.all
  	@class = @items.first.class.to_s + 's'
  	erb :'index'
  end

  get '/songs/new' do
    erb :'songs/create'
  end

  post '/songs/new' do
    @genre = params.key("on")
    @artist_name = params["Artist Name"]
    @song_name = params[:Name]

    erb :'songs/success'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])[0]
    erb :'songs/edit'
  end

  post '/editted/:slug' do
    @genre = params.key("on")
    @artist_name = params["Artist Name"]
    @song = Song.find_by_slug(params[:slug])[0]
    @song_name = @song.name
    erb :'songs/success'
  end

  get '/songs/:slug' do
  	@song = Song.find_by_slug(params[:slug])[0]
  	erb :'songs/show'
  end

  get '/artists/:slug' do
  	@artist = Artist.find_by_slug(params[:slug])[0]
  	erb :'artists/show'
  end

  get '/genres/:slug' do
  	@genre = Genre.find_by_slug(params[:slug])
  	erb :'genres/show'
  end

end