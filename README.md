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

![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 12 34](https://github.com/user-attachments/assets/3e5288fe-7712-4cb5-91ca-d0471ad7b444)
![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 12 43](https://github.com/user-attachments/assets/0aa509b5-8575-4f1f-9091-8bd8bffe98b0)

![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 13 39](https://github.com/user-attachments/assets/464f7be5-b072-4f4d-a83a-d0d8ad458763)
![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 13 47](https://github.com/user-attachments/assets/51d71932-f5d4-4820-a1a2-9cf69abc4c30)

![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 13 52](https://github.com/user-attachments/assets/a3b38a33-0f0a-4f7b-9eb9-c750807ba922)
![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 14 05](https://github.com/user-attachments/assets/74f6af4e-7cab-4dfe-9e7f-16793916dec0)

![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 15 12](https://github.com/user-attachments/assets/015b062c-fb7a-4f56-82e9-c6ecc1698ffb)
![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 15 17](https://github.com/user-attachments/assets/9d562326-73ae-4b3d-852c-c0416aae4c39)
![Simulator Screen Shot - iPhone 13 - 2025-06-04 at 21 15 21](https://github.com/user-attachments/assets/80b0cf81-1fa7-454e-8559-e78ba3966357)

## Demo Video
https://youtube.com/shorts/oGbhBA4H7W4?feature=share

