# Arabic number conversion tool

Create a web-based solution that converts numeric input into the English phrase of that number. 

For example:
<pre>
7       === seven
42      === forty-two
2001    === two thousand and one
1999    === nineteen hundred and ninety-nine
17999   === seventeen thousand nine hundred and ninety-nine
342251  === three hundred and forty-two thousand two hundred and fifty-one
1300420 === one million three hundred thousand four hundred and twenty
</pre>

Note: Numbers greater than 100 and less than 1000 always include the word "and" between the hundreds figure and the other part, numbers greater than 1000 include "and" between any hundreds figure and the figure less than 100.

Treat this task like a project to create a real-life application, focus on other aspects too, not just the code:
- Fork this project.
- Use the best stack matching the simplicity of the task.
- Don't use external libraries for the conversion.
- Make the solution pleasant to look at and user friendly in as many aspects as you can.
- Commit the important milestones and not just the final result.
- Don't forget to write tests.

Thank you for your time and happy coding! 🧑‍💻

# My solution

As a web-based solution I choose the web application of the Flutter framework to perform this task.

To build the project:
<pre>
flutter build web --web-renderer html --release
flutter run -d chrome --web-renderer html
</pre>

The implementation:

I made the converter functionality followed the English grammar rules which I know, so I changed the forth example correct solution accordingly. After a further negotiation of the expectation I can easily change this accordingly to any slang rules.

On the website the user can add a number and only a number value at the field and then clicking on the button labeled "convert" can make the conversion. The result will show up above the input field.

![Screenshot](assets/solution/screenshot.png)

The converter functionality was tested by unit test with the given examples successfully.

Thank you for the task, it was really fun to solve.
