class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find_by_id(params[:id])
  end

  def index
    @classrooms = Classroom.all
  end
end
