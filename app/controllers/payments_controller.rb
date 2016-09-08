class PaymentsController < ApplicationController

  def new
    @billing = Billing.find params[:billing_id]
    @payment = @billing.payments.build
  end

  def create

    @billing = Billing.find params[:billing_id]
    @payment = @billing.payments.build

    if @payment.save
        redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:amount,
                                    :credit_card_number,
                                    :expiration_month,
                                    :expiration_year,
                                    :card_security_code)
  end
end
