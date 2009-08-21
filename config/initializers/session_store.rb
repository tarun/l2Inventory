# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_liqn2inventory_session',
  :secret      => '95c3217e299ce7274513ca7dd4c0bd4244643ee38a59b641a99dda973687aceb3ccb8e56c3fff49f959c8a84790d02e470f91927e234e7e8c35d5d3d40e25b80'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
