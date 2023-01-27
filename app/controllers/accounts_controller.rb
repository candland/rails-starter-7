class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy]

  def index
    @pagy, @accounts = pagy(current_user.accounts.all)
  end

  def show
    set_current_account @account
    Current.account = @account
  end

  def current
    @account = Current.account
    if @account
      # authorize @account, :show?
      render :show
    else
      redirect_to new_account_path
    end
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = Account.new(account_params)
    @account.users << current_user

    if @account.save
      set_current_account @account
      redirect_to @account, notice: "Account was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @account.update(account_params)
      redirect_to @account, notice: "Account was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_url, notice: "Account was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:name)
  end
end
