class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    puts "Base"
    erb :layout
  end

  get '/songs' do
    @songs = Song.all
    @partial = :songs
    erb :layout
  end

  get '/artists' do
    @artists = Artist.all
    @partial = :artists
    erb :layout
  end

  get '/genres' do
    @genres = Genre.all
    @partial = :genres
    erb :layout
  end  

  get '/songs/new' do
    @partial = :new_song
    erb :layout
  end

  post '/songs/new' do
    @genre1 = params[:NewAgeGarbage]
    @genre2 = params[:HippityHop]
    @artist = params[:ArtistName]
    @artist = params[:ArtistName]
    artist2 = Artist.new(name: @artist)
    @song = params[:Name]
    song2 = Song.new(name: @song)
    song2.artist = artist2
    sg = SongsGenre.new()
    sg.song_id = song2.id
      if @genre1 == "on"
        new_genre = Genre.new(name: "New Age Garbage")
        sg.genre_id = new_genre.id
      end
      if @genre2 == "on"
        new_genre2 = Genre.new(name: "Hippity Hop")
        sg.genre_id = new_genre2.id
      end
    song2.save
    @partial = :created_song
    erb :layout
  end

   get '/songs/:slug' do
    song = params[:slug]
    @song3 = Song.find_by_slug(song)
    @partial = :song_page
    erb :layout
  end

  get '/artists/:slug' do
    artist = params[:slug]
    @artist2 = Artist.find_by_slug(artist)
    @partial = :artist_page
    erb :layout
  end

  get '/genres/:slug' do
    genre = params[:slug]
    @genre2 = Genre.find_by_slug(genre)
    @partial = :genre_page
    erb :layout
  end

   get '/songs/:slug/edit' do
    song = params[:slug]
    @song3 = Song.find_by_slug(song)
    @partial = :song_edit_page
    erb :layout
  end


   post '/songs/:slug/edit' do
    song = params[:slug]
    @song3 = Song.find_by_slug(song)
    @genre1 = params[:NewAgeGarbage]
    @genre2 = params[:HippityHop]
    @artist = params[:ArtistName]
    @partial = :update_song_page
    erb :layout
  end









end