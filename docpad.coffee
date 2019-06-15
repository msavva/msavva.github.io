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
        "/scripts/bootstrap.min.js"
        "/scripts/script.js"
      ]
    pubs: JSON.parse(fs.readFileSync("src/data/pubs.json"))
    people: JSON.parse(fs.readFileSync("src/data/people.json"))
    getAuthors: (pub) ->
      out = ""
      authors = pub.authors
      if authors and authors instanceof Array
        for aId in authors
          a = if @people[aId] then @people[aId] else {'name': aId}
          str = if a.web then '<a href="' + a.web + '">' + a.name + '</a>' else a.name
          out = out + str + if aId != authors[authors.length - 1] then ', ' else ''
      else
        out = pub.authors  # raw string authors
      out = out + '<br>'
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
          path: 'download/twitter-bootstrap'
          url: 'https://codeload.github.com/twbs/bootstrap/tar.gz/v3.3.7'
          tarExtractClean: true
        }
      ]
    copy:
      'boostrap-fonts':
          src: '../download/twitter-bootstrap/dist/fonts'
          out: 'fonts'
      'bootstrap-js':
          src: '../download/twitter-bootstrap/dist/js'
          out: 'scripts'
}

module.exports = docpadConfig
