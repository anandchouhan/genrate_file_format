class UsersController < ApplicationController
  require "prawn"
  require 'prawn/table'
  require 'csv'


	def index
		@users = User.all
		#@users = User.active
	end

	def new
		@user = User.new
    @user.build_course
	end



	def create
	  @user = User.new(user_params)
	  if @user.save
	    redirect_to users_path
	  else
	    render :new
	  end
	end


	def pdf_file
	  @users = User.all
    respond_to do |format|
	    format.pdf do
	      pdf = Prawn::Document.new
	      format.pdf{ render :file => "#{RAILS_ROOT}/public/pdf/download.pdf"}
	      table_data = Array.new
	      table_data << ["User name", "User address"]
	      @users.each do |p|
	        table_data << [p.name, p.address]
	      end
	      pdf.table(table_data, :width => 500, :cell_style => { :inline_format => true })
	      send_data pdf.render, filename: 'test.pdf', type: 'application/pdf', :disposition => 'inline'
	    end
    end
	end


	def csv_file
    @users = User.all
    respond_to do |format|
      format.html
      format.csv { render text: @users.to_csv }
      #format.xls { render text: @users.to_csv(col_sep: "\t") }
    end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	def edit
		@user = User.find(params[:id])
	end


  def show
    @user = User.find(params[:id])
  end
  

	def update
		@user = User.find(params[:id])
		#@user.update(user_params)
		@user.update_attributes(user_params)
		redirect_to users_path
	end


	private

	def user_params
		params.require(:user).permit(:name, :address, :mob_no, course_attributes: [:course1, :course2 , :course3])
	end

end
