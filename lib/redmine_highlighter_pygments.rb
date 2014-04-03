module Redmine::SyntaxHighlighting::Pygments
  class << self
    def filename_to_language
      return @filename_to_language_code if @filename_to_language_code

      @filename_to_language_code = "case filename\n"
      `pygmentize -L lexers`.split("\n").drop(4).each_slice(2) do |lexer, info|
        lexer =~ /^\* (.*):$/
        lexer = $1.split(', ').first
        if info =~ /\(filenames (.*)\)$/ then
          match = $1.split(', ').collect do |pat|
            "^#{pat}$".gsub('.', '\\.').gsub('*', '.*').gsub(/^\^\.\*/, '').gsub(/\.\*\$$/, '')
          end
          @filename_to_language_code += "when /#{match.join('|')}/ then '#{lexer}'\n"
        end
      end
      @filename_to_language_code += "end\n"
    end

    def highlight_by_filename(text, filename)
      filename = File.basename(filename)
      language = eval(filename_to_language)

      if language then
        hl_option = "-l #{language}"
      else
        hl_option = '-g'
      end

      code = IO.popen("pygmentize #{hl_option} -f html", 'w+') do |pipe|
        pipe.print(text)
        pipe.close_write
        pipe.read
      end
      code = code.sub(/^<div class="highlight"><pre>/, '').sub(/\n<\/pre><\/div>$/, '')
    end

    def highlight_by_language(text, language)
      if language =~ /^[a-z]+$/
      code = IO.popen("pygmentize -l #{language} -f html", 'w+') do |pipe|
        pipe.puts(text)
        pipe.close_write
        pipe.read
      end
      code = code.sub(/^<div class="highlight"><pre>/, '').sub(/\n<\/pre><\/div>$/, '')
      else
        text
      end
    end
  end
end

Redmine::SyntaxHighlighting.highlighter = 'Pygments'
