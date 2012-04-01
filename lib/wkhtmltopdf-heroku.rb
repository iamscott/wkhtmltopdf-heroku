if RUBY_PLATFORM =~ /linux/
  WKHTMLTOPDF_PATH = File.expand_path "../../bin/wkhtmltopdf-linux-amd64", __FILE__
elsif RUBY_PLATFORM =~ /darwin/
  WKHTMLTOPDF_PATH = File.expand_path= File.expand_path "../../bin/wkhtmltopdf-darwin-386", __FILE__
end

begin
  require 'pdfkit'

  PDFKit.configure do |config|
    config.wkhtmltopdf = WKHTMLTOPDF_PATH
  end
rescue LoadError
end

begin
  require 'wicked_pdf'

  WickedPdf.config[:exe_path] = WKHTMLTOPDF_PATH
rescue LoadError
end
