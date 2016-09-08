class BillingsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :new]

  def new
    @billing = Billing.new
  end

  def create
    @billing = Billing.new billing_params
    @billing.user = current_user
    if @billing.save
      redirect_to new_billing_payment_path(@billing)
    else
      render :new
    end
  end

  private

  def billing_params
    params.require(:billing).permit(:first_name,
                                    :last_name,
                                    :address,
                                    :city,
                                    :province,
                                    :postal_code)
  end

end
