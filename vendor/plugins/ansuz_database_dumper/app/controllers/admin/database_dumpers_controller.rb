class Admin::DatabaseDumpersController < Admin::BaseController
  def show
  end

  def mysql_dump
    backup_path = File.join(RAILS_ROOT, "tmp", Time.now.to_f.to_s)
    config = Rails::Configuration.new.database_configuration[RAILS_ENV]
    options = []
    options << "-u#{config["username"]}"
    options << "-p#{config["password"]}" unless config["password"].blank?
    options << "#{config["database"]}"
    command = "mysqldump #{options.join(" ")} > #{backup_path}"
    logger.info command
    begin
      `#{command}`
      render :file => backup_path
    ensure
      File.delete backup_path
    end
  end
end
