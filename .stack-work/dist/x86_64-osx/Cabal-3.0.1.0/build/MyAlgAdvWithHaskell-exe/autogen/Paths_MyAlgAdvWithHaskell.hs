{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_MyAlgAdvWithHaskell (
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

bindir     = "/Users/ghhabib/Documents/GitHub/MyAlgAdvWithHaskell/.stack-work/install/x86_64-osx/06de5de2a5de6d4665b5c84a922795119d985f9e6734b29a0afbf533f7aa10ac/8.8.2/bin"
libdir     = "/Users/ghhabib/Documents/GitHub/MyAlgAdvWithHaskell/.stack-work/install/x86_64-osx/06de5de2a5de6d4665b5c84a922795119d985f9e6734b29a0afbf533f7aa10ac/8.8.2/lib/x86_64-osx-ghc-8.8.2/MyAlgAdvWithHaskell-0.1.0.0-3PQAiRylXSYFk6ZEQl32Rx-MyAlgAdvWithHaskell-exe"
dynlibdir  = "/Users/ghhabib/Documents/GitHub/MyAlgAdvWithHaskell/.stack-work/install/x86_64-osx/06de5de2a5de6d4665b5c84a922795119d985f9e6734b29a0afbf533f7aa10ac/8.8.2/lib/x86_64-osx-ghc-8.8.2"
datadir    = "/Users/ghhabib/Documents/GitHub/MyAlgAdvWithHaskell/.stack-work/install/x86_64-osx/06de5de2a5de6d4665b5c84a922795119d985f9e6734b29a0afbf533f7aa10ac/8.8.2/share/x86_64-osx-ghc-8.8.2/MyAlgAdvWithHaskell-0.1.0.0"
libexecdir = "/Users/ghhabib/Documents/GitHub/MyAlgAdvWithHaskell/.stack-work/install/x86_64-osx/06de5de2a5de6d4665b5c84a922795119d985f9e6734b29a0afbf533f7aa10ac/8.8.2/libexec/x86_64-osx-ghc-8.8.2/MyAlgAdvWithHaskell-0.1.0.0"
sysconfdir = "/Users/ghhabib/Documents/GitHub/MyAlgAdvWithHaskell/.stack-work/install/x86_64-osx/06de5de2a5de6d4665b5c84a922795119d985f9e6734b29a0afbf533f7aa10ac/8.8.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "MyAlgAdvWithHaskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "MyAlgAdvWithHaskell_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "MyAlgAdvWithHaskell_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "MyAlgAdvWithHaskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "MyAlgAdvWithHaskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "MyAlgAdvWithHaskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
