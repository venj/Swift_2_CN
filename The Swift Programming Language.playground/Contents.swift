/*:

# 欢迎光临Swift的世界

*/

/*:

## 关于Swift

Swift是用来开发iOS，OS X和watchOS应用的一种新语言，它集C和Objective-C的优点于一身，但是没有对C向下兼容的限制。Swift采用了安全编程的模式，加入了现代语言的特征，使得编程更简单，更有弹性，更有乐趣。Swift纯净的出身，在成熟和广受欢迎的Cocoa和Cocoa Touch框架的支持下，让所有开发者有机会对软件开发过程的进行重新思考。

Swift已经悄悄的开发了多年。苹果公司通过改进已有的编译器，调试器和开发框架基础，为Swift打下了坚实的基础。我们通过自动引用计数（Automatic Reference Counting, ARC）简化了内存管理。建立在Foundation和Cocoa的坚实基础上的框架集，也进行了彻底的现代化和标准化。Objective-C本身也已经支持块（Blocks。*译者注：Blocks类似于其他语言里的匿名函数，闭包；请区别于普通的花括号包围的语句块*），集合字面量（Collection Literals）和模块化，使框架能采用现代的语言技术而无后顾之忧。感谢这些基础工作，使我们能为未来的苹果软件开发引入一种全新的语言。

Objective-C开发者会觉得Swift很熟悉。它有着Objective-C的命名参数的可读性和Objective-C的动态对象模型。同时它能无缝访问现有的Cocoa框架，并通过混编（mix-and-match，*译者注：*）与Objective-C代码进行交互。在此基础上，Swift引入了许多新特征，并统一了语言的例程（procedural）和面向对象的部分。

Swift对新开发者更加友好。它是第一个像脚本语言一样具备强大的表达能力和令人愉悦的工业级的系统编程语言。它支持Playground（*译者注：直译为操场，但是放在语境里并不特别恰当，所以这里保持英语原文。*），一种创新特征让开发者可以随意测试Swift代码并立刻看到执行结果，而无需进行繁琐地编译和运行应用的操作。

Swift兼具现代语言的理念的精华以及历史悠久的苹果开发文化。编译器对性能进行了优化，语言对开发进行了优化，并坚持不对任何一方面作出牺牲。它被设计成能够编写简单的如“hello, world”代码，到开发整个操作系统。所有这一切，让Swift成为一门值得开发者和苹果全心投入的语言。

Swift是编写iOS，OS X和watchOS应用的一个极好的语言，它将继续通过引入新特征和新能力向前演进。我们为Swift定下了野心勃勃的目标。我们非常期待能看到你们用它创造出来的一切。

*/

/*:

## Swift巡礼

按照传统，新语言的第一个程序应该是在屏幕上打印出“Hello, world!”。在Swift中，你可以用一行代码来实现：

*/

print("Hello, world!")

/*:

如果你编写过C或Objective-C的代码，你可能会觉得这种语法看上去很眼熟－－在Swift中，这行代码就是一个完整的程序。你无需引入任何库来实现输入/输出或字符串处理功能。在全局作用范围内编写的代码被用作程序的入口点，因此你无须使用`main()`函数。你也无需在每一行语句的最后用分号作为结尾。

本章将通过向你展示如何实现各种编程任务，为你开始编写Swift代码提供足够的信息。如果你遇到了一些你不理解的知识点也不用担心－－所有在本章中介绍的知识点，在后文中都将一一详述。
*/

/*:

> **说明**
>
> 在Mac，下载下面的Playground文件，双击在Xcode中打开它：[https://developer.apple.com/go/?id=prerelease-swift-tour](https://developer.apple.com/go/?id=prerelease-swift-tour)
*/

/*:

### 简单的值类型

使用`let`创建一个常量，使用`var`创建一个变量。常量的值在编译时可以无需知道，但是你只能且必须为常量进行一次赋值。这意味着你可以用常量为一个值命名一次，但是在多处使用这个常量。

*/

var myVariable = 42
myVariable = 50
let myConstant = 42

/*:

一个常量或变量必须与其赋的值有相同的类型。不过你不需要总是显式地写出类型。你可以在创建常量和变量的时候直接赋值，让编译器来判断其类型。在上面的例子中，编译器会把`myVariable`判定为整数型，因为它的初始值是一个整数。

如果初始值未能提供足够的信息（或者并没有任何初始值），你可以在变量名后面用冒号分隔开，并标示出其类型。

*/

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble : Double = 70

