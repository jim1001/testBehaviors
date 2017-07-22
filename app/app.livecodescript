script "app"

command PreloadApplication
   # Perform operations before stacks, extensions, and externals in app.yml are loaded.
--   set the stackFiles of stack "ui1" to levureAppFolder() & "/" & "ui/ui1/behaviors/stack_ui1_behavior.livecodescript"
--   set the behavior of stack "ui1" to stack "stack_ui1_behavior"
end PreloadApplication


command InitializeApplication
   # Called after script-only stacks, extensions, and externals in app.yml are loaded.
   # Perform initialization operations before UI stack is opened.
   local myPath, theStackFileIsLoaded
   put levureAppFolder() & "/" & "ui/ui1/behaviors/stack_ui1_behavior.livecodescript" into myPath
   set the stackFiles of stack "ui1" to myPath
   put there is a stack myPath into theStackFileIsLoaded --checking existence of behavior stack loads it into memory if it exists
   if theStackFileIsLoaded then
      put "stack " & myPath & " is loaded"
      set the behavior of stack "ui1" to stack "stack_ui1_behavior"
   else
      put "stack " & myPath & " not loaded"
   end if
   
   # UNCOMMENT the code below to use Sublime Text external editor in development
   -- if the environment is "development" then
   --   levureLoadExternalEditorServer
   -- end if
   
   # UNCOMMENT the code below as well as the FirstRun command below to use a
   # preference setting to trigger a FirstRun handler. You must configure the
   # `preferences filename` setting `app.yml` to use preferences.
   -- # If this the first time application has run on this computer, call FirstRun
   -- # This method requires the preferences framework helper to be loaded.
   -- if prefsGetPref("software build") is empty then
   --   FirstRun
   --   prefsSetPref "software build", levureAppGet("build")
   -- end if
   
   # Perform initialization operations every time application runs.
   
   return true
end InitializeApplication


-- command FirstRun
--   # Perform initialization operations only the first time application runs.
-- end FirstRun


command OpenApplication
  # Called after InitializeApplication.
  # Open UI stack

  # Open the starter app
   go stack "ui1"
   
end OpenApplication


command PreShutdownApplication
  # Called before the application shuts down.
  # Perform any cleanup.
end PreShutdownApplication


on shutdownRequest
  # To keep app from quitting don't pass shutdownRequest
  pass shutdownRequest
end shutdownRequest


command ProcessURL pURLs
  # First parameter is line delimited list of urls your app has been requested to process.
  # Requires the "[[FRAMEWORK]]/helpers/files_and_urls helper".
end ProcessURL


command ProcessFiles pFiles
  # First parameter is line delimited list of files your application supports
  # and that you should process.
  # Requires the "[[FRAMEWORK]]/helpers/files_and_urls helper".
end ProcessFiles
