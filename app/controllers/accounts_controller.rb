class AccountsController < ApplicationController
  load_resource

  def index
    @pagy, @accounts = pagy(@accounts)
  end

  def show
    set_current_account @account
    Current.account = @account
  end

  def current
    @account = Current.account
    if @account
      authorize @account, :show?
      render :show
    else
      redirect_to new_account_path
    end
  end

  def new
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

  def account_params
    permitted_attributes(Account)
  end
end
