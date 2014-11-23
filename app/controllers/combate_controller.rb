class CombateController < ApplicationController
before_filter :authenticate_user!#, :except => [:show, :index]
	

	def preparados

		#session[:prueba] = "Prueba"
		#@p = session[:prueba]

		coincidencias = User.count
		@random = rand(coincidencias)+1
		#@random = 3
		@rival = User.where(:id => @random, :permiso => "usuario")
		@rival_id = User.find(@random)
		session[:luchador] = @rival_id.email
	
	end

	def batalla
		
		
	end
end


