class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/artists' do
  	erb :artists_index
  end

  get '/genres' do
  	erb :genres_index
  end

  get '/songs' do
  	erb :songs_index
  end

  get '/songs/new' do
  	erb :songs_new
  end

  post '/songs/new' do
  	@song = Song.create(name: params[:name])
    update_songs_artist(@song, params[:artist])
  	update_songs_genres(@song, params[:genres])
  	@message = "Successfully created song."
  	erb :songs_show
  end

  get '/songs/:slug/edit' do
  	@song = Song.find_by_slug(params[:slug])
  	erb :songs_edit
  end

  post '/songs/:slug/edit' do
  	@song = Song.find_by_slug(params[:slug])
  	update_songs_artist(@song, params[:artist]) if @song.artist.name != params[:artist]
  	update_songs_genres(@song, params[:genres])
  	@message = "Song successfully updated."
  	erb :songs_show
  end

  get '/artists/:slug' do
  	@artist = Artist.find_by_slug(params[:slug])
  	erb :artists_show
  end

  get '/genres/:slug' do
  	@genre = Genre.find_by_slug(params[:slug])
  	erb :genres_show
  end

  get '/songs/:slug' do
  	@song = Song.find_by_slug(params[:slug])
  	@message = ""
  	erb :songs_show
  end

  def update_songs_artist(song, new_artists_name)
  	artist = Artist.find_by(name: new_artists_name)
  	artist ||= Artist.create(name: new_artists_name)
  	song.artist = artist
  	song.save
  end

  def update_songs_genres(song, genres_names)
    song.genres.clear
    genres_names.each do |genre|
      song.genres << Genre.find_by(name: genre)
    end
  	song.save
  end

end