local letters = {
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "y",
    "z"
}
local numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 10, 11, 12, 12, 13, 14, 15, 16, 17, 18, 19}
local symbols = {"!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "'", "/", "{", "}"}

print(
    letters[math.random(1, #letters)] ..
        letters[math.random(1, #letters)] ..
            numbers[math.random(1, #numbers)] ..
                letters[math.random(1, #letters)] ..
                    letters[math.random(1, #letters)] ..
                        letters[math.random(1, #letters)] ..
                            letters[math.random(1, #letters)] ..
                                numbers[math.random(1, #numbers)] ..
                                    numbers[math.random(1, #numbers)] ..
                                        letters[math.random(1, #letters)] ..
                                            letters[math.random(1, #letters)] ..
                                                symbols[math.random(1, #symbols)] ..
                                                    symbols[math.random(1, #symbols)] ..
                                                        letters[math.random(1, #letters)] ..
                                                            symbols[math.random(1, #symbols)] ..
                                                                symbols[math.random(1, #symbols)] ..
                                                                    numbers[math.random(1, #numbers)] ..
                                                                        letters[math.random(1, #letters)] ..
                                                                            numbers[math.random(1, #numbers)] ..
                                                                                letters[math.random(1, #letters)] ..
                                                                                    letters[math.random(1, #letters)] ..
                                                                                        letters[math.random(1, #letters)] ..
                                                                                            letters[
                                                                                                math.random(1, #letters)
                                                                                            ] ..
                                                                                                letters[
                                                                                                    math.random(
                                                                                                        1,
                                                                                                        #letters
                                                                                                    )
                                                                                                ] ..
                                                                                                    letters[
                                                                                                        math.random(
                                                                                                            1,
                                                                                                            #letters
                                                                                                        )
                                                                                                    ] ..
                                                                                                        letters[
                                                                                                            math.random(
                                                                                                                1,
                                                                                                                #letters
                                                                                                            )
                                                                                                        ] ..
                                                                                                            numbers[
                                                                                                                math.random(
                                                                                                                    1,
                                                                                                                    #numbers
                                                                                                                )
                                                                                                            ] ..
                                                                                                                letters[
                                                                                                                    math.random(
                                                                                                                        1,
                                                                                                                        #letters
                                                                                                                    )
                                                                                                                ] ..
                                                                                                                    letters[
                                                                                                                        math.random(
                                                                                                                            1,
                                                                                                                            #letters
                                                                                                                        )
                                                                                                                    ] ..
                                                                                                                        letters[
                                                                                                                            math.random(
                                                                                                                                1,
                                                                                                                                #letters
                                                                                                                            )
                                                                                                                        ] ..
                                                                                                                            letters[
                                                                                                                                math.random(
                                                                                                                                    1,
                                                                                                                                    #letters
                                                                                                                                )
                                                                                                                            ] ..
                                                                                                                                numbers[
                                                                                                                                    math.random(
                                                                                                                                        1,
                                                                                                                                        #numbers
                                                                                                                                    )
                                                                                                                                ] ..
                                                                                                                                    numbers[
                                                                                                                                        math.random(
                                                                                                                                            1,
                                                                                                                                            #numbers
                                                                                                                                        )
                                                                                                                                    ] ..
                                                                                                                                        letters[
                                                                                                                                            math.random(
                                                                                                                                                1,
                                                                                                                                                #letters
                                                                                                                                            )
                                                                                                                                        ] ..
                                                                                                                                            letters[
                                                                                                                                                math.random(
                                                                                                                                                    1,
                                                                                                                                                    #letters
                                                                                                                                                )
                                                                                                                                            ] ..
                                                                                                                                                symbols[
                                                                                                                                                    math.random(
                                                                                                                                                        1,
                                                                                                                                                        #symbols
                                                                                                                                                    )
                                                                                                                                                ] ..
                                                                                                                                                    symbols[
                                                                                                                                                        math.random(
                                                                                                                                                            1,
                                                                                                                                                            #symbols
                                                                                                                                                        )
                                                                                                                                                    ] ..
                                                                                                                                                        letters[
                                                                                                                                                            math.random(
                                                                                                                                                                1,
                                                                                                                                                                #letters
                                                                                                                                                            )
                                                                                                                                                        ] ..
                                                                                                                                                            symbols[
                                                                                                                                                                math.random(
                                                                                                                                                                    1,
                                                                                                                                                                    #symbols
                                                                                                                                                                )
                                                                                                                                                            ]
)
