class RecordsController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, "views") }

  # patient records - title, first_name, last_name, house_no, street, city, postcode, phone_number, DoB

  $records = [
    {
      :id => 0,
      :title => "Mr",
      :first_name => "John",
      :last_name => "Doe",
      :house_no => 1,
      :street => "Castle Yard",
      :city => "London",
      :postcode => "TW10 6TF",
      :phone_number => "07711223344",
      :d_of_b => "01/01/1991"
    },
    {
      :id => 1,
      :title => "Mrs",
      :first_name => "Jane",
      :last_name => "Doe",
      :house_no => 2,
      :street => "Castle Yard",
      :city => "London",
      :postcode => "TW10 6TF",
      :phone_number => "07799223344",
      :d_of_b => "02/02/1992"
    }
  ]

  # INDEX
  get '/records' do

    @title = "Records Index"
    @records = $records # sets global variable to records hash

    erb :'records/index' # directs to index.erb (no need to write views/... as views has been set as root)
  end

  # NEW
  get '/records/new' do
    @title = "New Patient Record" # global variable, use them sparingly

    @record = {
      :id => "",
      :title => "",
      :first_name => "",
      :last_name => "",
      :house_no => "",
      :street => "",
      :city => "",
      :postcode => "",
      :phone_number => "",
      :d_of_b => ""
    }

    erb :'records/new'
  end

  # SHOW
  get '/records/:id' do
    id = params[:id].to_i

    @title = "Show Record"
    @record = $records[id]

    erb :'records/show'
  end

  # CREATE
  post '/records' do
    # puts params # on submit, form data submits to URL

    id = $records.last[:id] + 1

    new_record = {
      :id => id,
      :title => params[:title],
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :house_no => params[:house_no],
      :street => params[:street],
      :city => params[:city],
      :postcode => params[:postcode],
      :phone_number => params[:phone_number],
      :d_of_b => params[:d_of_b]
    }

    $records.push new_record

    redirect '/records'
  end

  # EDIT
  get '/records/:id/edit' do
    id = params[:id].to_i

    @record = $records[id]
    @title = @record[:title]

    erb :'records/edit'
  end

  # UPDATE
  put '/records/:id' do

    id = params[:id].to_i

    record = $records[id] # get hash from array

    record[:title] = params[:title] # update hash with values from URL/params
    record[:first_name] = params[:first_name]
    record[:last_name] = params[:last_name]
    record[:house_no] = params[:house_no]
    record[:street] = params[:street]
    record[:city] = params[:city]
    record[:postcode] = params[:postcode]
    record[:phone_number] = params[:phone_number]
    record[:d_of_b] = params[:d_of_b]

    $records[id] = record # save new data back into array

    redirect '/records'
  end

  # DESTROY
  delete '/records/:id' do
    id = params[:id].to_i

    $records.delete_at id

    redirect '/records'
  end

end
