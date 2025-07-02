FUNCTIONS

1. Regular Functions
Regular functions are the most basic type of function in Dart. They encapsulate a block of code that performs a specific task and can be called whenever needed. They may or may not take inputs (parameters) and may or may not return a value.

2. Functions with Parameters
Functions can accept inputs called “parameters”, which allow them to work with dynamic data. Parameters are specified inside parentheses when defining the function, and the actual values passed when calling the function are called “arguments”.

3. Arrow Functions (Single-Expression Functions)
Arrow functions (`=>`) provide a concise way to write functions that contain only a single expression. Instead of using curly braces `{}`, the expression is written after the arrow, and its result is automatically returned.

4. Functions with Optional Parameters
Dart allows parameters to be optional, meaning they don’t have to be provided when calling the function. There are two types:
•	Optional positional parameters: Enclosed in `[]` and can be omitted.
•	Optional named parameters: Enclosed in `{}` and specified by name when calling.
Default values can be assigned to optional parameters.

5. Types of Functions
Dart supports different types of functions:
•	Built-in functions (e.g., `print()`, `toLowerCase()`).
•	User-defined functions (custom functions created by the programmer).
•	Anonymous functions (unnamed functions, often used as arguments).
•	Recursive functions (functions that call themselves).

6. Named Parameters
Named parameters allow passing arguments in any order by specifying the parameter name. They are enclosed in curly braces `{}` in the function definition and must be explicitly named when calling the function.

7. Return Values
Functions can return a value using the `return` keyword. The return type is specified before the function name (e.g., `int`, `String`, `double`). If no return type is specified, Dart infers it.

8. Implicit Return Type
If the return type is not explicitly declared, Dart **automatically infers** it based on the returned value. For example, if a function returns an integer, Dart assumes the return type is `int`.

9. No Return Value (Void)
If a function does not return anything, its return type is `void`. This means it performs an action (like printing) but does not produce a value that can be used elsewhere.

10. Higher-Order Functions
A higher-order function is a function that:Accepts another function as an argument, orReturns a function as a result.
This is common in functional programming and is used with callbacks, event handlers, and operations like `map`, `where`, and `forEach`.


11. Lexical Closures
A closure is a function that remembers and accesses variables from its parent scope, even after the parent function has finished executing. This allows for data encapsulation and function factories.

12. Generators
Generators are special functions that produce a sequence of values lazily(on-demand) instead of computing everything at once. There are two types:
•	Synchronous generators (`sync`): Return an `Iterable` and use `yield` to emit values.
•	Asynchronous generators(`async`): Return a `Stream` and can `await` between yields.
Generators are useful for handling large or infinite sequences efficiently.

Summary:
•	Regular functions: are the foundation.
•	Parameters: make functions dynamic.
•	Arrow functions: shorten single-expression functions.
•	Optional parameters: provide flexibility.
•	Named parameters: improve readability.
•	Return types: define what a function gives back.
•	Higher-order functions: enable functional programming.
•	Closures: remember outer variables.
•	Generators: produce sequences efficiently.
