namespace :prueba do

	desc "mi primer rake con hola mundo"
  task :saludar => :environment do
  	while true
  		@pageBtc = Mechanize.new.get('https://btc-e.com/api/3/ticker/btc_usd').body
			@parseJson = JSON.parse @pageBtc

			values = '@parseJson'
			#x = (new Date()).getTime(); #en el eje de las 'x' el tiempo
			high =  @parseJson['btc_usd']['high']  # en el eje de las 'y' el valor 'high'
			low =  @parseJson ['btc_usd']['low']
			avg =  @parseJson ['btc_usd']['avg']
			vol =  @parseJson ['btc_usd']['vol']
			vol_cur =  @parseJson ['btc_usd']['vol_cur']
			last =  @parseJson ['btc_usd']['last']
			buy =  @parseJson ['btc_usd']['buy']
			sell =  @parseJson ['btc_usd']['sell']
			update_value =  @parseJson ['btc_usd']['updated']

			dollar_init = buy*1.005.round(2); # valor de 'buy' en dolares con el 0,5% incrementado
			euro_init = buy*0.878397*1.005.round(2); # valor de 'buy' en euros con el 0,5% incrementado
																							# se multiplica x 0.878... para que te dé los €, pero al cambiar cada dia habría q parametrizarlo
																							# y ese parametro habria q recabarlo cada vez q se pinte el valor
			# meter a base de datos los valores parseados
			my_tick = Tick.new(:high => high, :low => low, :avg => avg, :vol => vol, :vol_cur => vol_cur, :last => last, :buy => buy, :sell => sell, :update_value => update_value)
			my_tick.save

    	puts "buy var guardado: " + "#{buy}"
    	puts "update_value: " + "#{update_value}"
    	sleep(3)
  	end
  end

  desc "mi segundo rake con adios mundo"
  task :despedir do
    puts "adios mundo"
  end
end
