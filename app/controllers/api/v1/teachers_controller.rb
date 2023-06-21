class Api::V1::TeachersController < ApplicationController
  def index
    teachers = Teacher.all

    render json: teachers, status: :ok
  end

  # GET /teachers/1
  def show
    teacher = Teacher.find(params[:id])

    if teacher
      render json: teacher, status: :ok
    else
      render json: teacher.errors, status: :bad_request
    end
  end

  # POST /teachers/1/rservation
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      render json: {
        status: { success: true, message: 'Teacher created successfully' }
      }
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/1
  def destroy
    @teacher = Teacher.find(params[:id])
    if @teacher.destroy
      render json: { success: true, message: 'teacher deleted successfully' }, status: :ok
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def teacher_params
    params.require(:teacher).permit(:name, :description, :image)
  end
end
