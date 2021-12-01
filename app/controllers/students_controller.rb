class StudentsController < ApplicationController
    def index 
        data = Student.all
        render json: data
    end

    def show 
        single_data = Student.find_by(id: paarams[:id])
        if single_data
            render json: single_data, status: :ok 
        else   
            render json: {error: 'Data Not found'}, status: :not_found
        end
    end



    def create
       new_student =Student.create(instructor_params)
        ifnew_student.valid?
            render json:new_student, status: :created

        else 
            render json: {error:new_student.errors.full_messages}, status: :unprocessable_entity
        end


    end 


    def destroy 
        new_student_data = Student.find_by(params[:id])
        if new_student_data
            new_student_data.destroy
            head :no_content 

        else 
            render json: {error: 'Data not found'}, status: :not_found

        end

    end





end
