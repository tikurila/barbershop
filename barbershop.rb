require 'sinatra'

get '/' do

	erb :index
end

post '/' do
	@user_name = params[:user_name]
	@phone = params[:phone]
	@data_time = params[:data_time]

	@title = 'Спасибо вам!!!'
	@message = "Здравствуйте, #{@user_name},будем ждать вас в барбершопе Supernatural #{@data_time}"
	
	f = File.open './public//users.txt','a'
    f.write  "      Имя: #{@user_name}, номер телефона: #{@phone}, дата и время: #{@data_time}
    



    "
    f.close

erb :message

end


get '/admin' do
	erb :admin
end



post '/admin' do
	@login = params[:login]
	@password = params[:password]

	if @login == 'admin' && @password == 'winchester'
		erb :spisok
	else
		@error = "не верный пароль"
		erb :admin
	end	

end   

