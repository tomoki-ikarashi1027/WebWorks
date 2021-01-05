class HomesController < ApplicationController
  before_action :authenticate_user!, only: [:task, :memo]
  def top
  end

  def about
  end

  def task
  end

  def memo
  end
end
