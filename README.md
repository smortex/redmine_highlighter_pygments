# Redmine Highlighter Pygments

Rely on [Pygments](http://pygments.org/) instead of [CodeRay](http://coderay.rubychan.de/) for syntax highlighting.

While CodeRay is a cool pure-Ruby syntax highlighting solution, it's list of supported languages is somewhat limited and will not fit with some projects.  This plugin makes Redmine rely on Pygments for syntax highlighting (so it comes with the price of a list of Python dependencies) to bring in syntax highlighting for much more languages.

## Installation

Use your operating system's packages management system to install Pygments, using e.g. `aptitude install python-pygments` on a Debian GNU/Linux system, or `pkg install py27-pygments` on a FreeBSD system.

Install the plugin [as described in the Redmine documentation](http://www.redmine.org/projects/redmine/wiki/Plugins) (no database migration is required, and no configuration options are available… simple hey-hey).

You will also have to add some rules to Remine's CSS to colorize the code according to your [bad] tastes.  A quick way is to create a new custom theme in the `public/themes` directory and add the ouput of `pygmentize -S <style> -f html` (available styles can be listed using `pygmentize -L style`). Stealing [the GitHub's style](https://raw.githubusercontent.com/richleland/pygments-css/master/github.css) is also a possibility.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
