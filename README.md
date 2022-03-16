# Summary
This is a minimal Typescript project using dream2nix.

# Problem
In a non-Nix world, there are three ways to run the program:

1. `npm install -D && npm run start`
2. `npm install -D && npx tsc index.ts && node index.js`
3. `npm install -D && npx tsc index.ts && ./bin/ts-node-example`

With dream2nix, I'm not yet sure how to get this running. Here are the results of each approach:

1. ```
[kyle@pc:~/code/ts-dream-example]$ nix develop .#ts-dream-example

[kyle@pc:~/code/ts-dream-example]$ npm run start

> ts-dream-example@1.0.0 start /home/kyle/code/ts-dream-example
> node --loader ts-node/esm index.ts

(node:16321) ExperimentalWarning: --experimental-loader is an experimental feature. This feature could change at any time
(Use `node --trace-warnings ...` to show where the warning was created)
internal/process/esm_loader.js:74
    internalBinding('errors').triggerUncaughtException(
                              ^

Error [ERR_MODULE_NOT_FOUND]: Cannot find package 'ts-node' imported from /home/kyle/code/ts-dream-example/
    at new NodeError (internal/errors.js:322:7)
    at packageResolve (internal/modules/esm/resolve.js:732:9)
    at moduleResolve (internal/modules/esm/resolve.js:773:18)
    at Loader.defaultResolve [as _resolve] (internal/modules/esm/resolve.js:887:11)
    at Loader.resolve (internal/modules/esm/loader.js:89:40)
    at Loader.getModuleJob (internal/modules/esm/loader.js:242:28)
    at Loader.import (internal/modules/esm/loader.js:177:28)
    at internal/process/esm_loader.js:57:31
    at initializeLoader (internal/process/esm_loader.js:62:5)
    at Object.loadESM (internal/process/esm_loader.js:67:11) {
  code: 'ERR_MODULE_NOT_FOUND'
}
npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! ts-dream-example@1.0.0 start: `node --loader ts-node/esm index.ts`
npm ERR! Exit status 1
npm ERR! 
npm ERR! Failed at the ts-dream-example@1.0.0 start script.
npm ERR! This is probably not a problem with npm. There is likely additional logging output above.
npm WARN Local package.json exists, but node_modules missing, did you mean to install?

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/kyle/.npm/_logs/2022-03-16T02_02_26_532Z-debug.log
``` 

1. 
```
[kyle@pc:~/code/ts-dream-example]$ nix develop .#ts-dream-example

[kyle@pc:~/code/ts-dream-example]$ npx tsc index.ts 
npx: installed 1 in 0.436s

                                                                               
                This is not the tsc command you are looking for                
                                                                               

To get access to the TypeScript compiler, tsc, from the command line either:

- Use npm install typescript to first add TypeScript to your project before using npx
- Use yarn to avoid accidentally running code from un-installed packages

```

1. ...Actually, I'm not sure how to attempt this. Ideally, I want to be able to run `nix build .#ts-dream-example`, have it compile my typescript files using `tsc`, and then be able to call `bin/`. But I know right now it has no reason to call `tsc`. Would love some feedback here.
