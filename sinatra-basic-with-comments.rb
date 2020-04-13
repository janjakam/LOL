=begin
    install Sinatra: gem install sinatra
    install Shotgun: gem install shotgun (this auto-reloads sinatra on every http request - which means every time you make a change in your code you don't have to stop then start sinatra)
    To just run your code using Sinatra: ruby name-of-file.rb
    To run your code using Shotgun (which is just Sinatra but with ability to auto-reload when changes are made to files): shotgun name-of-file.rb
    The following examples are run using Shotgun and the URL is: http://127.0.0.1:9393/
    Note: When you run 'shotgun' it might well give you a different URL port number.
=end

require "sinatra"

=begin
    The following line helps direct the requests for static resources (e.g. styles & scripts) 
    to the correct location by telling it what the 'public' folder should be. 
    e.g. if there is a request for 'Assets/Styles/test.css then the styles wont be found.
    This is because the request is coming from a template file which is loaded from /views/
    so we need to set the default route back to "/" so even though the template is within 
    /views/ the request will correct locate Assets/Styles/test.css
=end

set :public_folder, File.dirname(__FILE__)

=begin
    The following is an example of generating some HTML that submits the form data
    back to the current page "/" and then uses a "post" check to display the posted
    form data
=end

get "/" do
    %q{
        Hello World!<br><f><a href="http://www.google.com">Google</a>
        <form method="post">
        Enter your name: <input type="text" name="name" />
        <input type="submit" value="Go!" />
        </form>
    }
end

post "/" do
    # When receiving post data from a form field we need to use a "Named Parameter"
    "Hello #{params[:name]}"
end

=begin
    The following examples show how to set-up code to run when accessing a specific
    URL route like http://127.0.0.1:9393/add/5/1 
=end

# This example uses 'Named Parameters' (e.g. params[:name])
get "/add/:a/:b" do
    # http://127.0.0.1:9393/add/5/1 which should display 6 (5+1)
    (params[:a].to_i + params[:b].to_i).to_s
end

# This example uses 'block parameters' (e.g. |x, y, z|)
get "/subtract/:a/:b" do |a, b|
    # Go to http://127.0.0.1:9393/subtract/5/1 which should display 4 (5-1)
    (a.to_i - b.to_i).to_s
end

=begin
    The following example shows how to use Templates and Layouts.
    A Template is HTML code interpolated with dynamic content.
    A Layout is a wrapper around the Template (e.g. <html><body>TEMPLATE</body></html> which means you don't have to include the same page content around your Template)
    Templating is handled via Erb, but there are other template languages you can use
    instead such as HAML or Builder
=end

# The "before" code block is executed before ALL requests
before do
    @people = [
        { :name => "Mark", :age => 30 },
        { :name => "Brad", :age => 21 },
        { :name => "Ash", :age => 21 }
    ] 
end

# you must have a folder called 'views' with your template & layout files within it
# e.g. /views/mylayout.erb and /views/mytemplate.erb (see additional files below for the content of these files)
get "/erb-template-external" do
    erb :mytemplate, :layout => :mylayout
end