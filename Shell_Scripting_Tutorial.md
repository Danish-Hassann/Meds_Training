## Shell Scripting Tutorial

---

### Introduction:

Shell scripting is the process of writing a series of commands in a text file to be executed by a Unix/Linux shell, such as Bash. These scripts automate tasks like file management, program execution, and system monitoring, making repetitive operations faster and more efficient.

Every shell script should start with a **shebang** line that tells the system what interpreter to use.

```
#!/bin/bash
```

### Variables:

---

```
#!/bin/bash

name="Ali"
age=25

echo "Name: $name"
echo "Age: $age"
```

There should be no space between `=` and we use `$` to reference the variable.

##### Variable Naming Rules

- Must start with a letter (a–z or A–Z).
- Can contain letters, numbers, and underscores (\_)
- No spaces or special characters
- Should not use reserved words like `if`, `for`, `while`, `case`, etc.

Here are some of the examples of valid variable names.

```
username
user_name
var1
USER_NAME
```

##### Invalid Variable Names

| Variable Name | Reason for being invalid         |
| ------------- | -------------------------------- |
| `1name`       | Starts with a number.            |
| `my-name`     | Contains a hyphen.               |
| `user name`   | Contains a space.                |
| `@var`        | Starts with a special character. |
| `my$name`     | Contains special character `$`.  |
| `class!`      | Contains exclamation mark `!`.   |
| `total%`      | Contains a percent sign `%`.     |
| `for`         | Reserved keyword.                |

### If-Else Statements

---

This syntax is used for if and else statements and since it's a conditional execution, it must end with `fi`

```
if [ condition ]; then
    commands
elif [ condition ]; then
    commands
else
    commands
fi
```

### Comparison Operators

---

##### Numeric Operators

| Operator | Meaning                  | Example         |
| -------- | ------------------------ | --------------- |
| `-eq`    | Equal to                 | `[ $a -eq $b ]` |
| `-ne`    | Not equal to             | `[ $a -ne $b ]` |
| `-lt`    | Less than                | `[ $a -lt $b ]` |
| `-le`    | Less than or equal to    | `[ $a -le $b ]` |
| `-gt`    | Greater than             | `[ $a -gt $b ]` |
| `-ge`    | Greater than or equal to | `[ $a -ge $b ]` |

##### String Operators

| Operator | Meaning                  | Example                  |
| -------- | ------------------------ | ------------------------ |
| `=`      | Equal to                 | `[ "$str1" = "$str2" ]`  |
| `!=`     | Not equal to             | `[ "$str1" != "$str2" ]` |
| `<`      | Less than (alphabetical) | `[ "$str1" \< "$str2" ]` |
| `>`      | Greater than             | `[ "$str1" \> "$str2" ]` |
| `-z`     | String is empty          | `[ -z "$str" ]`          |
| `-n`     | String is not empty      | `[ -n "$str" ]`          |

Use backslashes `\` to escape `<` and `>` in single brackets. Otherwise bash will treat them as input output redirection operators.

### Loops

---

We can loop over iterables using `for` and `while` loops.

##### For Loop

There are 2 main syntax for a `for` loop.

```
for variable in list
do
    commands
done

--Example

for color in red green blue
do
    echo "Color: $color"
done
```

Similarly we have,

```
for (( initialization; condition; increment ))
do
    commands
done

--Example

for (( i=1; i<=5; i++ ))
do
    echo "Number: $i"
done
```

##### While Loop

It works exactly like a regular while loop, the **commands** are executed repeatedly as long as the condition is **true**.

```
while [ condition ]
do
    commands
done

--Example

count=1
while [ $count -le 5 ]
do
    echo "Count: $count"
    ((count++))
done
```

### Basic Shell Commands:

| Commands | Description                                               |
| -------- | --------------------------------------------------------- |
| `pwd`    | Displays the current directory you are in.                |
| `ls`     | Shows the files and directories in the current directory. |
| `cd`     | Navigates to a different directory.                       |
| `rmdir`  | Deletes an empty directory.                               |
| `rm`     | Deletes files or directories.                             |
| `cp`     | Copies files or directories to another location.          |
| `mv`     | Moves files to another location or renames them.          |

> You can learn more about these commands by using `--help` after any command.
