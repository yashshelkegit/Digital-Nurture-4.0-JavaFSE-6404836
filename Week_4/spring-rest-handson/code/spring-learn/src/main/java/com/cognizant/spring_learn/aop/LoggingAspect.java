package com.cognizant.spring_learn.aop;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

    private static final Logger LOGGER = LoggerFactory.getLogger(LoggingAspect.class);

    @Around("execution(* com.cognizant.spring_learn..*(..))")
    public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
        LOGGER.debug("START: {}", joinPoint.toShortString());
        Object result = joinPoint.proceed();
        LOGGER.debug("END: {}", joinPoint.toShortString());
        return result;
    }
}

