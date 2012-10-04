<?php
/**
 * @file
 * Describe what your module does here.
 */

/**
 * Implements hook_help(). 
 *
 * Displays help and module information.
 *
 * @param path 
 *   Which path of the site we're using to display help
 * @param arg 
 *   Array that holds the current path as returned from arg() function
 */
function @MACHINENAME_help($path, $arg) {
	switch ($path) {
    case "admin/help#@MACHINENAME": {
      return '<p>' . t("Insert help text for your module here") . '</p>';
    } break;
  }
}