class WelcomeController < ApplicationController

	def index
		#con mechanize abrir la pag d la api q queremos
		##agent = Mechanize.new
		##@page = agent.get('https://btc-e.com/api/3/ticker/btc_usd').body

		@pageBtc = Mechanize.new.get('https://btc-e.com/api/3/ticker/btc_usd').body
		@parseJson = JSON.parse @pageBtc


	end


	def contact
		ContactMailer.contact_mail(params[:mail], params[:name], params[:message]).deliver
		redirect_to root_path
	end
end
