require 'redmine'

require 'redmine_highlighter_pygments'

Redmine::Plugin.register :redmine_highlighter_pygments do
  name 'Redmine Highlighter Pygments'
  author 'Romain Tartière'
  description 'Rely on Pygments for syntax highlighting'
  version '1.0.0'
  url 'https://github.com/smortex/redmine-highlighter-pygments'
  author_url 'http://romain.blogreen.org'

  requires_redmine :version_or_higher => '2.0.0'
end

