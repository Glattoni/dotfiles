return {
  'David-Kunz/jester',
  config = function()
    require('jester').setup({
      path_to_jest_run = './node_modules/.bin/jest',
    })
  end,
}
