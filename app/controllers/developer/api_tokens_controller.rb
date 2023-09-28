# frozen_string_literal: true

class Developer::ApiTokensController < Developer::DevelopersController
  load_resource

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @api_token = ApiToken.new(api_token_params.merge(user: current_user)).make_token

    if @api_token.save
      redirect_to [:developer, @api_token], notice: "Api token was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @api_token.update(api_token_params)
      redirect_to [:developer, @api_token], notice: "Api token was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @api_token.delete!
    redirect_to developer_api_tokens_url, notice: "Api token was successfully destroyed."
  end

  private

  def api_token_params
    params.require(:api_token).permit(:name)
  end
end
