class Spree::Api::GoshipmentsController < Spree::Api::BaseController
 
    #defualt packages to be rendered 
    def package_type
        render json: PackageType.all
    end
end
