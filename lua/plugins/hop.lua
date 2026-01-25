return {
  -- 停用 flash.nvim
  { "folke/flash.nvim", enabled = false },

  -- 啟用 hop.nvim
  {
    "smoka7/hop.nvim",
    version = "*",
    event = "BufRead",
    config = function()
      require("hop").setup()

      local hop = require("hop")
      local directions = require("hop.hint").HintDirection
      local opts = { remap = true, silent = true }

      -- ========================================================================
      -- 基本跳轉
      -- ========================================================================

      -- s: HopChar1 - 跳到任意字元（輸入一個字元後顯示標籤）
      vim.keymap.set({ "n", "x", "o" }, "s", "<cmd>HopChar1<cr>", opts)

      -- S: HopWord - 跳到單字開頭（直接顯示所有單字標籤）
      vim.keymap.set({ "n", "x", "o" }, "S", "<cmd>HopWord<cr>", opts)

      -- ========================================================================
      -- f/F/t/T 增強版（當前行）
      -- ========================================================================

      -- f: 向後搜尋字元（當前行）
      vim.keymap.set("", "f", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true, desc = "Hop f (forward char)" })

      -- F: 向前搜尋字元（當前行）
      vim.keymap.set("", "F", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true, desc = "Hop F (backward char)" })

      -- t: 向後搜尋字元，停在前一格（當前行）
      vim.keymap.set("", "t", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true, desc = "Hop t (till char forward)" })

      -- T: 向前搜尋字元，停在後一格（當前行）
      vim.keymap.set("", "T", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, { remap = true, desc = "Hop T (till char backward)" })

      -- ========================================================================
      -- Visual 模式行跳轉
      -- ========================================================================

      -- Visual 模式下的 f 改為行跳轉
      vim.keymap.set("x", "f", "<cmd>HopLine<cr>", opts)
    end,
  },
}
