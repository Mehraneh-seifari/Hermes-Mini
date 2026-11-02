-- تسک‌ها
CREATE TABLE tasks (
  id           INTEGER PRIMARY KEY AUTOINCREMENT,
  title        TEXT    NOT NULL,
  status       TEXT    NOT NULL DEFAULT 'open' CHECK (status IN ('open', 'done')),
  created_at   TEXT    NOT NULL,  -- ISO 8601 به UTC
  completed_at TEXT,              -- ISO 8601 به UTC، وقتی done شد
  day_tehran   TEXT    NOT NULL   -- روز ساخت تسک به وقت تهران، فرمت YYYY-MM-DD
);
CREATE INDEX idx_tasks_status ON tasks (status, id);
CREATE INDEX idx_tasks_day    ON tasks (day_tehran);

-- جلوگیری از پردازش تکراری پیام‌های تلگرام (idempotency)
CREATE TABLE processed_updates (
  update_id   INTEGER PRIMARY KEY,
  received_at TEXT NOT NULL
);

-- حافظه کوتاه مکالمه (چند پیام آخر)
CREATE TABLE chat_memory (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  role       TEXT NOT NULL CHECK (role IN ('user', 'assistant')),
  content    TEXT NOT NULL,
  created_at TEXT NOT NULL
);