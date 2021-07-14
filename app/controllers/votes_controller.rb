class VotesController < ApplicationController

  def create
    @vote = current_user.votes.new(billboard_id: params[:billboard_id])

    if @vote.save
      redirect_to root_url, notice: 'Vote added.'
    else
      redirect_to root_url, alert: 'You cannot vote twice.'
    end
  end

  def destroy
    @vote = Vote.find_by(id: params[:id], user: current_user, billboard_id: params[:billboard_id])
    if @vote
      @vote.destroy
      redirect_to root_url, notice: 'You downvoted a billboard.'
    else
      redirect_to root_url, alert: 'You cannot downvote a billboard that you did not vote on.'
    end
  end
end
