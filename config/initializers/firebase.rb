require "google/cloud/storage"

Google::Cloud::Storage.configure do |config|
  config.project_id = "cedis2rmb"
  config.credentials = "./config/cedis2rmb-1ccb40dc84cb.json"
end

FIREBASE_STORAGE = Google::Cloud::Storage.new
BUCKET_NAME = 'cedis2rmb.appspot.com'
