require 'time'
require 'uri'
require 'openssl'
require 'base64'

class Wishlist < ApplicationRecord
	belongs_to :user 
	has_many :wishlist_items 
	has_many :gifts, through: :wishlist_items  

	accepts_nested_attributes_for :gifts, allow_destroy: true
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

	 def by_category(category)
	 	params = {
		  "Service" => "AWSECommerceService",
		  "Operation" => "ItemSearch",
		  "AWSAccessKeyId" => ACCESS_KEY_ID,
		  "AssociateTag" => ASSOCIATE_TAG,
		  "SearchIndex" => category,
		  "ResponseGroup" => "Images,ItemAttributes,Offers,Small"
		}
		generate_request_url(params)
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
		signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), SECRET_KEY, string_to_sign)).strip()
		# Generate the signed URL
		request_url = "http://#{ENDPOINT}#{REQUEST_URI}?#{canonical_query_string}&Signature=#{URI.escape(signature, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"
		# puts "Signed URL: \"#{request_url}\""
		# puts HTTParty.get(request_url)
		return_results(request_url)
	 end

	 def return_results(url)
	 	results = HTTParty.get(url)
	 end

	 def parsed_info_by_keyword(keyword)
	 	result_hash = self.by_keyword(keyword)
	 	returned_hash = {names: [], prices: [], urls: [], 
	 		images: [], categories: []}
	 	result_hash["ItemSearchResponse"]["Items"]["Item"].map do |elt|
	 		returned_hash[:names] << elt["ItemAttributes"]["Title"]
	 		returned_hash[:prices] << elt["OfferSummary"]["LowestNewPrice"]["FormattedPrice"]
	 		returned_hash[:urls] << elt["DetailPageURL"].split("?").first
	 		returned_hash[:images] << elt["SmallImage"]["URL"]
	 		returned_hash[:categories] << keyword 
	 	end
	 	return returned_hash
	 end 

	 def parsed_info_by_category(category)
	 	result_hash = self.by_category(category)
	 	returned_hash = {names: [], prices: [], urls: [], 
	 		images: [], categories: []}
	 	result_hash["ItemSearchResponse"]["Items"]["Item"].map do |elt|
	 		returned_hash[:names] << elt["ItemAttributes"]["Title"]
	 		returned_hash[:prices] << elt["OfferSummary"]["LowestNewPrice"]["FormattedPrice"]
	 		returned_hash[:urls] << elt["DetailPageURL"].split("?").first
	 		returned_hash[:images] << elt["SmallImage"]["URL"]
	 		returned_hash[:categories] << category 
	 	end
	 	return returned_hash
	 end 

end