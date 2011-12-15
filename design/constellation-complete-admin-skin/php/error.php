<?php

	/*
	 * Error handling
	 * The two functions below can be bundled in a file and included on every page
	 */
	
	// Define a custom error handler
	function userErrorHandler($errno, $errstr, $errfile = '', $errline = 0, $errcontext = array())
	{
		// Check if the error code is not included in error_reporting
		if (!(error_reporting() & $errno))
		{
			return;
		}
		
		// Restore default handlers to prevent errors in errors
		restore_error_handler();
		if (function_exists('restore_exception_handler'))
		{
			restore_exception_handler();
		}
		
		// Load error page
		require('_errors/error.php');
		exit();
	}
	set_error_handler('userErrorHandler');
	
	// Define a custom handler for uncaught exceptions
	if (function_exists('set_exception_handler'))
	{
		function userExceptionHandler($exception)
		{
			// Restore default handlers to prevent errors in errors
			restore_error_handler();
			if (function_exists('restore_exception_handler'))
			{
				restore_exception_handler();
			}
			
			// Load error page
			require('_errors/error.php');
			exit();
		}
		set_exception_handler('userExceptionHandler');
	}
	
	
	
	/*
	 * Dummy code to simulate error
	 * This part of the file is only for the demo, do not include in your projects!
	 */
	
	// Pseudo-functions to simulate a real stack
	function checkLoadData($options)
	{
		// Custom data to simulte context
		$i = 12;
		$id_user = $options['id_user'];
		
		// And here comes the error
		trigger_error('Undefined variable: test', E_USER_ERROR);
	}
	function loadUser($id_user)
	{
		// Custom data to simulate context
		$options = array(
			'id_user' => $id_user,
			'logged' => false,
			'groups' => array(4, 5, 12),
			'resetPassword' => false,
			'mail' => 'name@domaine.com'
		);
		
		return checkLoadData($options);
	}
	function initUser()
	{
		return loadUser(42);
	}
	
	// Yeehaa !
	initUser();

?>