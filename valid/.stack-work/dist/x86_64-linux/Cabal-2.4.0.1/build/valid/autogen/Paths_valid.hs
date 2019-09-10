{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_valid (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/ashish/learning/haskell/valid/.stack-work/install/x86_64-linux/510a62a5db16798f023f42a90ecf118937477a05b5ac1752d9229f0e0ee7f474/8.6.5/bin"
libdir     = "/home/ashish/learning/haskell/valid/.stack-work/install/x86_64-linux/510a62a5db16798f023f42a90ecf118937477a05b5ac1752d9229f0e0ee7f474/8.6.5/lib/x86_64-linux-ghc-8.6.5/valid-0.1.0.0-9QGj7ohj4je8E7pNN1crLo-valid"
dynlibdir  = "/home/ashish/learning/haskell/valid/.stack-work/install/x86_64-linux/510a62a5db16798f023f42a90ecf118937477a05b5ac1752d9229f0e0ee7f474/8.6.5/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/ashish/learning/haskell/valid/.stack-work/install/x86_64-linux/510a62a5db16798f023f42a90ecf118937477a05b5ac1752d9229f0e0ee7f474/8.6.5/share/x86_64-linux-ghc-8.6.5/valid-0.1.0.0"
libexecdir = "/home/ashish/learning/haskell/valid/.stack-work/install/x86_64-linux/510a62a5db16798f023f42a90ecf118937477a05b5ac1752d9229f0e0ee7f474/8.6.5/libexec/x86_64-linux-ghc-8.6.5/valid-0.1.0.0"
sysconfdir = "/home/ashish/learning/haskell/valid/.stack-work/install/x86_64-linux/510a62a5db16798f023f42a90ecf118937477a05b5ac1752d9229f0e0ee7f474/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "valid_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "valid_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "valid_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "valid_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "valid_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "valid_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
