class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    erb :'songs/index'
  end

  get '/artists' do
    erb :'artists/index'
  end

  get '/genres' do
    erb :'genres/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/new' do
    @artist = Artist.new.tap{|t|
      t.name = params["Artist Name"]
    }
    @artist.save
    @song = Song.new.tap{|t|
             t.name = params[:Name]
             if !!Artist.all.find{|artist| artist.name == params["Artist Name"]}
              t.artist = Artist.all.find{|artist| artist.name == params["Artist Name"]}
             else
              t.artist = Artist.new.tap{|t| t.name = params["Artist Name"]}
             end
             params.select{|k,v| v == "on"}.keys.each{|genre_name|
               Genre.all.map{|genre| 
                 if genre.name == genre_name
                   t.genres << genre
                 end
               }
             }
           }
    @song.save
    @genres = @song.genres

    erb :'/songs/success'
  end

  get '/songs/:slug/edit' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres

    erb :'songs/edit'
  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    @artist = @song.artist
    @genres = @song.song_genres

      erb :'songs/show'
  end

  get '/artists/:slug' do
    slug = params[:slug]
    @artist = Artist.find_by_slug(slug)
    @songs = @artist.songs
    @genres = @artist.genres

      erb :'artists/show'
  end

  get '/genres/:slug' do
    slug = params[:slug]
    @genre = Genre.find_by_slug(slug)
    @artists = Artist.all.select{|artist| artist.genres.include?(@genre)}
    @songs = Song.all.select{|song| song.genres.include?(@genre)}

      erb :'genres/show'
  end

end