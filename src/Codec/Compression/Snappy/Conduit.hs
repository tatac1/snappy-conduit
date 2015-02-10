module Codec.Compression.Snappy.Conduit (
    -- * Conduit interface
      decompressConduit
    , compressConduit
    ) where


import           Codec.Compression.Snappy (compress, decompress)
import           Data.ByteString.Char8    (ByteString)
import           Data.Conduit
import qualified Data.Conduit.List        as CL

-- | Compress data into the Snappy format.
decompressConduit :: Monad m => Conduit ByteString m ByteString
decompressConduit = CL.map decompress

-- | Decompress data in the Snappy format.
-- If the input is not compressed or is corrupt, an exception will be thrown.
compressConduit :: Monad m => Conduit ByteString m ByteString
compressConduit = CL.map compress

