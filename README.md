# CalorieVision

A SwiftUI iOS app for analyzing food calories and nutrients from a photo, inspired by CalAI.

## Features

- Take food photo (camera/photo library)
- (Mock) OpenAI Vision API for calorie/nutrient analysis
- Editable ingredient/calorie list
- Food log/history view with calendar
- Clean MVVM structure

## Requirements

- Xcode 13.2.1
- iOS 15+
- Swift, SwiftUI

## Installation

1. Clone the repo:

   ```sh
   git clone https://github.com/softtrainee/CalorieVisionApp.git
   cd CalorieVision
   ```

2. Open `CalorieVision.xcodeproj` in Xcode 13.2.1.

3. By default, the OpenAI API is mocked for quota reasons.  
   To use live OpenAI, add your API key in `Services/OpenAIVisionAPI.swift`.

4. Run on device or simulator.

## Build Steps

- Build and run in Xcode.
- Grant camera/photo library permission.
- Tap "Take Photo" to capture/select food.
- Tap "Analyze Photo" for (mocked) analysis.
- Edit ingredients/calories if needed.
- Save to history (calendar/log tab).

## Development

- MVVM pattern, feature-based commits
- AI tool workflow: Cline, SweetPad, LLM prompting
- Debugging via Cursor/SweetPad logs
- All development assets included

## License

MIT

## Credits

- OpenAI Vision API (mocked here)
- Inspired by CalAI

## Output

![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 15 21](https://github.com/user-attachments/assets/db791c1e-badb-4893-9a08-e0f27a64705e)
![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 15 17](https://github.com/user-attachments/assets/f2c76db1-9d84-40c1-9aad-66c0f842a4a7)
![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 15 12](https://github.com/user-attachments/assets/b9e7e330-bfdc-4598-a007-5ef0e52f05fb)
![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 14 05](https://github.com/user-attachments/assets/2d37f950-d794-4e86-9068-0e81d86fa228)
![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 13 52](https://github.com/user-attachments/assets/49a1ed3c-3794-43fe-9610-8e88bee3fc5b)
![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 13 47](https://github.com/user-attachments/assets/9cfbc01e-e4f8-41a6-8996-3c40f39e9d62)
![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 13 39](https://github.com/user-attachments/assets/6a2a9975-e04f-49b5-8d7f-afb9881f8792)
![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 12 43](https://github.com/user-attachments/assets/cea074bc-4286-47df-b144-aa435ab1787d)
![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 12 34](https://github.com/user-attachments/assets/820c756c-efde-4f50-8ea6-d6543da00e7e)


## Demo Video
https://youtube.com/shorts/oGbhBA4H7W4?feature=share

