return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- 自訂包圍符號
        surrounds = {
          -- "(" 不帶空格
          ["("] = {
            add = { "(", ")" },
            find = function()
              return require("nvim-surround.config").get_selection({ motion = "a(" })
            end,
            delete = "^(.)().-(.)()$",
          },
          -- ")" 帶空格
          [")"] = {
            add = { "( ", " )" },
            find = function()
              return require("nvim-surround.config").get_selection({ motion = "a)" })
            end,
            delete = "^(. ?)().-(.? ?)()$",
          },
        },
        -- ========================================================================
        -- 預設 Keymaps:
        -- ys{motion}{char} - 新增包圍 (例: ysiw" 將單字用雙引號包圍)
        -- ds{char}         - 刪除包圍 (例: ds" 刪除雙引號)
        -- cs{old}{new}     - 修改包圍 (例: cs"' 將雙引號改成單引號)
        -- yss{char}        - 整行包圍
        -- S{char}          - Visual 模式下包圍選取範圍
        -- ========================================================================
      })
    end,
  },
}
