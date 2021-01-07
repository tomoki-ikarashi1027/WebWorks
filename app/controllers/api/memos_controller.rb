class Api::MemosController < ApplicationController
  skip_before_action :verify_authenticity_token

    def index
      @user = current_user
      @memos = @user.memos.order('created_at DESC')
    end

    def create
      @memo = Memo.new(memo_params)
      @memo.user_id = current_user.id
      if @memo.save
        render json: @memo, status: :created
      else
        render json: @memo.errors, status: :unprocessable_entity
      end
    end

    def destroy
      Memo.find(params[:id]).destroy!
    end

    def update
      Memo.find(params[:id]).toggle!(:is_done)
    end

    private

    def memo_params
      params.require(:memo).permit(:title, :body, :is_done)
    end
end
