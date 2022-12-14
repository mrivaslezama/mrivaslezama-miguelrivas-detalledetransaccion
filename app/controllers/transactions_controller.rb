class TransactionsController < ApplicationController

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save(context: :create_from_controller)
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:amount, :concept, :date, :kind, :account_id, :user_id)
    end
end
