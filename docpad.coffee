fs = require 'fs'

docpadConfig = {
  templateData:
    site:
      title: "Manolis Savva"
      author: "Manolis Savva"
      email: "msavva@sfu.ca"
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
    groupBy: (array, key) ->
      return array.reduce( (obj, element) ->
        v = if (typeof(key) == 'function') then key(element) else element[key]
        obj[v] = obj[v] || []
        obj[v].push(element)
        return obj
      , {})
    news: JSON.parse(fs.readFileSync("src/data/news.json"))
    pubs: JSON.parse(fs.readFileSync("src/data/pubs.json"))
    people: JSON.parse(fs.readFileSync("src/data/people.json"))
    maintags: ['graphics', 'vision', 'hci', 'nlp'],
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
    hasField: (obj, field, values) ->
      if obj[field]
         if not Array.isArray(values)
           values = [values]
         return !values.every((v) -> obj[field].indexOf(v) < 0)
      return false
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
