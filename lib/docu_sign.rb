require 'docu_sign/extensions'

require 'savon'
require 'docu_sign/base'

require 'docu_sign/anchor_tab'
require 'docu_sign/document'
require 'docu_sign/envelope'
require 'docu_sign/recipient'
require 'docu_sign/tab'
require 'docu_sign/tab_type_code'

require 'docu_sign/builder/base'
require 'docu_sign/builder/tab_builder'
require 'docu_sign/builder/anchor_builder'

require 'docu_sign/railtie' if defined?(Rails)