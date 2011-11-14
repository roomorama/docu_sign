module DocuSign
  class AnchorTab < DocuSignModel
    attr_accessor :anchor_tab_string
    attr_accessor :x_offset
    attr_accessor :y_offset
    attr_accessor :unit
    attr_accessor :ignore_if_not_present
    alias_attribute :string, :anchor_tab_string

    def initialize(attributes = {})
      @anchor_tab_string = attributes[:string] || attributes[:anchor_tab_string]
      @x_offset = attributes[:x] || attributes[:x_offset]
      @y_offset = attributes[:y] || attributes[:y_offset]
      @unit = attributes[:unit]
      @ignore_if_not_present = attributes[:ignore_if_not_present]
    end

    def to_savon
      {"AnchorTab" => {
        "AnchorTabString" => self.anchor_tab_string,
        "XOffset" => self.x_offset,
        "YOffset" => self.y_offset,
        "Unit" => self.unit,
        "IgnoreIfNotPresent" => self.ignore_if_not_present?
      }}
    end
  end
end