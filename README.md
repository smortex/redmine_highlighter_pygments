# Redmine Highlighter Pygments

Rely on [Pygments](http://pygments.org/) for syntax highlighting.

## Installation

Use your operating system's packages management system to install Pygments, e.g. `aptitude install python-pygments`.

Install the plugin [as described in the Redmine documentation](http://www.redmine.org/projects/redmine/wiki/Plugins) (no database migration is required).

You will also have to add some rules to Remine's CSS to colorize the code according to your tastes.  A quick way is to create a new custom theme in the `public/themes` directory and add the ouput of `pygmentize -S <style> -f html` (available styles can be listed using `pygmentize -L style`).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
