require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader" if development?
require "httparty"
require "dotenv/load"
require "./models/movie"

set :database, {
  adapter: "sqlite3",
  database: "db/development.sqlite3"
}

get "/" do
  "Hello Sinatra"
end

get "/movies" do
  @movies = Movie.all
  puts "Movies found: #{@movies.inspect}"

  erb :"movies/index"
end

get "/movies/new" do
  erb :"movies/new"
end

post "/movies" do
  Movie.create(title: params[:title], genre: params[:genre])

  redirect "/movies"
end

get "/movies/:id" do
  @movie = Movie.find(params[:id])

  erb :"movies/show"
end

get "/movies/:id/edit" do
  @movie = Movie.find(params[:id])

  erb :"movies/edit"
end

post "/movies/:id" do
  puts params.to_json
  @movie = Movie.find(params[:id])
  @movie.update(title: params[:title], genre: params[:genre])

  redirect "/movies/#{@movie.id}"
end

delete "/movies/:id" do
  @movie = Movie.find(params[:id])
  @movie.destroy

  redirect "/movies"
end
