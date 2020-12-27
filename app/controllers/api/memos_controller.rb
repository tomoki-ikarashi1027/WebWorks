class Api::MemosController < ApplicationController
  def index
    @memos = Memo.all.order('created_at DESC')
  end

  def create
    @memo = Memo.new(memos_params)
    if @memo.save
      render :show, status: :created
    else
      render json: @memo.errors, status: :unprocessable_entity
    end
  end

  private

  def memos_params
    params.permit(:title, :body)
  end
end
