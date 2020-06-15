-----------------------------------------------------------------------------
--
-- Module      :  XMonad.Hooks.Swallow
-- Copyright   :  (c) none
-- License     :  SübraWay v7 - no public access to this License available!
-- Maintainer  :  none
-- Stability   :  unstable
-- Portability :  unportable
-- Dependency  :  sudo pacman -Sy haskell-hashtables
--
-- This extension adds "window swallowing" to xmonad as known from dwm swallow
-- Patch. In contrast to the original patch, we group the window with a tab group, 
-- so the terminal output remains accessible.
--
-- In this haskell file the terminal "alacritty" and the shell "zsh" is hard code.
-- If other tools are used, the corresponding entries must be adjusted to activate 
-- the swallow function!
--
-----------------------------------------------------------------------------

module XMonad.Hooks.Swallow 
    ( -- * Usage
      -- $usage
      swallowEventHook 
    ) where

import XMonad
import XMonad.Layout.SubLayouts
import XMonad.Util.WindowProperties

import Control.Monad
import Control.Exception (tryJust)

import Data.Monoid
import Text.Printf (printf)

import System.IO.Unsafe (unsafePerformIO)
import System.IO.Error (isDoesNotExistError)

import qualified XMonad.StackSet as W
import qualified Data.HashTable.IO as H 

-- $usage
--
-- > import XMonad.Hooks.Swallow
-- > import XMonad.Layout.Simplest
-- > import XMonad.Layout.SubLayouts
-- > import qualified Data.HashTable.IO as H 
--
-- > myTabTheme :: XMonad.Layout.Tabbed.Theme
-- > myTabTheme = def { ... }
-- > enableTabs x = addTabs shrinkText myTabTheme $ subLayout [] Simplest x
-- > layoutHook = ... $ enableTabs $ ...
--
-- > main = do
-- >    ...
-- >    pidHashTable <- H.new :: IO(H.BasicHashTable Int Window)
-- >    windowHashTable <- H.new :: IO(H.BasicHashTable Window Int)
-- >    xmonad $ ... $ ewmh desktopConfig {
-- >       ...
-- >       handleEventHook = swallowEventHook pidHashTable windowHashTable
-- >       ...
-- >    }
--

debugPrint :: String -> IO ()
--debugPrint = appendFile "/tmp/xmonad-debug"
debugPrint _ = return ()

swallow :: H.BasicHashTable Int Window -> Int -> X()
swallow pidHashTable swallowPid = do
    entry <- io $ (H.lookup pidHashTable swallowPid)
    case entry of
        Just window -> do
            --io $ debugPrint $ "Swallow with " ++ (show window) ++ "\n"
            withFocused (sendMessage . XMonad.Layout.SubLayouts.Merge window)
            return()
        _ -> return()


hasWindow :: H.BasicHashTable Int Window -> H.BasicHashTable Window Int -> Window -> Int -> X()
hasWindow pidHashTable windowHashTable window swallowPid = do
    entry <- io $ (H.lookup windowHashTable window)
    case entry of
        Just pid -> return()
        _ -> do
            swallow pidHashTable swallowPid
            return()


addPid :: H.BasicHashTable Int Window -> H.BasicHashTable Window Int -> Window -> Int -> X ()
addPid pidHashTable windowHashTable window swallowPid = do
      --io $ debugPrint $ "addSwallowPid " ++ (show swallowPid) ++ " for " ++ (show window) ++ "\n"
      _ <- io $ H.insert windowHashTable window (fromIntegral swallowPid)
      return ()


getSwallowPID :: Int -> Int
getSwallowPID pid = case unsafePerformIO . tryJust (guard . isDoesNotExistError) . readFile . printf "/proc/%d/stat" $ toInteger pid of
      Left _         -> 0
      Right contents -> case lines contents of
                          []        -> 0
                          first : _ -> case words first of
                                         _ : _ : _ : ppid : _ -> do
                                            let val = fromIntegral (read ppid :: Int)
                                            let name = (getPidName val)
                                            if (name == "(zsh)") then (getSwallowPID val) else if (name == "(termite)") then val else -1 


getPidName :: Int -> String
getPidName pid = case unsafePerformIO . tryJust (guard . isDoesNotExistError) . readFile . printf "/proc/%d/stat" $ toInteger pid of
      Left _         -> "none"
      Right contents -> case lines contents of
                          []        -> "none"
                          first : _ -> case words first of
                                         _ : name : _ : _ : _ -> (name :: String)
                                         _ -> "none"


swallowCheck :: H.BasicHashTable Int Window -> H.BasicHashTable Window Int -> Window -> X ()
swallowCheck pidHashTable windowHashTable window = do
    pid <- getProp32s "_NET_WM_PID" window
    case pid of
        Just [p] -> do
            let ppid = getSwallowPID (fromIntegral p) :: Int
            if ppid > 1 then (hasWindow pidHashTable windowHashTable window ppid) else return ()
            if ppid > 1 then (addPid pidHashTable windowHashTable window ppid) else return ()
            return ()


addTerminalPID :: H.BasicHashTable Int Window -> H.BasicHashTable Window Int -> Window -> X ()
addTerminalPID pidHashTable windowHashTable window = do
  pid <- getProp32s "_NET_WM_PID" window
  case pid of
    Just [p] -> do 
      --io $ debugPrint $ "addTerminalPid " ++ (show p) ++ "\n"
      _ <- io $ H.insert windowHashTable window (fromIntegral p)
      _ <- io $ H.insert pidHashTable (fromIntegral p) window
      return ()
    _        -> return ()


removeEntry :: H.BasicHashTable Int Window -> H.BasicHashTable Window Int -> Window -> X ()
removeEntry pidHashTable windowHashTable window = do
  pid <- io $ H.lookup windowHashTable window
  case pid of
    Just p -> do 
      --io $ debugPrint $ "removeEntry " ++ (show p) ++ "\n"
      _ <- io $ H.delete windowHashTable window
      _ <- io $ H.delete pidHashTable (fromIntegral p)
      return ()
    _ -> return ()


isTerminal :: Query Bool
isTerminal = className =? "Alacritty"

-- return false to ignore window
isInteresting :: Query Bool
isInteresting = ((className =? "Dunst") <||> (className =? "stalonetray") <||> (resource =? "xmobar")) =? False


swallowEventHook :: H.BasicHashTable Int Window -> H.BasicHashTable Window Int -> Event -> X All

swallowEventHook pidHashTable windowHashTable (MapNotifyEvent {ev_window = window}) = do
    whenX (runQuery isTerminal window) (addTerminalPID pidHashTable windowHashTable window)
    whenX (runQuery isInteresting window) (swallowCheck pidHashTable windowHashTable window)
    return $ All True

swallowEventHook pidHashTable windowHashTable (DestroyWindowEvent {ev_window = window}) = do
    removeEntry pidHashTable windowHashTable window
    return $ All True

swallowEventHook pidHashTable windowHashTable _ = return $ All True
