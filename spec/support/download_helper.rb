# Module provide methods for downloads testing
module DownloadHelpers
  TIMEOUT = 10
  DOWNLOAD_PATH =
    Pathname.new(
      ENV.fetch("DOWNLOAD_PATH", Rails.root.join("tmp", "downloads"))
    )

  def downloads
    Dir[DOWNLOAD_PATH.join("*")]
  end

  def find_downloaded_file(file = ".*")
    downloads.grep(/#{file}$/).first
  end

  def download_content
    wait_for_download
    File.read(download)
  end

  def wait_for_download(timeout: TIMEOUT)
    download_time = 0
    Timeout.timeout(timeout) do
      until downloaded?
        sleep 0.1
        download_time += 0.1
      end
    end
  end

  # Сохраняем состояние папки загрузок для проверок.
  # Возможно создание файлов в период между разными проверками со считыванием содержимого папки
  def downloaded?
    current_download = downloads
    current_download.any? && current_download.grep(/download$/).none?
  end

  def clear_downloads
    FileUtils.rm_f(downloads)
  end

  module_function :clear_downloads,
                  :find_downloaded_file,
                  :wait_for_download,
                  :downloads,
                  :downloaded?
end
