class SocialCrunch
  Application: {}
  options:     {}

  # Class Constructor
  constructor: (@options) ->
    window.$SC = this

    this

  initPage: (name, args...) ->
    if @Application[name]?
      self = this
      F = () ->
        return self.Application[name].apply(this, args)
      F.prototype = @Application[name].prototype
      this[name] = new F
    else
      throw "#{name} not found in Application namespace"

window._SocialCrunch = new SocialCrunch