class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
helper_method :current_retailer, :current_brand,:require_retailer!, :require_brand!

def after_sign_out_path_for(resource)
 contents_path
end


  # def account_url
  #   return new_user_session_url unless user_signed_in?
  #   case current_user.class.name
  #   when "Brand"
  #     brand_root_url
  #   when "Retailer"
  #     retailer_root_url
  #   else
  #     root_url
  #   end if user_signed_in?
  # end

  # def after_sign_in_path_for(resource)
  #   stored_location_for(resource) || account_url
  # end

  private
    def current_brand
      @current_brand ||= current_user if user_signed_in? and current_user.class.name == "Brand"
    end

    def current_retailer
      @current_retailer ||= current_user if user_signed_in? and current_user.class.name == "Retailer"
    end

    def brand_logged_in?
      @brand_logged_in ||= user_signed_in? and current_brand
    end

    def retailer_logged_in?
      @retailer_logged_in ||= user_signed_in? and current_retailer
    end

    def require_Brand
      require_user_type(:brand)
    end

    def require_Retailer
      require_user_type(:retailer)
    end

    def require_user_type(user_type)
      if (user_type == :retailer and !retailer_logged_in?) or
        (user_type == :brand and !brand_logged_in?)
        redirect_to root_path, status: 301, notice: "You must be logged in a#{'n' if user_type == :admin} #{user_type} to access this content"
        return false
      end
    end
end
