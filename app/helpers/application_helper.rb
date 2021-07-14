module ApplicationHelper

  def upvote_or_downvote_btn(billboard)
    vote = Vote.find_by(billboard: billboard, user: current_user)
    if vote
      link_to('<i class="fa fa-thumbs-down"></i>'.html_safe,
      billboard_vote_path(id: vote.id, billboard_id: billboard.id), method: :delete)
    else
      link_to('<i class="fa fa-thumbs-up"></i>'.html_safe, billboard_votes_path(billboard_id: billboard.id), id: 'upvote_#{table_row_no}', method: :post)
    end
  end
  
end


