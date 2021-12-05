package com.tlab.mvc.schedule.model.exception;

public class ScheduleException extends RuntimeException{

	private static final long serialVersionUID = 1L;

	public ScheduleException() {
		super();
	}

	public ScheduleException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public ScheduleException(String message, Throwable cause) {
		super(message, cause);
	}

	public ScheduleException(String message) {
		super(message);
	}

	public ScheduleException(Throwable cause) {
		super(cause);
	}

	
}
