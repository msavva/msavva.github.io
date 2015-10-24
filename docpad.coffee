fs = require 'fs'

docpadConfig = {
  templateData:
    site:
      title: "Manolis Savva"
      author: "Manolis Savva"
      email: "msavva@stanford.edu"
      description: "Manolis Savva's Homepage"
      styles: [
        "/styles/twitter-bootstrap.css"
        "/styles/style.css"
      ]
      scripts: [
        "//cdnjs.cloudflare.com/ajax/libs/jquery/1.10.2/jquery.min.js"
        "//cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js"
        "/vendor/twitter-bootstrap/dist/js/bootstrap.min.js"
        "/scripts/script.js"
      ]
    pubs: JSON.parse(fs.readFileSync("src/data/pubs.json"))
    people: JSON.parse(fs.readFileSync("src/data/people.json"))
    getPreparedTitle: ->
      if @document.title then "#{@document.title} | #{@site.title}" else @site.title
  plugins:
    ghpages:
      deployRemote: 'origin'
      deployBranch: 'master'
    downloader:
      downloads: [
        {
          name: 'Bootstrap'
          path: 'src/files/vendor/twitter-bootstrap'
          url: 'https://codeload.github.com/twbs/bootstrap/tar.gz/master'
          tarExtractClean: true
        }
      ]
}

module.exports = docpadConfig
