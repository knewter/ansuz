class Ansuz
  class PluginManager
    attr_accessor :plugins, :plugin_nav, :admin_plugin_nav, :admin_menu
    ADMIN_MENU_TOP_LEVEL_ENTRIES = ["Pages", "Add-ons", "Ansuz"]

    def initialize
      @plugins = []
      @plugin_nav = []
      @admin_plugin_nav = []
      @admin_menu = setup_admin_menu
    end

    # A plugin can call register_plugin(ClassName) to add itself to the plugins array
    def register_plugin klass
      self.plugins << klass
    end

    # A plugin can call register_plugin_nav(title, link) to add itself to the
    # user-facing navigation menu
    def register_plugin_nav title, link
      self.plugin_nav << [title, link]
    end

    # A plugin can call register_admin_plugin_nav(title, link) to add itself to the
    # admin-facing navigation menu
    def register_admin_plugin_nav title, link
      self.admin_plugin_nav << [title, link]
      # We're going to register plugins that use the old naming convention just underneath 
      # the Add-Ons dropdown.  They can use the register_admin_menu_entry method if they want finer-grained control.
      register_admin_menu_entry "Add-ons", title, link
    end

    def register_admin_menu_entry top_level_menu_name, text, link, options={}
      raise "There was an attempt to add a link to the admin menu with a non-existent top level menu entry as parent." unless ADMIN_MENU_TOP_LEVEL_ENTRIES.include?(top_level_menu_name)
      self.admin_menu[top_level_menu_name] << [text, link, options]
    end

    private
    # The admin menu is just a hash with an array for sub menus for now.
    def setup_admin_menu
      hsh = {}
      ADMIN_MENU_TOP_LEVEL_ENTRIES.each do |menu_entry|
        hsh[menu_entry] = []
      end
      hsh
    end
  end
end
