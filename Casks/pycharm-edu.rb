cask 'pycharm-edu' do
  version '2019.3.1,193.6015.45'
  sha256 'eca04b4df781a4069d52d130ae17638bb536fef220b98917be7c2a801dca51ba'

  url "https://download.jetbrains.com/python/pycharm-edu-#{version.before_comma}.dmg"
  appcast 'https://data.services.jetbrains.com/products/releases?code=PCE&latest=true&type=release'
  name 'Jetbrains PyCharm Educational Edition'
  name 'PyCharm Edu'
  homepage 'https://www.jetbrains.com/pycharm-edu/'

  auto_updates true

  app 'PyCharm Edu.app'

  uninstall_postflight do
    ENV['PATH'].split(File::PATH_SEPARATOR).map { |path| File.join(path, 'charm') }.each { |path| File.delete(path) if File.exist?(path) && File.readlines(path).grep(%r{# see com.intellij.idea.SocketLock for the server side of this interface}).any? }
  end

  zap trash: [
               "~/Library/Application Support/PyCharmEdu#{version.major_minor}",
               "~/Library/Caches/PyCharmEdu#{version.major_minor}",
               "~/Library/Logs/PyCharmEdu#{version.major_minor}",
               "~/Library/Preferences/PyCharmEdu#{version.major_minor}",
             ]
end
