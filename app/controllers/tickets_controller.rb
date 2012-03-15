class TicketsController < ApplicationController

  before_filter :find_project
  before_filter :find_ticket, :only => [ :show, :edit, :update, :destroy ]


  def new
    @ticket = @project.tickets.build 
  end

  def create
    @ticket = @project.tickets.build(params[:ticket])
    if @ticket.save
      flash[:notice] = "Ticket has been created"
      #passing an array to redirect_to
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created"
      render 'new'
    end
  end

  def show
    #filter is finding the ticket
  end

  def edit
    #filter is finding the ticket
  end

  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Ticket has been updated"
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated"
      render 'edit'
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted"
    redirect_to project_path
  end

  private
    def find_project
      @project = Project.find(params[:project_id])
    end

    def find_ticket
      @ticket = @project.tickets.find(params[:id])
    end
end
