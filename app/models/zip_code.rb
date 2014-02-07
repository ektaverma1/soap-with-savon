class ZipCode
  attr_reader :state, :city, :area_code, :time_zone
  	def initialize(zip)
  		client = Savon.client(wsdl: "http://www.webservicex.net/uszip.asmx?WSDL")
  		response = client.call(:get_info_by_zip, message: { us_zip: zip })
  		if response.success?
     	 	data = response.to_array(:get_info_by_zip_response, :get_info_by_zip_result, :new_data_set, :table).first
      		if data
			    @state = data[:state]
			    @city = data[:city]
			    @area_code = data[:area_code]
			    @time_zone = data[:time_zone]
      		end
    	end
  	end 
end