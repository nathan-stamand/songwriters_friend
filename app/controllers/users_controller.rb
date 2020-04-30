class UsersController < ApplicationController

    get "/users/signup" do
        if !!current_user 
            redirect to "/users/#{current_user.id}"
        end
        erb :"users/new"
    end

    post "/users/signup" do 

    end 

    get "/users/login" do 

    end 

    post "/users/login" do 

    end

    get "/users/logout" do 

    end

    get "/users/:id" do 

    end

    post "/users/:id" do 

    end 

    patch "/users/:id/edit" do 

    end

    delete "/users/:id/delete" do 

    end

end