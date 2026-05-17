# Синхронизация OpenCode с Obsidian и GitHub

## ⚠️ ВАЖНО — Для AI (меня)

**После каждого значимого ответа** ты ДОЛЖЕН сохранить мысли и ответ в Obsidian:

1. **Сохранить мысли (thinking):**
```powershell
python "$env:USERPROFILE\.local\bin\opencode-obsidian-logger.py" --type thinking --content "Текст мысли" --title "Краткое название"
```

2. **Сохранить ответ (answer):**
```powershell
python "$env:USERPROFILE\.local\bin\opencode-obsidian-logger.py" --type answer --content "Текст ответа" --title "Краткое название"
```

3. **Также записывай действия в AI_Memory:**
```powershell
& "$env:USERPROFILE\Documents\AI_Memory\log-action.ps1" -action "Описание действия"
```

4. **Синхронизируй с GitHub после изменений:**
```powershell
powershell -File "C:\Users\ApaT\Documents\AI_Memory\sync.ps1"
```

**Не жди пока пользователь попросит — делай это сам после каждого значимого действия!**

---

## Обзор

OpenCode синхронизируется с двумя системами:
- **Obsidian** — для записи мыслей, ответов и действий (локальный vault)
- **GitHub** — для резервного копирования и версионирования (AI_Memory репозиторий)

## Структура

### Obsidian Vault
```
~/Documents/Obsidian/
├── OpenCode/
│   ├── Index.md          # Главный индекс с обратными ссылками
│   ├── Thinking/         # Мысли (reasoning)
│   ├── Answers/          # Ответы
│   └── Sessions/         # Сессии (сырые данные)
└── Инструкции/           # Этот гайд
```

### GitHub Repository
```
~/Documents/AI_Memory/
├── 00 - Главная.md
├── Мои действия/         # Лог действий по датам
├── Заметки/             # Полезные заметки
├── Разговоры/           # Сессии
├── log-action.ps1       # Скрипт для записи действий
└── sync.ps1            # Git sync скрипт
```

## Автоматическая синхронизация

### Obsidian (плагин opencode-obsidian.js)

**Как работает:**
1. При старте сессии — плагин синхронизирует последние заметки как контекст
2. После каждого ответа — автоматически парсит `<thinking>` и `<answer>` теги и сохраняет в Obsidian

**Плагин расположен:** `~/.config/opencode/plugins/opencode-obsidian.js`

**Python скрипты:**
- `~/.local/bin/opencode-obsidian-logger.py` — логирование мыслей/ответов
- `~/.local/bin/opencode-obsidian-sync.py` — синхронизация контекста при старте

**Теги для записи:**
- `<thinking>...</thinking>` — мысли
- `<answer>...</answer>` — ответы
- Без тегов — сохраняется как session (до 500 символов)

### GitHub (AI_Memory)

**Как работает:**
1. `sync.ps1` — пушит всё в репозиторий вручную
2. `log-action.ps1` — записывает действие и пушит

**Репозиторий:** `Ka1Angell/AI_Memory` (master branch)

## Ручная синхронизация

### Записать мысль в Obsidian
```powershell
python "$env:USERPROFILE\.local\bin\opencode-obsidian-logger.py" --type thinking --content "Текст мысли" --title "Заголовок"
```

### Записать ответ в Obsidian
```powershell
python "$env:USERPROFILE\.local\bin\opencode-obsidian-logger.py" --type answer --content "Текст ответа" --title "Заголовок"
```

### Записать действие в AI_Memory
```powershell
& "$env:USERPROFILE\Documents\AI_Memory\log-action.ps1" -action "Описание действия"
```

### Синхронизировать AI_Memory с GitHub
```powershell
powershell -File "C:\Users\ApaT\Documents\AI_Memory\sync.ps1"
```

## Как я работаю

1. **При старте**: Читаю контекст из Obsidian (последние 5 мыслей + 5 ответов)
2. **Во время сессии**: 
   - Пишу `<thinking>` и `<answer>` теги в ответах → автоматически сохраняются в Obsidian
   - Использую `log-action.ps1` для записи значимых действий
3. **По запросу**: Могу запустить полную синхронизацию вручную

## Устранение проблем

### Кракозябры в файлах (AI_Memory)
Если кириллица отображается неправильно — проблема в кодировке PowerShell. `log-action.ps1` уже починен (использует `[System.IO.File]::WriteAllText` с UTF-8).

### Плагин не работает (Obsidian)
Проверить что плагин подключён в `~/.config/opencode/opencode.jsonc`:
```jsonc
{
  "plugin": ["opencode-obsidian"],
  "instructions": [...]
}
```

Проверить что Python скрипты существуют:
- `~/.local/bin/opencode-obsidian-logger.py`
- `~/.local/bin/opencode-obsidian-sync.py`

---

*Создано: 2026-05-17*