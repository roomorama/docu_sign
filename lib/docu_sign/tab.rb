module DocuSign
  class Tab
    attr_accessor :document_id
    attr_accessor :recipient_id
    attr_accessor :page_number
    attr_accessor :x_position
    attr_accessor :y_position
    attr_accessor :scale_value
    attr_accessor :anchor_tab_item
    attr_accessor :type
    attr_accessor :name
    attr_accessor :tab_label
    attr_accessor :value
    attr_accessor :custom_tab_type
    attr_accessor :custom_tab_width
    attr_accessor :custom_tab_height
    attr_accessor :custom_tab_required
    attr_accessor :custom_tab_locked
    attr_accessor :custom_tab_disable_auto_size
    attr_accessor :custom_tab_list_items
    attr_accessor :custom_tab_list_values
    attr_accessor :custom_tab_list_selected_value
    attr_accessor :custom_tab_radio_group_name
    attr_accessor :custom_tab_validation_pattern
    attr_accessor :custom_tab_validation_message
    attr_accessor :template_locked
    attr_accessor :template_required
    attr_accessor :conditional_parent_label
    attr_accessor :conditional_parent_value
    attr_accessor :shared_tab
    attr_accessor :require_initial_on_shared_tab_change
    attr_accessor :conceal_value_on_document

    alias_attribute :page, :page_number
    alias_attribute :x, :x_position
    alias_attribute :y, :y_position

    def initialize(document_id = nil, recipient_id = nil, page_number = nil, x_position = nil, y_position = nil, scale_value = nil, anchor_tab_item = nil, type = nil, name = nil, tab_label = nil, value = nil, custom_tab_type = nil, custom_tab_width = nil, custom_tab_height = nil, custom_tab_required = nil, custom_tab_locked = nil, custom_tab_disable_auto_size = nil, custom_tab_list_items = nil, custom_tab_list_values = nil, custom_tab_list_selected_value = nil, custom_tab_radio_group_name = nil, custom_tab_validation_pattern = nil, custom_tab_validation_message = nil, template_locked = nil, template_required = nil, conditional_parent_label = nil, conditional_parent_value = nil, shared_tab = nil, require_initial_on_shared_tab_change = nil, conceal_value_on_document = nil)
      @document_id = document_id
      @recipient_id = recipient_id
      @page_number = page_number
      @x_position = x_position
      @y_position = y_position
      @scale_value = scale_value
      @anchor_tab_item = anchor_tab_item
      @type = type
      @name = name
      @tab_label = tab_label
      @value = value
      @custom_tab_type = custom_tab_type
      @custom_tab_width = custom_tab_width
      @custom_tab_height = custom_tab_height
      @custom_tab_required = custom_tab_required
      @custom_tab_locked = custom_tab_locked
      @custom_tab_disable_auto_size = custom_tab_disable_auto_size
      @custom_tab_list_items = custom_tab_list_items
      @custom_tab_list_values = custom_tab_list_values
      @custom_tab_list_selected_value = custom_tab_list_selected_value
      @custom_tab_radio_group_name = custom_tab_radio_group_name
      @custom_tab_validation_pattern = custom_tab_validation_pattern
      @custom_tab_validation_message = custom_tab_validation_message
      @template_locked = template_locked
      @template_required = template_required
      @conditional_parent_label = conditional_parent_label
      @conditional_parent_value = conditional_parent_value
      @shared_tab = shared_tab
      @require_initial_on_shared_tab_change = require_initial_on_shared_tab_change
      @conceal_value_on_document = conceal_value_on_document
    end

    def anchor(options = {}, &block)
      returning anchor_builder.build(options, &block) do |a|
        yield a if block_given?
        self.anchor_tab_item = a
      end
    end

    def anchor=(options = {})
      anchor options
    end

    def anchor_builder
      @anchor_builder ||= DocuSign::Builder::AnchorBuilder.new
    end

    %w(recipient document).each do |attr|
      class_eval %Q{
        def #{attr}=(value)
          self.#{attr}_id = value.id
        end
      }
    end
  end
end

# {http://www.docusign.net/API/3.0}ArrayOfTab
module DocuSign
  class ArrayOfTab < ::Array
  end
end