class TodosController < ApplicationController

  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo= Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_url, notice: "Todo was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def toggle
    @todo = Todo.find(params[:id])
    @todo.update(is_completed: params[:is_completed])
  
    render json: { message: "Success" }
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end

end
