json.array!(@mails) do |mail|
  json.extract! mail, :to, :subject, :body
  json.url mail_url(mail, format: :json)
end
