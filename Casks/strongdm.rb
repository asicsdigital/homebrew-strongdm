cask 'strongdm' do
  version '0.4.21'
  sha256 '990e9ff6b13a4fd04d19fbdc6100c158c9309ccc32cc864b0be58e27218e4986'

  # sdm-releases-production.s3.amazonaws.com was verified as official when first introduced to the cask
  url "https://sdm-releases-production.s3.amazonaws.com/nightly/darwin/SDM-#{version}.dmg"
  name 'strongDM GUI'
  homepage 'https://strongdm.com/'

  app 'SDM.app'

  # symlink the executable into bindir
  postflight do
    File.symlink("#{appdir}/SDM.app/Contents/Resources/sdm.darwin", "#{HOMEBREW_PREFIX}/bin/sdm")
  end

  uninstall_postflight do
    File.unlink("#{HOMEBREW_PREFIX}/bin/sdm")
  end
end
