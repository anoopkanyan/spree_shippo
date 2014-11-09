##########################################################
# SHIPPO PARTNER ACCESS SETTINGS
# The partner key is the human-readable Shippo partner name.
# The partner secret is a 32 character token, issued by Shippo.
##########################################################
Rails.configuration.shippo_partner_key = nil
Rails.configuration.shippo_partner_secret = nil
##########################################################
# SHIPPO PARTNER AUTHENTICATION SETTINGS
# These settings can only be used if a partner key and 
# secret have been set.
##########################################################
Rails.configuration.shippo_register_automatically = false
Rails.configuration.shippo_user_usps_set = false