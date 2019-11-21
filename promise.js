function resolved(result) {
  console.log('Resolved');
}

function rejected(result) {
  console.error(result);
}

Promise.resolve().then(resolved, rejected);
// expected output: Error: fail
