class NotesController < ApplicationController
  def index
    #html - All Notes
    @notes = Note.all
    #render :index
  end

  def show
    #html - Specific Note
    @notes = Note.find(params[:id])
  end

  def new
    #html - Form for New Note
    @notes = Note.new
  end

  def create
    @notes = Note.new(notes_params)
    @notes.save

    if @notes.save
      redirect_to notes_path
    else
      render :new
    end
  end

  private
  def notes_params
    params.require(:note).permit(:title, :task)
  end

  def edit
    #html - Form for an existing Blog
    @notes = Note.find(params[:id])
  end

  def update
    @notes = Note.find(params[:id])

    if @notes.update(page_params)
      notes_path
    else
      render :edit
    end
  end

  def destroy
    Note.find(params[:id]).destroy
  end

end
 