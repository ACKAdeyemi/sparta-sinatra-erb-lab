class RecordsController < Sinatra::Base

  configire :development do
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
      :phone_number => "01010101010",
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
      :phone_number => "02020202020",
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

    @records = {
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

  # EDIT
  get '/records/:id/edit' do
    id = params[:id].to_i

    @record = $records[id]
    @title = @record[:title]

    erb :'records/edit'
  end

  # UPDATE

  # DESTROY

end
