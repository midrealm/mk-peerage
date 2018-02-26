class DataUriGenerator
  attr_reader :data_uri, :image
  def initialize(image=nil)
    @data_uri = nil
    @image = only_paperclip(image)
    generate_data_uri unless @image.nil?
  end

  private
  def only_paperclip(image)
    if image.class.to_s == 'Paperclip::Attachment' && image.present?
      image
    else
      nil
    end
  end
  
  def generate_data_uri
    file_contents = Paperclip.io_adapters.for(@image).read
    enc = Base64.strict_encode64(file_contents)    
    @data_uri = "data:#{@image.content_type};base64,#{enc}"
  end 

end 
 
