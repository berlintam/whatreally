class FactVotesController < ApplicationController

  private

  def vote_params
    params.require(:fact_vote).permit(:value)
  end
end
