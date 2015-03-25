namespace :kotraders_web do
  
  desc "consultamos la cotizacion del btc y la guardamos en bbdd"
  task :get_btc_ticket => :environment do
    content = Mechanize.new.get('https://btc-e.com/api/3/ticker/btc_usd').body
    result = JSON.parse(content)

    high = result['btc_usd']['high']  # en el eje de las 'y' el valor 'high'
    low = result['btc_usd']['low']
    avg = result['btc_usd']['avg']
    vol = result['btc_usd']['vol']
    vol_cur = result['btc_usd']['vol_cur']
    last = result['btc_usd']['last']
    buy = result['btc_usd']['buy']
    sell = result['btc_usd']['sell']
    update_value = result['btc_usd']['updated']

    dollar_init = buy*1.005.round(2); # valor de 'buy' en dolares con el 0,5% incrementado
    euro_init = buy*0.878397*1.005.round(2); # valor de 'buy' en euros con el 0,5% incrementado
    # se multiplica x 0.878... para que te dé los €, pero al cambiar cada dia habría q parametrizarlo
    # y ese parametro habria q recabarlo cada vez q se pinte el valor
    # meter a base de datos los valores parseados
    
    my_tick = Tick.new(:high => high, :low => low, :avg => avg, :vol => vol, :vol_cur => vol_cur, :last => last, :buy => buy, :sell => sell, :update_value => update_value)
    my_tick.save

    puts "buy var guardado: " + "#{buy}"
    puts "update_value: " + "#{update_value}"
  end
end