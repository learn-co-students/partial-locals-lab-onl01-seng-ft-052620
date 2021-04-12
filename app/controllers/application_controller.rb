class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def index
    binding.pry
    if params[:query]
      @students = Student.search(params[:query])
      render :'students/index'
    end
  end

  def query_params
    params.permit[:query]
  end
end
