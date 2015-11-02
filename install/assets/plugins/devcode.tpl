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
 * @internal    @events OnParseDocument,OnWebPagePrerender
 * @internal	@properties 
 * @internal    @modx_category Manager and Admin
 * @internal    @installset base
 */
$output = $modx->documentOutput;
if ( strpos($output,'{--') === false ) return;
$parts = explode('{--',$output);
foreach($parts as $part){
	$part = explode('--}', $part);
	if ( count($part) > 1 ){
		if ( !empty( $_SESSION['mgrValidated']) ) {
			$part = implode('',$part);
		} else {
			$part = $part[1];
		}
	} else{
		$part = $part[0];
	}
	$out[] = $part;
}
$modx->documentOutput = implode('',$out);