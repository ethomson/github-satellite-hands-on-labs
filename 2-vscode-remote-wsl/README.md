# Remote Development with Visual Studio Code and WSL

The **Visual Studio Code Remote Development** extensions allow you to use a container, remote machine, or the Windows Subsystem for Linux (WSL) as a full-featured development environment. You can:

- Develop on the **same OS** you deploy to or use **more specialized** hardware.
- **Sandbox** your development environment to avoid impacting your local configuration.
- Make it easy for new contributors to get started and keep everyone on a **consistent environment**.
- Develop your Linux-deployed applications using the **Windows Subsystem for Linux**.
- Access an **existing** development environment from **multiple machines or locations**.

**No source code** or runtimes need to be on your local machine to get these benefits!

In this lab you'll:
- Learn about WSL and how you can run native Linux commands from inside Windows.
- Open Visual Studio Code and and connect it to WSL.
- Debug a Node.js project running in Windows Subsystem for Linux, from VS Code in Windows.


## Check your local system

1. Open the command prompt.
2. Type `node -v`. Node.js isn't installed locally.
3. Type `wsl`. This loads the Windows Subsystem for Linux. You'll notice that you're in a directory on your Windows filesystem. Type `uname` - you'll see the output says "Linux".

## Create an Express app

1. Create a new Node.js express app. You can do this by typing `npx express-generator my-app`. This

You'll also notice that in WSL, Node.js and Git are installed!

2. Use `cd` to change into the directory of the app you just created, and type `code-insiders .` to launch Visual Studio Code.

## Debugging in WSL

You now have the Express app open in Visual Studio Code!

1. Create a new integrated terminal with `Ctrl + Shift '`. You'll notice VS Code has automatically opened a terminal inside WSL. If you type `uname`, you'll still see "Linux".
2. Type `npm install` in the terminal to install local packages. 
3. If you'd like, set a breakpoint (for example, on line 6 of `routes\index.js`). Hit `F5` to begin debugging.

> If you're asked for an environment, choose "Node.js".

4. Open your web browser to `localhost:3000`, and you'll hit the breakpoint in Visual Studio Code!

## Review

That's it! you're doing Node.js development in WSL. If you'd like to see more, try the remote dev containers lab.

There are more remote development resources at https://aka.ms/vscode-remote
