# followers
# repo count
# languages

#<HTTParty::Response:0x7ff77ad7bfd0 @parsed_response={"user"=>{"name"=>"Anders Fisher", "company"=>nil, "gravatar_id"=>"eae796febaf16d9b4ecf41ef6246f301", "location"=>"Ipswich, Suffolk, UK", "created_at"=>2010-12-29 09:46:54 UTC, "blog"=>"andersfisher.com", "public_gist_count"=>3, "public_repo_count"=>21, "following_count"=>13, "id"=>540097, "permission"=>nil, "type"=>"User", "followers_count"=>3, "login"=>"atleastimtrying", "email"=>nil}}, @response=#<Net::HTTPOK 200 OK readbody=true>, @headers={"server"=>["nginx/1.0.13"], "date"=>["Sat, 28 Apr 2012 10:02:58 GMT"], "content-type"=>["application/xml; charset=utf-8"], "connection"=>["close"], "status"=>["200 OK"], "x-ratelimit-limit"=>["60"], "etag"=>["\"f56dc21c3f5c516064c8203730a0502c\""], "x-frame-options"=>["deny"], "x-ratelimit-remaining"=>["57"], "x-runtime"=>["11"], "content-length"=>["703"], "cache-control"=>["private, max-age=0, must-revalidate"]}>

class Person
	attr_accessor :name, :followers

	def initialize
		@followers = []
	end

	def to_json(*a)
	{
	  'followers' => followers,
	}.to_json(*a)
	end

end