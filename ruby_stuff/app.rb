TWITTER_FOLLOWERS_API = "https://api.twitter.com/1/followers/ids.json?screen_name="

get '/' do
  file_path = File.join(File.dirname(__FILE__), '..', 'public', "index.html") 
	content_type File.extname(file_path)
	File.read(file_path)
end

get %r{/public/(.+)} do |url|
	file_path = File.join(File.dirname(__FILE__), '..', 'public', "#{url}") 
	content_type File.extname(file_path)
	File.read(file_path)
end

# starting point for people
get %r{/followers/([\w]+).json} do |person|
  content_type :json
 	user = get_user person
 	user.to_json
end

def get_user(username)

	# create person
	p = Person.new
	twitter_followers_request = HTTParty.get("#{TWITTER_FOLLOWERS_API}#{username}")['ids']
	p.followers = twitter_followers_request
	p

end
