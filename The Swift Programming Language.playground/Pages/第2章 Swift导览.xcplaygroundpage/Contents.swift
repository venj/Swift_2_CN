//: [<< 第1章 关于Swift](@previous) | [第3章 基础知识 >>](@next)


/*:

## Swift导览

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

你可以结合使用`if`和`let`来操作可能不包含值的变量。这种值也被称为“可选类型（optional）变量”。一个可选类型变量可能包含一个值，或者包含`nil`，以表示值不存在。在变量类型后加上问号（?），可以将其标记为可选类型变量。

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

如果可选类型变量的值为`nil`，条件就是`false`，花括号内的语句块就被跳过。否则，可选类型变量的值被拆封（unwrapped），并赋值给`let`后面的常量，这使得拆封之后的值可以在语句块内被使用。

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

使用`func`来声明一个函数。使用函数名和一组括号包围的参数来进行函数调用。使用`->`来分隔参数名，参数类型和函数的返回类型。

*/

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("bob", day:"Tuesday")

/*

> **实验**
>
> 移除`day`参数。加入一个参数，以在问候语中包括今天午餐的特别菜式。

*/

/*:

使用元组（tuple）创建一个复合类型值－－例如，从一个方法中返回多个值。元组的成员可以使用名字或数字索引来访问。

*/

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (max, min, sum)
}

