class AddressesController < ApplicationController

	def new
		@address = Address.new
	end

	def create
		@address = Address.new(address_params)
		if @address.save
			redirect_to addresses_path
		end
	end


	def show
	end


	def index
		@addresses = Address.all
		@hash = Gmaps4rails.build_markers(@addresses) do |address, marker|
		  marker.lat address.lat
		  marker.lng address.lng
		end
	end


	private

	def address_params
		params.require(:address).permit(:name, :lat, :lng, :address)
	end

end
