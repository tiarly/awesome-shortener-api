class ShortenerLinkSerializer
  include FastJsonapi::ObjectSerializer

  attributes :original_url, :shortened_url

  def attributes
    { data: serializable_hash[:data][:attributes] }
  end
end
