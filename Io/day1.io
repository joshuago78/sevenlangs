/* Day 1 Answer Exercises


Evaluate 1 + 1 and then 1+ "one". Is Io strongly types or weakly typed?

Io> 1+1
==> 2
Io> 1+"one"

Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
---------
message '+' in 'Command Line' on line 1

Ans: Io is strongly typed

-------------------------------------------------------------------------------

Is 0 true or false? What about the empty string? Is nil true or false?

Io> true and 0
==> true
Io> true and ""
==> true
Io> true and nil
==> false

Ans: 0 and "" are true. nil is false

-------------------------------------------------------------------------------

How can you tell what slots a prototype supports?

Ans: call proto slotNames

Io> Vehicle proto slotNames
==> list(yield, super, coroDoLater, uniqueHexId, returnIfError, ifNonNil, actorRun, lexicalDo, -, ==, slotValues, >=, slotDescriptionMap, handleActorException, removeAllProtos, serializedSlots, block, setSlotWithType, wait, slotNames, slotSummary, asSimpleString, appendProto, evalArgAndReturnNil, apropos, in, resend, print, memorySize, stopStatus, ownsSlots, return, protos, doFile, ancestors, compare, argIsCall, <=, setSlot, cloneWithoutInit, coroFor, newSlot, inlineMethod, thisMessage, ifNonNilEval, coroDo, evalArgAndReturnSelf, relativeDoFile, @, hasDirtySlot, hasProto, @@, addTrait, isError, contextWithSlot, break, type, ifNil, method, evalArg, actorProcessQueue, ancestorWithSlot, loop, clone, !=, writeln, , pause, ifError, >, doRelativeFile, getLocalSlot, serializedSlotsWithNames, <, foreachSlot, .., shallowCopy, futureSend, hasSlot, setIsActivatable, message, thisContext, init, serialized, if, launchFile, lazySlot, currentCoro, become, raiseIfError, ifNilEval, isLaunchScript, performWithArgList, isTrue, isNil, or, do, ?, returnIfNonNil, continue, prependProto, isKindOf, asString, println, hasLocalSlot, argIsActivationRecord, removeSlot, doString, perform, coroWith, justSerialized, proto, list, doMessage, asyncSend, write, switch, deprecatedWarning, for, isActivatable, getSlot, and, while, not, setProto, setProtos, updateSlot, isIdenticalTo, thisLocalContext, removeAllSlots, try, markClean, uniqueId, removeProto)

-------------------------------------------------------------------------------

What is the difference between =, :=, and ::=? When would you use each one?

= sets a value to an existing slot, throws error if slot does not exist

:= creates a slot and sets a value to it

::= creates a slot, sets a value to it, and creates a setter for it

-------------------------------------------------------------------------------

*/

/* Day 1 Do exercises

- Run an Io program from a file

Ans: To do this simply run this file with the following command

io day1.io


- Execute the code in a slot given its name

*/

Greeter := Object clone
Greeter greet := method("Hello, World!" println)
greedo := Greeter clone
greedo greet

