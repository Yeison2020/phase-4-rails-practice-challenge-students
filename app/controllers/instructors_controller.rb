class InstructorsController < ApplicationController

    def index 
        data =  Instructor.all
        render json: data
    end

    def show 
        single_data =  Instructor.find_by(id: paarams[:id])
        if single_data
            render json: single_data, status: :ok 
        else   
            render json: {error: 'Data Not found'}, status: :not_found
        end
    end



    def create
        new_Instructor = Instructor.create(instructor_params)
        if new_Instructor.valid?
            render json: new_Instructor, status: :created

        else 
            render json: {error: new_Instructor.errors.full_messages}, status: :unprocessable_entity
        end


    end 


    def destroy 
        delete_data =  Instructor.find_by(params[:id])
        if delete_data
            delete_data.destroy
            head :no_content 

        else 
            render json: {error: 'Data not found'},status: :not_found

        end

    end




    private 


    def instructor_params 
        params.permit(:name)

    end
end