let statistics = calculateStatistics([5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

/*:

函数也可以接受可变数量的参数，这些变量被收集到一个数组中。

*/

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)


/*:

> **实验**
>
> 编写一个能够计算其所有参数的平均值的函数。

*/

/*:

函数可以嵌套。嵌套的函数可以访问外层函数的变量。你可以使用嵌套函数来组织冗长或复杂的函数的代码。

*/

func returnFifteen() -> Int {
    var y = 10

    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()

/*:

函数是一等（first-class）类型。这意味着函数可以作为值，被另一个函数返回。

*/

func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

/*:

函数也可以把另一个函数作为其参数。

*/

func hasAnyMatch(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatch(numbers, condition: lessThanTen)

/*:

函数实际上是闭包的一种特殊形式：代码块可以被延迟调用。闭包中的代码可以访问位于创建该闭包的作用域内的变量和函数，即便闭包在执行时处于一个不同的作用域下－－你已经在嵌套函数的例子中看到了这样的一种情况。你可以使用花括号）（`{}`）包围一段代码，来创建一个匿名的闭包。使用`in`来分隔参数列表、返回值，与代码本身。

*/

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

/*:

> **实验**

重写这个闭包，为所有奇数都返回`0`。

*/

/*:

我们还可以把闭包写的更简洁。当闭包的类型是已知的时候，例如某个委托（译者注：特别注意，区别于.NET的委托）的回调，你可以忽略参数的类型，返回值的类型，或者把两者都忽略。单行语句的闭包隐式返回该行语句的值。

*/

let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)

/*:

你还可以通过序号引用参数，而不使用参数名－－这种方式在非常短的闭包里非常实用。当闭包作为最后一个参数传给函数的时候，闭包可以放到括号外，紧跟着闭括号的位置。当一个闭包是函数的唯一参数的时候，还可以完全省略括号。

*/

let sortedNumbers = numbers.sort { $0 > $1 }
print(sortedNumbers)

/*:

### 对象和类

使用`class`加上类名，可以创建一个类。类的属性的定义的写法，与定义一个常量或变量的方法一样，唯一的区别是属性是定义在类的上下文环境中的。类似的，方法和函数的定义也是一样的。

*/

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

/*:

> **实验**
>
> 使用`let`关键词，为类增加一个常量属性，另外增加一个接受一个参数的方法。

*/

/*:

在类名后加上括号，创建类的一个实例。使用点语法来访问实例的属性和方法。

*/

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

/*:

这个版本的`Shape`类缺少一样至关重要的东西：一个构造器，用于在实例创建的时候设置类。使用`init`可以创建一个构造器。

*/

class NamedShape {
    var numberOfSides : Int = 0
    var name : String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

/*:

注意这里是如何使用`self`来区分`name`属性和构造器的`name`参数的。当你创建一个类的实例时，构造器的参数传递与函数调用类似。每一个属性都必须赋值－－无论是在声明的时候（例如`numberOfSides`），或者是在构造器中（例如`name`）。

如果你需要在对象的内存被释放之前做一些清理，你可以使用`deinit`来创建一个析构器。

创建子类时，需要将其亲类放在类名后面，并用冒号分隔。创建类的时候无需扩展自一个标准的根类，因此在创建类时，你可以根据需要包含或者忽略亲类。

子类中，覆盖亲类实现的方法需要用`override`标记－－不使用`override`，而“碰巧”覆盖了一个方法，会被编译器侦测到，并且视之为一个错误。编译器也会发现那些标记为`override`而实际上并没有覆盖亲类方法的方法。

*/

class Square : NamedShape {
    var sideLength : Double

    init(sideLength: Double, name : String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

/*:

> **实验**
>
> 创建另一个`NamedShape`的子类，叫做`Circle`，其构造器接受一个半径和一个名字作为参数。并为`Circle`类实现`area()`方法和`simpleDescription()`方法。

*/

/*:

除了简单的存储属性之外，属性也可以有一个取值方法（getter，译者注：getter有时也被部分翻译成get访问器方法，后文的setter也类似）和一个赋值方法（setter）。

*/

class EquilateralTriangle : NamedShape {
    var sideLength : Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter : Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with side of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

/*:

在`perimeter`的赋值方法（setter）中，新值被隐式地命名为`newValue`。你可以在`set`后面加上括号，在里面显式地设置一个名字。

注意`EquilateralTriangle`类的构造器有3个不同的步骤：

1. 为子类声明的新属性赋值。
2. 调用亲类的构造器。
3. 修改在亲类中定义的属性的值。任何额外的调用方法、取值方法（getter）或赋值方法（setter）的设置操作也可以在这里完成。

如果你无需计算属性的值，但是仍然需要在设置新值前后执行一些代码，你可以使用`willSet`和`didSet`方法。例如，下面的这个类保证了等边三角形的边长总是与正方形的边长相等。

*/

class TriangleAndSquare {

    var triangle : EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }

    var square : Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

/*:

当你使用可选类型值的时候，你可以在方法、属性和按索引取值（subscription）等操作前使用`?`。如果`?`前的变量的值为`nil`，那么所有`?`之后的代码均被忽略，整个表达式的值也为`nil`。否则，可选类型变量的值被拆封，`?`之后的所有代码将作用于拆封之后的值。无论是哪种情况，整个表达式的值，也属于可选类型。

*/

let optionalSquare : Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

/*:

### 枚举类型和结构体

使用`enum`可以创建一个枚举类型。与类等其他类型相似，枚举类型也可以包含方法。

*/

enum Rank : Int {
    case Ace = 1
    case Two, Three, Four, Five, DDix, Seven, Nine, Ten
    case Jack, Queen, King
    func simpleDescption() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "queen"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue

/*:

> **实验**
>
> 编写一个方法，比较两个`Rank`类型的值的原始值的大小。

*/

/*:

在上述例子中，枚举类型的原始值的类型是`Int`，因此你只需指定第一个原始值。其他值按顺序被赋于原始值。你也可以使用字符串或浮点数值作为枚举的原始值。使用`rawValue`属性可以访问枚举成员的原始值。

使用`init?(rawValue:)`构造器可以从原始值创建一个枚举类型的实例。

*/

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescption()
}

/*:

枚举类型的成员值是事实上的值类型，而非其原始值的另一种写法。实际上，如果枚举类型值没有对应有意义的原始值，那么事实上，你也无需专门提供一个原始值。

*/

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

/*:

> **实验**
>
> 为`Suit`增加一个`color()`方法，为梅花（clubs）和黑桃（spades）返回"black"，为红桃（hearts）和方块（diamonds）返回"red"。

*/


/*:

注意上面的代码中，枚举的`Heart`成员通过两种方法被引用：为`hearts`常量赋值时，用了全名`Suit.Hearts`来引用，因为常量没有显式的指定类型。而在分支语句中，枚举成员通过缩略形式`.Hearts`被引用，因为`self`是已知的`Suit`类型。你可以在变量类型已知时，使用缩略形式。
*/


/*:

使用`struct`可以创建结构体。结构体支持类的很多行为，包括方法，构造器等。结构体和类之间最重要的区别是，结构体在代码之间传递的时候总是被复制的，而类则是传的引用。

*/

struct Card {
    var rank : Rank
    var suit : Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescption()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

/*:

> **实验**
>
> 为`Card`增加一个方法，创建一整叠纸牌，其中包含了所有大小（rank）和花色（suit）的组合。

*/

/*:

枚举类型的成员实例可以包含一个关联值（associated values）。同一种枚举类型的成员，可以有不同的关联值。你可以在创建实例的时候设置关联值。关联值和原始值是不同的：原始值对所有的枚举实例都是一样的，你在定义枚举类型的时候设置原始值。

例如，当你向服务器请求日出和日落的时间的时候，服务器可能会返回你要的信息或返回错误信息。

*/

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)"
case let .Error(error):
    let serverResponse = "Failure...\(error)"
}

/*:

> **实验**
>
> 为`ServerResponse`和分支语句增加一个情况。

*/

/*:

注意日出和日落时间，在匹配分支语句中不同的条件的时候，是如何从`ServerResponse`的值中提取出来的。

*/

/*:

### 协议和扩展

使用`protocal`关键词来声明一个协议。

*/

protocol ExampleProtocal {
    var simpleDescription : String { get }
    mutating func adjust()
}

/*:

类，枚举和结构体都可以采用协议。

*/

class SimpleClass : ExampleProtocal {
    var simpleDescription : String = "A very simple class."
    var anotherProperty : Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure : ExampleProtocal {
    var simpleDescription : String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

/*:

> **实验**
>
> 编写一个遵守这个协议的枚举类型。

*/

/*:

注意，在声明`SimpleStructure`的时候，用`mutating`标记了修改结构体成员的方法。而`SimpleClass`则不需要将方法标记为`mutating`（致变的），因为类中的方法总是可以修改该类的。
*/


/*:

使用`extension`来为已有的类型增加功能，如方法和计算属性（computed properties)。你可以使用扩展让引入的库或框架中的，在别处定义的类型遵守协议。

*/
extension Int : ExampleProtocal {
    var simpleDescription : String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

/*:

> **实验**
>
> 为`Double`类增加一个`absoluteValue`属性。

*/

/*:

你可以向使用其他类型名一样把协议名作为类型名－－例如，创建一个对象集合，这些对象类型不同，但是都遵守同一协议。当你处理这些把协议作为类型名的对象的时候，协议中未声明的方法是不可用的。

*/

let protocalValue : ExampleProtocal = a
print(protocalValue.simpleDescription)
//print(protocalValue.anotherProperty) // 取消注释本行，查看错误信息。

/*:

尽管`protocalValue`变量的运行时类型是`SimpleClass`，编译器只把它当作给定的`SimpleProtocal`类型的值。这就意味着你不可能“碰巧”访问到没有在协议定义中声明，而在类中实现了的方法。

*/

/*:

### 泛型

在尖括号中写一个名字，来创建一个泛型函数或泛型类。

*/
func repeatItem<Item>(item : Item, numberOfTimes : Int) -> [Item]{
    var result = [Item]()
    for _ in 0 ..< numberOfTimes {
        result.append(item)
    }
    return result
}
repeatItem("knock", numberOfTimes: 4)

/*:

你可以创建泛型函数，泛型方法，以及泛型类，泛型枚举和泛型结构体。

*/

// Swift标准库的可选类型的另一种实现
enum OptionalValue<T> {
    case None
    case Some(T)
}

var possibleInteger : OptionalValue<Int> = .None
possibleInteger = .Some(100)

/*:

在类型名后使用`where`关键词可以指定泛型的要求－－例如，要求泛型类型实现某个协议，或者要求两个泛型类型是同一种类型，或者要求泛型类型都继承自同一亲类。

*/

func anyCommonElements <T, U where T : SequenceType, U : SequenceType, T.Generator.Element : Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

/*:

> **实验**
>
> 修改`anyCommonElements(_:_:)`函数，使之成为一个新的函数，能够返回一个包含两个序列相同的元素的数组。

*/

/*:

如果泛型的限定条件比较简单，你可以忽略`whare`关键词，直接在类型名后加上引号，以及协议或类的名字。比如，`<T: Equatable>`和`<T where T: Equatable>`是一样的。

*/

//: [<< 第1章 关于Swift](@previous) | [第3章 基础知识 >>](@next)
