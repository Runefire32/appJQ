class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end

  def destroy
    @email = Email.find(params[:id])
    if @email.present?
      @email.destroy
    respond_to do |format|
        format.js { }
      end
    end
  end

  private

  def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
      def email_params
        #je push le user id dans mon hash
          temp_params = params.require(:email).permit(:object, :body)
          return temp_params
      end
end
