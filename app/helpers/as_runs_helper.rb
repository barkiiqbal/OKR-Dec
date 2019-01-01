module AsRunsHelper

  def get_file_path(attachmentPath)

    filePath = Rails.root.join "public" + attachmentPath
  end
end
