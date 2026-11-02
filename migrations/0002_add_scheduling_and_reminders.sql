
-- اضافه کردن قابلیت زمان‌بندی و یادآوری تسک‌ها

-- تاریخ و ساعت سررسید تسک به UTC
ALTER TABLE tasks
ADD COLUMN due_at TEXT;

-- مدت زمان یادآوری قبل از سررسید، بر حسب دقیقه
-- مقدار پیش‌فرض: ۱۵ دقیقه
ALTER TABLE tasks
ADD COLUMN reminder_minutes INTEGER NOT NULL DEFAULT 15
CHECK (reminder_minutes >= 0);

-- زمان ارسال یادآوری برای جلوگیری از ارسال تکراری
ALTER TABLE tasks
ADD COLUMN reminder_sent_at TEXT;

-- ایندکس برای پیدا کردن سریع تسک‌های موعددار
CREATE INDEX idx_tasks_due_at
ON tasks (status, due_at);
