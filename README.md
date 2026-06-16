# Static GitHub Pages site

## Local development

```bash
bundle install
bundle exec jekyll serve
```

The site will be available at `http://127.0.0.1:4000/`.

## Local build

```bash
bundle exec jekyll build
```

The raw content lives in Jekyll's `_data/` directory, and the site assets live in `files/`.

## GitHub Pages deployment

Deployment uses GitHub Pages' built-in Jekyll support.

1. Push changes to the publishing branch for the repository.
2. In GitHub repository settings, set `Pages -> Source` to `Deploy from a branch`.
3. Select the branch to publish from and use the repository root (`/`) as the folder.

GitHub Pages will run Jekyll automatically and publish the generated site.

## License
Copyright &copy; 2015+ All rights reserved.