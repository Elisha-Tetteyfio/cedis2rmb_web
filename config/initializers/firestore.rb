require "google/cloud/firestore"

Google::Cloud::Firestore.configure do |config|
  config.project_id = "cedis2rmb"
  config.credentials = "./config/cedis2rmb-1ccb40dc84cb.json"
end

$firestore = Google::Cloud::Firestore.new
