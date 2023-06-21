class Api::V1::StudentsController < ApplicationController
  def index
    students = Student.all

    render json: students, status: :ok
  end

  # GET /students/1
  def show
    student = Student.find(params[:id])

    if student
      render json: student, status: :ok
    else
      render json: student.errors, status: :bad_request
    end
  end

  # POST /students/1/rservation
  def create
    @student = Student.new(student_params)
    if @student.save
      render json: {
        status: { success: true, message: 'Student created successfully' }
      }
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      render json: { success: true, message: 'student deleted successfully' }, status: :ok
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:name, :graduation, :hire, :position, :company, :image)
  end
end
