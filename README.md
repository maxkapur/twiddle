# twiddle

A shell script to swap the contents of two files.

## Usage

Sometimes you accidentally create two files whose contents you need to exchange:

```bash
$ echo "Hello!" > ko; echo "안녕하세요!" > en
$ cat en ko
안녕하세요!
Hello!
```

Oops! `en` should have the English text, and `ko` the Korean text. Using `twiddle`, we can fix this:

```bash
$ twiddle en ko
$ cat en ko
Hello!
안녕하세요!
```

## Why?

A common mistake in this situation is to run `mv en ko; mv ko en`. This overwrites the contents of `ko`, permanently deleting the data `Hello!` and causing an error in the second command.

The correct solution is to use a temporary file: `mv en tmp; mv ko en; mv tmp ko`. `twiddle` is **a failsafe shorthand for this sequence of steps.** It checks that both files exist, creates a temporary file safely (using `mktemp`) in the `/tmp/` directory to guard against overwriting files and certain kinds of snooping attacks, and then performs the exchange operation.

## Installation

Put the contents of `twiddle.sh` into a file `twiddle` somewhere on your path. You could use the following two commands:

```bash
$ sudo curl "https://raw.githubusercontent.com/maxkapur/twiddle/main/twiddle.sh" -o /usr/local/bin/twiddle
$ sudo chmod +x /usr/local/bin/twiddle
```
The first command copies the contents of `twiddle.sh` to the file `/usr/local/bin/twiddle`. The second command grants permission to execute the `/usr/local/bin/twiddle` as a program.

## Contributing

Contributions and bug reports are welcome. I have only tested this script on Ubuntu 22.04 and Ubuntu Server 22.04.
