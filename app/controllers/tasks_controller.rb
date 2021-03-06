class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :get_active_users, only: [:new, :create, :edit, :update]
  helper_method :sort_column, :sort_direction
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.includes(:user).order(sort_column + " " + sort_direction)
    puts "Search query vals"
    puts params[:search_query]

    if (params[:search_query] && params[:search_field])
      @tasks =  Task.search(params[:search_query], params[:search_field]).order(sort_column + " " + sort_direction)
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def get_active_users
      @active_users = []
      User.active.find_each do |user|
        @active_users << ["#{user.last_name}, #{user.first_name}", user.id]
      end
    end

    def sort_direction
      params[:direction] || "desc"
    end

    def sort_column
      params[:sort_column] || "start_date"
    end


    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:start_date, :end_date, :priority, :subject, :description, :status, :user_id)
    end

end
