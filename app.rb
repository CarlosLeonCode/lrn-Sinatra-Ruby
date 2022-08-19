require "sinatra"
require "sinatra/reloader"

# * Normal route                | -----------------
get '/' do
  'hello World!'
end

# * Accesing to parameters      | -----------------
get '/hi/:name' do
  "Hello #{params['name']}"
end
get '/say/:phrase' do |prm|
  "Hey!, #{prm}"
end

# * Patterns                    | -----------------
get '/song/*genre/*' do
  # /song/genre/files/song1.mp3
  "Song found -> #{params['splat']}"
  # OUT -> ["files/song1.mp3"]
end
get '/picture/**' do |path, splat|
  # /picture/landscapes/mountains/mount.png
  splat
end

# * Regular Expressions         | -----------------
get /\/letter\/([\w])/ do
  # /letter/s
  params['captures']
end
get /\/phrase\/([\w]+)/ do |captures|
  # /phrase/saySomething
  captures
end
