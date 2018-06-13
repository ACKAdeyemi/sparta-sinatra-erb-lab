class RecordsController < Sinatra

  configire :development do
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, "views") }

  # INDEX

  # NEW

  # SHOW

  # CREATE

  # EDIT

  # UPDATE

  # DESTROY

end
