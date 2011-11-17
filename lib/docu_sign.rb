require "docu_sign/version"

require 'docu_sign/extensions'

require 'savon'
require 'builder'

require 'docu_sign/client'
require 'docu_sign/docu_sign_model'
require 'docu_sign/docu_sign_response'
require 'docu_sign/anchor_tab'
require 'docu_sign/authentication_status'
require 'docu_sign/document'
require 'docu_sign/envelope'
require 'docu_sign/envelope_status'
require 'docu_sign/error'
require 'docu_sign/notification'
require 'docu_sign/recipient'
require 'docu_sign/recipient_status'
require 'docu_sign/tab'
require 'docu_sign/tab_status'

require 'docu_sign/builder/base'
require 'docu_sign/builder/document_builder'
require 'docu_sign/builder/recipient_builder'
require 'docu_sign/builder/tab_builder'
require 'docu_sign/builder/anchor_builder'
require 'docu_sign/builder/notification_builder'

require 'docu_sign/railtie' if defined?(Rails)

module DocuSign
  # Your code goes here...
end
