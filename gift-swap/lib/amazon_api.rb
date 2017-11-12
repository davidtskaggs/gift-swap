require 'time'
require 'uri'
require 'openssl'
require 'base64'

class AmazonAPI

	#AWS API
	ENDPOINT = "webservices.amazon.com"
	REQUEST_URI = "/onca/xml"

	ACCESS_KEY_ID = ENV["AWS_ACCESS_KEY_ID"]
	SECRET_KEY = ENV["AWS_SECRET_KEY"]
	ASSOCIATE_TAG = ENV["AWS_ASSOCIATE_TAG"]

		#methods
	 def by_keyword(keywords)
	 	params = {
		  "Service" => "AWSECommerceService",
		  "Operation" => "ItemSearch",
		  "AWSAccessKeyId" => ACCESS_KEY_ID,
		  "AssociateTag" => ASSOCIATE_TAG,
		  "SearchIndex" => "All",
		  "Keywords" => keywords,
		  "ResponseGroup" => "Images,ItemAttributes,Offers,Small"
		}
		generate_request_url(params)
	 end

	 def by_cateogry(category)
	 	params = {
		  "Service" => "AWSECommerceService",
		  "Operation" => "ItemSearch",
		  "AWSAccessKeyId" => ACCESS_KEY_ID,
		  "AssociateTag" => ASSOCIATE_TAG,
		  "SearchIndex" => category,
		  "ResponseGroup" => "Images,ItemAttributes,Offers,Small"
		}
		generate_request_ur(params)
	 end

	 def generate_request_url(params)
		# Set current timestamp if not set
		params["Timestamp"] = Time.now.gmtime.iso8601 if !params.key?("Timestamp")
		# Generate the canonical query
		canonical_query_string = params.sort.collect do |key, value|
		  [URI.escape(key.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")), URI.escape(value.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))].join('=')
		end.join('&')
		# Generate the string to be signed
		string_to_sign = "GET\n#{ENDPOINT}\n#{REQUEST_URI}\n#{canonical_query_string}"
		# Generate the signature required by the Product Advertising API
		p '******'
		p SECRET_KEY
		p '******'
		signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), SECRET_KEY, string_to_sign)).strip()
		# Generate the signed URL
		request_url = "http://#{ENDPOINT}#{REQUEST_URI}?#{canonical_query_string}&Signature=#{URI.escape(signature, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"
		puts "Signed URL: \"#{request_url}\""
	 end

end


