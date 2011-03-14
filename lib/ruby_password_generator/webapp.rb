module RPG
  class WebApplication < Sinatra::Base
    configure do
      set :root, File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
      set :app_file, __FILE__
    end

    get '/' do
      erb "Hello World"
    end
  end
end
