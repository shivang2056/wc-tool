# CCWC (Coding Challenges Word Count)

`ccwc` is a custom implementation of the `wc`(word count) unix utility, written in ruby. The tool provides functionalities to generate: word count, byte count, lines count & no of characters for the given file or Standard Input.

This challenge corresponds to the challenge from [Coding Challenges](https://codingchallenges.fyi/challenges/challenge-wc). 

## Prerequisite / Setup

1. Make sure to have ruby installed in your system.
2. Run `bundle install` from the repository's root directory to install dependencies.
3. Optional: Add the executable `bin/ccwc` in your PATH, to directly run the command from anywhere. 

## Usage

```bash
[$]> bin/ccwc test.txt
7145 58164 342190 test.txt
```

The following options are available:

     -c      Number of bytes in the file/stdin is written to the standard output.

     -l      Number of lines in the file/stdin is written to the standard output.

     -m      Number of characters in the file/stdin is written to the standard output.

     -w      Number of words in the file/stdin is written to the standard output.

If no files are specified, the standard input is used and no file name is displayed.
```bash
[$]> cat test.txt | bin/ccwc
7145 58164 342190
```

### Examples

The file `test.txt` from the repository's root directory is used for the below examples.

- When no option is provided, `ccwc` defaults to display line count, word count, and character count:
  ```bash
  [$]> bin/ccwc test.txt
  7145 58164 342190 test.txt
  ```

- When `-m` options is used:
  ```bash
  [$]> bin/ccwc -m test.txt
  339292 test.txt
  ```

- When input from standard input stream stream is used:
  ```bash
  [$]> bin/ccwc
  qwerty 12345
  asdfg 6789
  zxc 0
  3 6 30
  ```

- When input from standard input stream using pipe(|) operator is used:
  ```bash
  [$]> cat test.txt | bin/ccwc
  7145 58164 342190
  ```

- When input from standard input stream stream using pipe(|) operator and `-l` option is used:
  ```bash
  [$]> cat test.txt | bin/ccwc -l
  7145 
  ```


## License

[MIT](LICENSE) © Shivang Yadav
