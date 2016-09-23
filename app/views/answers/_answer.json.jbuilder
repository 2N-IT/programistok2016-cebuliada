json.extract! answer, :id, :title, :points, :question_id, :created_at, :updated_at
json.url answer_url(answer, format: :json)