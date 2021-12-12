require 'faraday'
require 'nokogiri'
require 'open-uri'

require 'unitf/logging'

module UnitF
  module Radio
    module WFMU
      class << self

        def process_episode(title, url, target_dir)
          source_url = Faraday.get(url).body.strip
          file = source_url.split('/')[-1]
          target_path = "#{target_dir}/#{file}"

          if File.exists?(target_path)
            UnitF::Log.info("File #{target_path} already exists")
            return
          end

          Dir.mkdir(target_dir) unless Dir.exist?(target_dir)

          cmd = %Q( curl "#{source_url}" -o "#{target_path}")
          UnitF::Log.info("Downloading #{file} with command #{cmd}")
          system(cmd)
        end

        def process_show(show_id, target_dir)
          doc = Nokogiri::XML(URI.open("http://www.wfmu.org/archivefeed/mp3/#{show_id}.xml"))
          # doc = Nokogiri::XML(File.read('/Users/mbaron/conf/bj.xml'))
          doc.xpath('//channel/item').each do |item|
            title = item.xpath('title')[0].content
            url = item.xpath('link')[0].content
            process_episode(title, url, target_dir)
          end
        end
      end
    end
  end
end
