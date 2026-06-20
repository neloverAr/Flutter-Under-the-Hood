# Flutter Layout Mastery Lab 🧪

An interactive Flutter application designed to visualize and master the core principle of Flutter's layout engine:
> **"Constraints go down. Sizes go up. Parent sets position."**

This tool acts as a "Layout Lab" where developers can experiment with different parent-child combinations to see how constraints affect the final rendering in real-time.

## 🚀 Key Features

- **Interactive Control Panel**: Choose between different Parent widgets (ConstrainedBox, Center, UnconstrainedBox, Column, Row, etc.) and Child widgets.
- **Live Preview**: A visual representation of the layout with real-time feedback.
- **Visual Overlays**:
  - 🔴 **Red Border**: Represents the **Constraints** passed down from the parent.
  - 🟢 **Green Border**: Represents the **Actual Size** chosen by the child.
- **Live Measurements**: Displays the exact `BoxConstraints` incoming to the child and the final `Size` of the child widget.

## 🧠 The Rule Explained

1. **Constraints Go Down**: The parent widget tells the child what its constraints are (e.g., "You must be between 0 and 200 pixels wide").
2. **Sizes Go Up**: The child widget decides its own size based on the constraints it received.
3. **Parent Sets Position**: The parent widget decides where to place the child on the screen.

## 🛠 Widgets Included

### Parents (Constraint Providers)
- **ConstrainedBox (Tight)**: Forces the child to be an exact size.
- **ConstrainedBox (Loose)**: Allows the child to be any size up to a maximum.
- **Center**: Loosens constraints and centers the child.
- **UnconstrainedBox**: Gives the child infinite space (can lead to overflows!).
- **Column/Row**: Demonstrates flex behavior and how they manage children.

### Children (Size Requesters)
- **Container (Fixed Size)**: Requests a specific width and height.
- **Text**: A "Natural Size" widget that takes only what it needs.
- **Flutter Logo**: An asset-based widget with internal dimensions.

## 💻 Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **Principles**: Flutter Rendering Pipeline, Layout Protocol.

---
Built with ❤️ for the Flutter Community.

## 📬 التواصل (Contact)

إذا كنت ترغب في التواصل، يمكنك ذلك عبر البريد الإلكتروني:<br>
Email: neloverar@gmail.com<br><br>

إذا كنت مطور Flutter في غزة تهتم بكتابة كود نظيف (Clean Code)، يسعدني تواصلك عبر البريد الإلكتروني من خلال إرسال كلمة "رقم"، وسأكون سعيدة بالدردشة معك.<br><br>
إذا كنت تبحث عن تطوير تطبيق قادر على المنافسة في عالم الذكاء الاصطناعي، يمكنك التواصل لمناقشة التفاصيل.<br><br>

تابعني على لينكدإن:<br>
https://www.linkedin.com/in/nelover-aburas/<br><br>


---

## 👩‍💻 عني (About Me)

مهندسة برمجيات شغوفة ببناء تطبيقات عالية الجودة وقابلة للتوسع ومصممة لتدوم.<br>
أركز على كتابة كود نظيف وقابل للصيانة، وبناء منتجات قادرة على التكيف مع التطور السريع في عالم الذكاء الاصطناعي.<br>
إذا كنت تبحث عن مهندس يهتم بالوضوح والأداء والأثر طويل المدى — يسعدني التعاون معك.<br><br>
