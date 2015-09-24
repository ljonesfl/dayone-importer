<?php
date_default_timezone_set( 'US/Eastern' );

$aFiles = scandir( $argv[ 1 ] );

foreach( $aFiles as $key => $sFile )
{
   if( $sFile[ 0 ] == '.' )
      continue;

   $iTime = filemtime( $sFile );
   $dt = date( "m/d/Y H:iA", $iTime );
   if( file_exists( 'tmp.out' ) )
      unlink( 'tmp.out' );

   $sContents = file_get_contents( $sFile );

   $sSubject = substr( $sFile, 0, strrpos( $sFile, '.' ) );

   file_put_contents( 'tmp.out', $sSubject."\n".$sContents );
   $sCmd = "dayone -d='$dt' new < 'tmp.out'";
   echo $sCmd."\n";
   shell_exec( $sCmd );
}
