class Api::V1::HelloController < ApplicationController
end

module Api
    module V1
        class HelloController < ApplicationController
            def index
                render json: {message: "Hello,world!"}
            end
        end
    end
end
