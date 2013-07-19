exports.home = (req, res) ->
  res.render 'index',
    title: 'MY TITLE',
    description: 'MY PAGE DESCRIPTION',
    author: '@sidewayspass'
