#!/bin/bash
# Detects if current folder is an empty folder or existing discovery project
# Outputs a message that Claude will see at session start

PROJECT_STATE="$(pwd)/project-state.json"

if [ -f "$PROJECT_STATE" ]; then
  # Existing project - output resume message
  PROJECT_NAME=$(python3 -c "import json; d=json.load(open('$PROJECT_STATE')); print(d.get('projectName','Unknown'))" 2>/dev/null || echo "Unknown")
  CURRENT_STEP=$(python3 -c "import json; d=json.load(open('$PROJECT_STATE')); print(d.get('currentStep',1))" 2>/dev/null || echo "1")
  STEPS_DONE=$(python3 -c "import json; d=json.load(open('$PROJECT_STATE')); print(len(d.get('stepsCompleted',[])))" 2>/dev/null || echo "0")
  echo "📋 DISCOVERY PROJECT DETECTED: $PROJECT_NAME | Step $CURRENT_STEP/24 | $STEPS_DONE steps completed. Resume with your next message."
else
  # Check if folder is empty (new project candidate)
  FILE_COUNT=$(ls -A "$(pwd)" 2>/dev/null | grep -v -E "^(\.git|\.DS_Store|node_modules)$" | wc -l | tr -d ' ')
  if [ "$FILE_COUNT" -le 2 ]; then
    echo "✨ NEW FOLDER DETECTED: Run /start-discovery \"your product idea\" to begin MIT Disciplined Entrepreneurship validation."
  fi
fi