/*:

> **实验**
>
> 创建一个类型为`Float`，值为`4`的显式类型的常量。

*/

/*:

一种类型的值不会隐式的转换成另一种类型。如果你想把一个值转成另一种类型，你必须显式的创建一个该类型对象。

*/

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

/*:

> **实验**
>
> 试着移除上述最后一行代码中转成`String`类型的部分。你看到了什么错误提示？

*/

/*:

还有一种更简单的在字符串中包含其他类型的值的方法：将值包含在括号中，并在括号前加一个反斜线（\）。如下所示：

*/

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSUmmary = "I have \(apples + oranges) pieces of fruit."

/*:

> **实验**
>
> 使用`\()`在字符串中包含一个浮点运算，以及包含某个人名字的祝福语。

*/

/*:

使用方括号（[]）创建数组和字典，并通过在方括号中使用数字索引（index）或键名（key）来访问这些值。你可以在最后一个元素后面保留逗号。

*/

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
var occupations = [
    "Malcolm" : "Captan",
    "Kaylee"  : "Mechanic",
]
occupations["Jayne"] = "Public Relations"

//: 要创建一个空的数组或字典，使用构造器语法：

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//: 如果类型信息可以被推断，你可以用`[]`表示空数组，用`[:]`表示空字典－－例如，当你为一个变量设置新值，或者作为参数传给方法的时候。

shoppingList = []
occupations = [:]

/*:

### 控制流

使用`if`和`switch`创建条件语句。使用`for-in`，`for`，`while`和`repeat-while`创建循环语句。包围条件或循环变量的括号是可有可无的。语句块的花括号是必需的。

*/

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    }
    else {
        teamScore += 1
    }
}
print(teamScore)

/*:

在`if`语句中，条件语句必须是一个布尔表达式－－这意味着像`if score { ... }`这样的代码是错的，因为它并不会和0进行隐式的比较。

你可以结合使用`if`和`let`来操作可能不包含值的变量。这种值也被称为“可选变量（optional）”。一个可选变量可能包含一个值，或者包含`nil`，以表示值不存在。在变量类型后加上问号（?），可以将其标记为可选变量。

*/

var optionalString : String? = "Hello"
print(optionalString == nil)

var optionalName : String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

/*:

> **实验**
>
> 将`optionalName`设为`nil`，你将得到什么祝福语？增加一个`else`语句，当`optionalName`值为`nil`时，设置一个不同的问候语。

*/

/*:

如果可选变量的值为`nil`，条件就是`false`，花括号内的语句块就被跳过。否则，可选变量被拆封（unwrapped），并赋值给`let`后面的常量，这使得拆封之后的值可以在语句块内被使用。

分支语句支持任何类型的数据和各种比较操作－－不限于整数条件和相等性比较。

*/

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That should make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)")
default:
    print("Everything tastes good in soup.")
}

/*:

> **实验**
>
> 试着删除`default`条件。你看到了什么错误提示？

*/

/*:

注意`let`是如何被用来把符合某一格式的值赋值给一个常量的。

在执行完符合匹配条件的代码之后，程序从分支语句中退出。程序并不会继续执行下一个条件，因此你无需在每一个条件代码最后，显式地跳出分支。

你可以使用`for-in`语句，通过为键-值对指定一对名字，来遍历字典的每一个项目。字典是一种无序集合，因此键和值是以一种任意的顺序遍历的。

*/

let interestingNumbers = [
    "Primes" : [2, 3, 5, 7, 11, 13],
    "Fibonacci" : [1, 1, 2, 3,  5, 8],
    "Square" : [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

/*:

> **实验**
>
> 增加另一个变量来追踪哪种类型的数包含了最大的数，以及最大的数是哪一个。

*/

/*:

使用`while`来循环一个语句块，直到条件发生变化。一个循环的条件也可以位于语句块最后，以确保语句块至少能执行一次。

*/

var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

/*:

你可以使用`..<`来创建一组数值范围，或者显式的是用初始化、条件和增量语句来得到循环的索引。下面两个循环的效果完全相同：

*/

var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
print(firstForLoop)

var secondForLoop = 0
for var i = 0; i < 4; ++i {
    secondForLoop += i
}
print(secondForLoop)

/*:

使用`..<`操作符可以让数值范围不包含上限值，使用`...`可以让数值范围同时包含上限值和下限值。

*/

/*:

### 函数和闭包

*/
