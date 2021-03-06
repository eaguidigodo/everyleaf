class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    #puts "ici la valeur de select #{params[:search_status].to_s.strip.empty?}"
    if params[:search] 
      @tasks = Task.search(params[:search])
      if !params[:search_status].to_s.strip.empty?
        @tasks = @tasks.select{ |task| task.status == params[:search_status] }
      end
    elsif params[:search_status]
      @tasks = Task.search_status(params[:search_status])
    elsif params[:sort_priority]
      @tasks = current_user.tasks.order("priority desc")
    else
      if params[:sort_expired]
        @sort_expired = params[:sort_expired]
        @tasks = current_user.tasks.order("deadline desc")
      else
        @tasks = current_user.tasks.order("created_at desc")
      end
    end
    @tasks = Kaminari.paginate_array(@tasks).page(params[:page]).per(5)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @tasks = current_user.tasks.all
  end
  
  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :detail, :deadline, :status, :search, :search_status, :priority)
    end
end
