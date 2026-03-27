# const_vs_non_const 🚀

Does using `const` really matter in Flutter? This project is a practical experiment designed to visualize the performance impact of using `const` constructors in Flutter applications.

## 🧐 The Experiment
The app provides two identical interfaces accessible via a **Bottom Navigation Bar**:
1.  **Const Mode**: Uses `const` constructors for the UI components.
2.  **Non-Const Mode**: Re-initializes widgets on every parent rebuild.

### 📊 Performance Metrics
To observe the difference, the app includes:
- **Rebuild Counter**: Tracks how many times a specific widget's `build` method is called.
- **Performance Overlay**: Displays real-time GPU and UI thread charts.
- **setState Trigger**: A button to force a parent rebuild and see if children follow suit.

## 🏗️ The "Heavy Widget" (Yellow & Blue Rectangles)
Inside the app, you'll see a box filled with 200 small yellow and blue squares. 

**Why is it there?**
- **Simulating Complexity**: A simple text widget is too light for modern CPUs to show a delay. By rendering **200 individual Containers**, we create a "Heavy Widget" that requires more work from the Flutter Engine.
- **The Const Advantage**: 
    - In **Const Mode**, Flutter recognizes that these 200 squares haven't changed. It reuses the existing element in memory, skipping the entire layout and paint calculation for them.
    - In **Non-Const Mode**, every time you click "Increment", Flutter is forced to recalculate and redraw all 200 squares, consuming more CPU/GPU cycles.

## 🚀 How to Run & Test
1.  Run the app on a physical device (recommended for accurate performance testing).
2.  Navigate to the **Non-Const** tab and press "Increment Counter". Notice the **Rebuild Count** increasing.
3.  Navigate to the **Const** tab and press the button. Notice the **Rebuild Count** stays at **1**.
4.  Watch the **Performance Overlay** at the top; you'll see smoother frames and less activity in Const mode.

*******************

📬 Contact
If you'd like to get in touch, feel free to reach out:
Email: neloverar@gmail.com


👩‍💻 About Me
Software Engineer passionate about building high-quality, scalable applications that are designed to last.
I focus on writing clean, maintainable code and creating products that can adapt and remain relevant in the rapidly evolving world of Artificial Intelligence.
If you're looking for a dedicated engineer who values clarity, performance, and long-term impact — I'd be happy to collaborate.
