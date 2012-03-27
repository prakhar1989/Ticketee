class TagsController < ApplicationController
  def remove
   @ticket = Ticket.find(params[:ticket_id]) 
  end
end
