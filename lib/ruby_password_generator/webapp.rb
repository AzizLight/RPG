module RPG
  class WebApplication < Sinatra::Base
    configure do
      set :root, File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
      set :app_file, __FILE__
    end

    get '/' do
      erb "Hello World"
    end

    get /\/([\w\d]{2,})\/([\w\d]+)/i do |algorithm, length|
      begin
        erb RPG::PasswordGenerator.new(algorithm.downcase.capitalize.to_sym).generate(length)
      rescue
        erb "A problem occured while processing the arguments you passed to the #{algorithm.downcase.capitalize} algorithm..."
      end
    end

    get /\/([\w\d]{2,})/i do |algorithm|
      erb RPG::PasswordGenerator.new(algorithm.downcase.capitalize.to_sym).generate
    end

    
  end
end
