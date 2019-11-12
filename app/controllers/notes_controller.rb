class NotesController < ApplicationController
  def index
    #html - All Notes
    @notes = Note.all
    #render :index
  end

  def show
    #html - Specific Note
    @note = Note.find(params[:id])
  end

  def new
    #html - Form for New Note
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)
    @note.save

    if @note.save
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
    @note = Note.find(params[:id])

    if @note.update(page_params)
      redirect_to pages_path
    else
      render :edit
    end
  end

  def update
    Note.find(params[:id]).update
  end

  def destroy
    Note.find(params[:id]).destroy
  end

end
