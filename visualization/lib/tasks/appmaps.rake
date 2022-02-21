namespace :appmaps do
  desc "Import All Appmaps"
  task import: :environment do
    # NOTE: clear all Appmaps before import
    Appmap.destroy_all

    # NOTE: Find all filenames under selected directory
    path = "./tmp/chart-dataset-small"
    filenames = Dir.entries(path).select { |f| File.file? File.join(path, f) }

    # NOTE: create new Appmaps
    filenames.each do |filename|
      Appmap.create(path: "#{path}/#{filename}")
    end
  end
end
