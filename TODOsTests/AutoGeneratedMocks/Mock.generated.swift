// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



#if MockyCustom
import SwiftyMocky
import RealmSwift
@testable import TODOs

    public final class MockyAssertion {
        public static var handler: ((Bool, String, StaticString, UInt) -> Void)?
    }

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        guard let handler = MockyAssertion.handler else {
            assert(expression, message, file: file, line: line)
            return
        }

        handler(expression(), message(), file, line)
    }
#elseif Mocky
import SwiftyMocky
import XCTest
import RealmSwift
@testable import TODOs

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        XCTAssert(expression(), message(), file: file, line: line)
    }
#else
import Sourcery
import SourceryRuntime
#endif


// MARK: - TasksLocalServiceProtocol
open class TasksLocalServiceProtocolMock: TasksLocalServiceProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func saveTask(_ task: Task) throws {
        addInvocation(.m_saveTask__task(Parameter<Task>.value(`task`)))
		let perform = methodPerformValue(.m_saveTask__task(Parameter<Task>.value(`task`))) as? (Task) -> Void
		perform?(`task`)
		do {
		    _ = try methodReturnValue(.m_saveTask__task(Parameter<Task>.value(`task`))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    open func getTasks() throws -> [Task] {
        addInvocation(.m_getTasks)
		let perform = methodPerformValue(.m_getTasks) as? () -> Void
		perform?()
		var __value: [Task]
		do {
		    __value = try methodReturnValue(.m_getTasks).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getTasks(). Use given")
			Failure("Stub return value not specified for getTasks(). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func removeTask(_ task: Task) throws {
        addInvocation(.m_removeTask__task(Parameter<Task>.value(`task`)))
		let perform = methodPerformValue(.m_removeTask__task(Parameter<Task>.value(`task`))) as? (Task) -> Void
		perform?(`task`)
		do {
		    _ = try methodReturnValue(.m_removeTask__task(Parameter<Task>.value(`task`))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    open func updateTaskTitle(_ task: Task, title: String) throws {
        addInvocation(.m_updateTaskTitle__tasktitle_title(Parameter<Task>.value(`task`), Parameter<String>.value(`title`)))
		let perform = methodPerformValue(.m_updateTaskTitle__tasktitle_title(Parameter<Task>.value(`task`), Parameter<String>.value(`title`))) as? (Task, String) -> Void
		perform?(`task`, `title`)
		do {
		    _ = try methodReturnValue(.m_updateTaskTitle__tasktitle_title(Parameter<Task>.value(`task`), Parameter<String>.value(`title`))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    open func updateTaskDetail(_ task: Task, detail: String) throws {
        addInvocation(.m_updateTaskDetail__taskdetail_detail(Parameter<Task>.value(`task`), Parameter<String>.value(`detail`)))
		let perform = methodPerformValue(.m_updateTaskDetail__taskdetail_detail(Parameter<Task>.value(`task`), Parameter<String>.value(`detail`))) as? (Task, String) -> Void
		perform?(`task`, `detail`)
		do {
		    _ = try methodReturnValue(.m_updateTaskDetail__taskdetail_detail(Parameter<Task>.value(`task`), Parameter<String>.value(`detail`))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }


    fileprivate enum MethodType {
        case m_saveTask__task(Parameter<Task>)
        case m_getTasks
        case m_removeTask__task(Parameter<Task>)
        case m_updateTaskTitle__tasktitle_title(Parameter<Task>, Parameter<String>)
        case m_updateTaskDetail__taskdetail_detail(Parameter<Task>, Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_saveTask__task(let lhsTask), .m_saveTask__task(let rhsTask)):
                guard Parameter.compare(lhs: lhsTask, rhs: rhsTask, with: matcher) else { return false } 
                return true 
            case (.m_getTasks, .m_getTasks):
                return true 
            case (.m_removeTask__task(let lhsTask), .m_removeTask__task(let rhsTask)):
                guard Parameter.compare(lhs: lhsTask, rhs: rhsTask, with: matcher) else { return false } 
                return true 
            case (.m_updateTaskTitle__tasktitle_title(let lhsTask, let lhsTitle), .m_updateTaskTitle__tasktitle_title(let rhsTask, let rhsTitle)):
                guard Parameter.compare(lhs: lhsTask, rhs: rhsTask, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsTitle, rhs: rhsTitle, with: matcher) else { return false } 
                return true 
            case (.m_updateTaskDetail__taskdetail_detail(let lhsTask, let lhsDetail), .m_updateTaskDetail__taskdetail_detail(let rhsTask, let rhsDetail)):
                guard Parameter.compare(lhs: lhsTask, rhs: rhsTask, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsDetail, rhs: rhsDetail, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_saveTask__task(p0): return p0.intValue
            case .m_getTasks: return 0
            case let .m_removeTask__task(p0): return p0.intValue
            case let .m_updateTaskTitle__tasktitle_title(p0, p1): return p0.intValue + p1.intValue
            case let .m_updateTaskDetail__taskdetail_detail(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getTasks(willReturn: [Task]...) -> MethodStub {
            return Given(method: .m_getTasks, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func saveTask(_ task: Parameter<Task>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_saveTask__task(`task`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func saveTask(_ task: Parameter<Task>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_saveTask__task(`task`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
        public static func getTasks(willThrow: Error...) -> MethodStub {
            return Given(method: .m_getTasks, products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getTasks(willProduce: (StubberThrows<[Task]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getTasks, products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([Task]).self)
			willProduce(stubber)
			return given
        }
        public static func removeTask(_ task: Parameter<Task>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_removeTask__task(`task`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func removeTask(_ task: Parameter<Task>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_removeTask__task(`task`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
        public static func updateTaskTitle(_ task: Parameter<Task>, title: Parameter<String>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_updateTaskTitle__tasktitle_title(`task`, `title`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func updateTaskTitle(_ task: Parameter<Task>, title: Parameter<String>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_updateTaskTitle__tasktitle_title(`task`, `title`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
        public static func updateTaskDetail(_ task: Parameter<Task>, detail: Parameter<String>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_updateTaskDetail__taskdetail_detail(`task`, `detail`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func updateTaskDetail(_ task: Parameter<Task>, detail: Parameter<String>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_updateTaskDetail__taskdetail_detail(`task`, `detail`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func saveTask(_ task: Parameter<Task>) -> Verify { return Verify(method: .m_saveTask__task(`task`))}
        public static func getTasks() -> Verify { return Verify(method: .m_getTasks)}
        public static func removeTask(_ task: Parameter<Task>) -> Verify { return Verify(method: .m_removeTask__task(`task`))}
        public static func updateTaskTitle(_ task: Parameter<Task>, title: Parameter<String>) -> Verify { return Verify(method: .m_updateTaskTitle__tasktitle_title(`task`, `title`))}
        public static func updateTaskDetail(_ task: Parameter<Task>, detail: Parameter<String>) -> Verify { return Verify(method: .m_updateTaskDetail__taskdetail_detail(`task`, `detail`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func saveTask(_ task: Parameter<Task>, perform: @escaping (Task) -> Void) -> Perform {
            return Perform(method: .m_saveTask__task(`task`), performs: perform)
        }
        public static func getTasks(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getTasks, performs: perform)
        }
        public static func removeTask(_ task: Parameter<Task>, perform: @escaping (Task) -> Void) -> Perform {
            return Perform(method: .m_removeTask__task(`task`), performs: perform)
        }
        public static func updateTaskTitle(_ task: Parameter<Task>, title: Parameter<String>, perform: @escaping (Task, String) -> Void) -> Perform {
            return Perform(method: .m_updateTaskTitle__tasktitle_title(`task`, `title`), performs: perform)
        }
        public static func updateTaskDetail(_ task: Parameter<Task>, detail: Parameter<String>, perform: @escaping (Task, String) -> Void) -> Perform {
            return Perform(method: .m_updateTaskDetail__taskdetail_detail(`task`, `detail`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - TasksTableViewAdapterDelegate
open class TasksTableViewAdapterDelegateMock: TasksTableViewAdapterDelegate, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func didRemoved(task: Task) {
        addInvocation(.m_didRemoved__task_task(Parameter<Task>.value(`task`)))
		let perform = methodPerformValue(.m_didRemoved__task_task(Parameter<Task>.value(`task`))) as? (Task) -> Void
		perform?(`task`)
    }

    open func didSelect(task: Task) {
        addInvocation(.m_didSelect__task_task(Parameter<Task>.value(`task`)))
		let perform = methodPerformValue(.m_didSelect__task_task(Parameter<Task>.value(`task`))) as? (Task) -> Void
		perform?(`task`)
    }


    fileprivate enum MethodType {
        case m_didRemoved__task_task(Parameter<Task>)
        case m_didSelect__task_task(Parameter<Task>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_didRemoved__task_task(let lhsTask), .m_didRemoved__task_task(let rhsTask)):
                guard Parameter.compare(lhs: lhsTask, rhs: rhsTask, with: matcher) else { return false } 
                return true 
            case (.m_didSelect__task_task(let lhsTask), .m_didSelect__task_task(let rhsTask)):
                guard Parameter.compare(lhs: lhsTask, rhs: rhsTask, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_didRemoved__task_task(p0): return p0.intValue
            case let .m_didSelect__task_task(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func didRemoved(task: Parameter<Task>) -> Verify { return Verify(method: .m_didRemoved__task_task(`task`))}
        public static func didSelect(task: Parameter<Task>) -> Verify { return Verify(method: .m_didSelect__task_task(`task`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func didRemoved(task: Parameter<Task>, perform: @escaping (Task) -> Void) -> Perform {
            return Perform(method: .m_didRemoved__task_task(`task`), performs: perform)
        }
        public static func didSelect(task: Parameter<Task>, perform: @escaping (Task) -> Void) -> Perform {
            return Perform(method: .m_didSelect__task_task(`task`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

