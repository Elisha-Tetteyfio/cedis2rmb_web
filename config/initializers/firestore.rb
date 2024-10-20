require "google/cloud/firestore"

Google::Cloud::Firestore.configure do |config|
  config.project_id = "cedis2rmb"
  config.credentials = JSON.parse(ENV['FIREBASE_CREDENTIALS'])
end

$firestore = Google::Cloud::Firestore.new
