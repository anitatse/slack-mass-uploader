require 'mini_magick'
require_relative 'uploader'

module SlackMassUploader
  class Converter
    attr_accessor :image, :dir_name, :file_resize_spec, :output_dir

    def initialize(options={})
      @image = ''
      @dir_name = File.basename(options[:directory], ".*")
      @file_resize_spec = '128x128'
      @output_dir = 'slack-mass-uploader'
    end

    def convert
      convert_opts = ["-resize", @file_resize_spec]
      Dir.mkdir("#{dir_name}/#{output_dir}") unless File.exists?("#{dir_name}/#{output_dir}")

      Dir.glob("#{@dir_name}/*") do |each_file|
          file_name = each_file.split('/').last.gsub(' ','-')  # take file name from path + replace spaces
          if ["png","jpeg","jpg"].include? file_name.split('.').last
              @image = ::MiniMagick::Image.open(each_file)
              ::MiniMagick::Tool::Convert.new do |convert|
                convert << @image.path
                convert.merge! convert_opts
                convert << "#{dir_name}/#{output_dir}/#{file_name}"
              end
          end
      end

    end

  end
end
