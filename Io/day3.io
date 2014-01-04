# Day 3 exercises

# Exercise 1: Update XML Builder class to show indentation

Builder := Object clone
Builder depth := 0
Builder closeinline := false
Builder forward := method(
    # Always start an element on a a new line
    write("\n")
    # indent based on current depth
    putindent()
    # write out tag
    write("<", call message name, ">")
    # loop through nested elements
    call message arguments foreach(arg,
        # increase depth for nested tags
        depth = depth + 1
        # recurse
        content := self doMessage(arg)
        # print strings inline
        if(content type == "Sequence",
            # true
            write(content)
            closeinline = true,
            # false
            closeinline = false
        )
        # pull back up one level
        depth = depth - 1
    )
    # if closing a set of nested tags, put end tag on new line
    closeinline ifFalse(
        write("\n")
        putindent()
    )
    # print closing tag
    write("</", call message name, ">")
)

Builder putindent := method(
    if(depth > 0,
        for(i, 1, depth, 1,
            write("  ")
        )
    )
)


Builder ul(
    li("Io"),
    li("Lua"),
    li("JavaScript")
)

"\n" println

Builder html(
    head(
        link("some link"),
        link("another link")
    ),
    body(
        div(
            p("paragraph 1"),
            p("paragraph 2")
        ),
        div(
            p("paragraph 3"),
            div(
                p("paragraph 4")
                p("paragraph 5")
            )
        )
    )
)

"\n" println



# Exercise 3: Update XML Builder class to handle attributes

OperatorTable addAssignOperator(":", "atPutAtt")
curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r
)

Map atPutAtt := method(
    self atPut(
        call evalArgAt(0),
        call evalArgAt(1)
    )
)

Builder := Object clone
Builder depth := 0
Builder closeinline := false
Builder forward := method(
    # Always start an element on a a new line
    write("\n")
    # indent based on current depth
    putindent()
    # find attributes
    atts := ""
    if(call message arguments at(0) type == "Map",
        atts = call message arguments removeAt(0)
    )
    # write out tag
    write("<", call message name)
    # write attributes
    if(atts size > 0,
        atts foreach(key, value,
            write(" \"", key, "\"=\"", value, "\"")
        )
    )
    # close tag
    write(">")            
    # loop through nested elements
    call message arguments foreach(arg,
        # increase depth for nested tags
        depth = depth + 1
        # recurse
        content := self doMessage(arg)
        # print strings inline
        if(content type == "Sequence",
            # true
            write(content)
            closeinline = true,
            # false
            closeinline = false
        )
        # pull back up one level
        depth = depth - 1
    )
    # if closing a set of nested tags, put end tag on new line
    closeinline ifFalse(
        write("\n")
        putindent()
    )
    # print closing tag
    write("</", call message name, ">")
)

Builder putindent := method(
    if(depth > 0,
        for(i, 1, depth, 1,
            write("  ")
        )
    )
)


Builder html(
    head(
        link("some link"),
        link("another link")
    ),
    body(
        div({"class":"main"},
            p("paragraph 1"),
            p("paragraph 2")
        ),
        div(
            p("paragraph 3"),
            div(
                p("paragraph 4")
                p("paragraph 5")
            )
        )
    )
)

"\n" println
