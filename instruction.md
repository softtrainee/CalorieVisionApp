{\rtf1\ansi\ansicpg1252\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww25780\viewh14460\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # CalorieVision App - Product Requirement Document (PRD)\
\
## Overview\
\
CalorieVision is an iOS 15 SwiftUI app, built with MVVM, which allows users to take a photo of food, analyze its calories and nutrients via OpenAI Vision API (or a mock for demo), edit the results, and save logs to a food history calendar. Inspired by CalAI.\
\
## Features\
\
1. **Camera Capture**\
   - Take a photo of food using the device camera (photo library on simulator).\
   - Display the captured image in the UI.\
\
2. **AI Food Analysis**\
   - Send the captured photo to OpenAI Vision API (`gpt-4.1` model) with a prompt to extract ingredients, calories, and nutrients.\
   - Parse and display the API\'92s structured JSON output as ingredients.\
\
3. **Ingredient Editor**\
   - Allow user to edit ingredient names, calories, and nutrients in a form/list.\
   - Total calories update in real time as edits are made.\
\
4. **Food Log / Calendar**\
   - Save analyzed records with date, photo, and ingredients.\
   - Show history log in a list, grouped by date.\
   - Tap a record to view full details.\
\
## Data Models\
\
- **Ingredient:**  \
  ```swift\
  struct Ingredient: Identifiable, Codable, Equatable \{\
      let id: UUID\
      var name: String\
      var calories: Double\
      var nutrients: [String: Double]\
  \}\
  ```\
- **FoodRecord:**  \
  ```swift\
  struct FoodRecord: Identifiable, Codable, Equatable \{\
      let id: UUID\
      var date: Date\
      var photoData: Data?\
      var ingredients: [Ingredient]\
      var totalCalories: Double \{\
          ingredients.reduce(0) \{ $0 + $1.calories \}\
      \}\
  \}\
  ```\
\
## API Specification\
\
- **Provider:** OpenAI Vision (GPT-4.1, or mock for demo)\
- **Endpoint:** `https://api.openai.com/v1/chat/completions`\
- **Prompt:**  \
  Analyze the food in this image. List each ingredient with calories and common nutrients (fat, carbs, protein) per ingredient, in JSON array [\{name,calories,nutrients:\{...\}\}]. Be concise.\
- **Request:**  \
  - Model: `gpt-4.1`\
  - Messages: user prompt + base64 image\
  - Max tokens: 400\
- **Response:**  \
  JSON array of ingredients as above (may require string parsing).\
\
## Development Assets\
\
- `instruction.md` (this file)\
- `.cursor-rules` (custom AI/code conventions)\
- `README.md` (install/build instructions)\
- Commit history with clear, feature-based commit messages\
\
## Tools/Workflow\
\
- Cline (VS Code AI extension)\
- SweetPad (VS Code iOS extension)\
- Xcode (main project)\
- GitHub for version control\
- AI agent-based development (Cursor/SweetPad/LLM prompting)\
\
## Commit Guidelines\
\
- Use clear, atomic commits:\
  - `feat: implement camera`\
  - `feat: OpenAI API integration`\
  - `feat: ingredient edit`\
  - `feat: history/calendar`\
  - `fix: calorie update bug`\
- Each feature or fix should be in a separate commit.\
\
## Testing\
\
- Manual: Run on device/simulator, test camera, OpenAI integration or mock, editing, and logging.\
- Debugging and code navigation via AI tool logs and .cursor-rules.}