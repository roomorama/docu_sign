module DocuSign
  class Tab < DocuSignModel
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
    attr_accessor :conceal_value_on_document
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
    attr_accessor :font
    attr_accessor :bold
    attr_accessor :italic
    attr_accessor :underline
    attr_accessor :font_color
    attr_accessor :font_size
    attr_accessor :merge_field_xml
    attr_accessor :include_note_in_email

    alias_attribute :page, :page_number
    alias_attribute :x, :x_position
    alias_attribute :y, :y_position

    def initialize(attributes = {})
      @document_id = attributes[:document_id]
      @recipient_id = attributes[:recipient_id]
      @page_number = attributes[:page_number]
      @x_position = attributes[:x_position]
      @y_position = attributes[:y_position]
      @scale_value = attributes[:scale_value]
      @anchor_tab_item = attributes[:anchor_tab_item]
      @type = attributes[:type]
      @name = attributes[:name]
      @tab_label = attributes[:tab_label]
      @value = attributes[:value]
      @custom_tab_type = attributes[:custom_tab_type]
      @custom_tab_width = attributes[:custom_tab_width]
      @custom_tab_height = attributes[:custom_tab_height]
      @custom_tab_required = attributes[:custom_tab_required]
      @conceal_value_on_document = attributes[:conceal_value_on_document]
      @custom_tab_locked = attributes[:custom_tab_locked]
      @custom_tab_disable_auto_size = attributes[:custom_tab_disable_auto_size]
      @custom_tab_list_items = attributes[:custom_tab_list_items]
      @custom_tab_list_values = attributes[:custom_tab_list_values]
      @custom_tab_list_selected_value = attributes[:custom_tab_list_selected_value]
      @custom_tab_radio_group_name = attributes[:custom_tab_radio_group_name]
      @custom_tab_validation_pattern = attributes[:custom_tab_validation_pattern]
      @custom_tab_validation_message = attributes[:custom_tab_validation_message]
      @template_locked = attributes[:template_locked]
      @template_required = attributes[:template_required]
      @conditional_parent_label = attributes[:conditional_parent_label]
      @conditional_parent_value = attributes[:conditional_parent_value]
      @shared_tab = attributes[:shared_tab]
      @require_initial_on_shared_tab_change = attributes[:require_initial_on_shared_tab_change]
      @font = attributes[:font]
      @bold = attributes[:bold]
      @italic = attributes[:italic]
      @underline = attributes[:underline]
      @font_color = attributes[:font_color]
      @font_size = attributes[:font_size]
      @merge_field_xml = attributes[:merge_field_xml]
      @include_note_in_email = attributes[:include_note_in_email]
    end

    def anchor(options = {}, &block)
      anchor_builder.build(options, &block).tap do |a|
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

    def to_savon
      {"Tab" => {
        "DocumentID" => self.document_id,
        "RecipientID" => self.recipient_id,
        "PageNumber" => self.page_number,
        "XPosition" => self.x_position,
        "YPosition" => self.y_position,
        "ScaleValue" => self.scale_value,
        "AnchorTabItem" => self.anchor_tab_item.try(:to_savon),
        "Type" => self.type,
        "Name" => self.name,
        "TabLabel" => self.tab_label,
        "Value" => self.value,
        "CustomTabType" => self.custom_tab_type,
        "CustomTabWidth" => self.custom_tab_width,
        "CustomTabHeight" => self.custom_tab_height,
        "CustomTabRequired" => self.custom_tab_required?,
        "ConcealValueOnDocument" => self.conceal_value_on_document?,
        "CustomTabLocked" => self.custom_tab_locked?,
        "CustomTabDisableAutoSize" => self.custom_tab_disable_auto_size?,
        "CustomTabListItems" => self.custom_tab_list_items,
        "CustomTabListValues" => self.custom_tab_list_values,
        "CustomTabListSelectedValue" => self.custom_tab_list_selected_value,
        "CustomTabRadioGroupName" => self.custom_tab_radio_group_name,
        "CustomTabValidationPattern" => self.custom_tab_validation_pattern,
        "CustomTabValidationMessage" => self.custom_tab_validation_message,
        "TemplateLocked" => self.template_locked?,
        "TemplateRequired" => self.template_required?,
        "ConditionalParentLabel" => self.conditional_parent_label,
        "ConditionalParentValue" => self.conditional_parent_value,
        "SharedTab" => self.shared_tab?,
        "RequireInitialOnSharedTabChange" => self.require_initial_on_shared_tab_change?,
        "Font" => self.font,
        "Bold" => self.bold,
        "Italic" => self.italic,
        "Underline" => self.underline,
        "FontColor" => self.font_color,
        "FontSize" => self.font_size,
        "MergeFieldXml" => self.merge_field_xml,
        "IncludeNoteInEmail" => self.include_note_in_email
      }.delete_if{|key, value| value.nil?}}
    end
  end
end

# {http://www.docusign.net/API/3.0}ArrayOfTab
module DocuSign
  class ArrayOfTab < ::Array
  end
end