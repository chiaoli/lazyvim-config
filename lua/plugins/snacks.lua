return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        win = {
          style = "float",
          border = "rounded",
        },
      },
      explorer = {
        -- 預設顯示隱藏檔案
        hidden = true,
      },
      picker = {
        sources = {
          files = {
            hidden = true, -- 搜尋時包含隱藏檔案
          },
          explorer = {
            hidden = true, -- Explorer 顯示隱藏檔案
          },
        },
      },
    },
  },
}
