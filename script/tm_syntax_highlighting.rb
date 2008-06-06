module TmSyntaxHighlighting
  module Helper
    def code(code, options = {})
      options = TmSyntaxHighlighting.defaults.merge_with(options)
      TmSyntaxHighlighting.defaults[:current_themes] << options[:theme]
      options[:lang] = "plain_text" unless Uv.syntaxes.include?(options[:lang])
      Uv.parse(code, "xhtml", options[:lang], options[:line_numbers], options[:theme])
    end

    def syntax_css(theme = nil)
      themes = [theme || TmSyntaxHighlighting.defaults.options[:theme]].flatten
      themes = (themes & TmSyntaxHighlighting.defaults[:current_themes]) if theme.nil? && TmSyntaxHighlighting.defaults[:current_themes]
      themes.uniq.collect do |theme|
        stylesheet_link_tag "syntax/#{theme}"
      end.join("\n")
    end
  end
  
  module Controller
    def self.extended(base)
      base.after_filter :reset_syntax_css_includes
      base.send(:include, InstanceMethods)
      TmSyntaxHighlighting.defaults.reset_current_themes
    end
    
    module ClassMethods
    end
    
    module InstanceMethods
      def reset_syntax_css_includes
        TmSyntaxHighlighting.defaults.reset_current_themes
      end
    end
  end

  def self.defaults
    Config
  end

  def self.defaults=(options_hash)
    options_hash.each do |key, value|
      self.defaults.send("#{key}=", value)
    end
  end

  class Config
    @@attributes = [:theme, :lang, :line_numbers, :current_themes]
    cattr_accessor @@attributes

    self.line_numbers = true
    class << self
      def [](key)
        self.send(key)
      end

      def []=(key, value)
        self.send("#{key}=", value)
      end

      def options
        opts = {}
        @@attributes.each do |attribute|
          opts[attribute] = self.send(attribute)
        end
        opts
      end

      def merge_with(opts)
        opts = self.options.merge(opts)
        if opts[:theme].is_a?(Array)
          opts[:theme] = opts[:theme][rand(opts[:theme].size)]
        end
        opts
      end
      
      def reset_current_themes
        self.current_themes = []
      end
    end
  end
end
