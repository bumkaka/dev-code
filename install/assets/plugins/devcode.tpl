//<?php
/**
 * DevCode 
 * 
 * just make MODx evo is easy
 *
 * @category    plugin
 * @version     0.1
 * @author		By Bumkaka from modx.im
 * @internal    @properties 
 * @internal    @events OnWebPagePrerender
 * @internal	@properties 
 * @internal    @modx_category Manager and Admin
 * @internal    @installset base
 */
$output = $modx->documentOutput;
if ( strpos($output,'{--') === false ) return;
$parts = explode('{--',$output);

$_tmp = array();
for($i = count($parts)-1;$i>0;$i-- ){
	if ( strpos($parts[$i], '--}') !== false ){
		$part = explode('--}', $parts[$i]);
		$_tmp[0] = end( $part ) . $_tmp[0];
		array_pop($part);
		$_tmp = array_merge($part, $_tmp);
	} else {
		$_tmp[0] = $parts[$i] . $_tmp[0];
	}
		
	if ( !empty( $_SESSION['mgrValidated']) ) {
		$_tmp[0] .= $_tmp[1];
		unset( $_tmp[1]);
		$_tmp = array_slice(  array_diff( $_tmp, array('') ),0) ;
	} else {
		array_shift($_tmp);
	}
}

$modx->documentOutput = $parts[0].implode('',$_tmp);