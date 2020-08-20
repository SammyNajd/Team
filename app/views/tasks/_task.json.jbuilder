json.extract! task, :id, :start_date, :end_date, :priority, :subject, :description, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
