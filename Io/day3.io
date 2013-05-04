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
