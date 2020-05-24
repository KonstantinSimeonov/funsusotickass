# funsusoticksass

Contains a couple programming problems and a few runners for solutions.

## Solving a problem
Create your solution file in the directory of the problem. Run your solution against the tests:

```
./runners/run.sh /problems/path/to/my/solution.js
```

## Structure
- `problems/` directory contains the problem descriptions, their tests and test generators
- `runners/` directory contains implemeted runners for different languages

## Requiements
- node
- a bash-compatible shell

## Hints:

### Reading stdin to a string in nodejs environment:

```js
const input = require('fs') // required to work with the filesystem
    .readFileSync(0) // read a buffer from stdin file descriptor
    .toString('utf8'); // convert the buffer to a string
```
