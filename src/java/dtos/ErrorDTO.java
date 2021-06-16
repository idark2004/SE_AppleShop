/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author phath
 */
public class ErrorDTO {
    private String loginError;
    private String emailError;
    private String passwordError;

    public ErrorDTO() {
    }

    public ErrorDTO(String loginError, String passwordError, String emailError) {
        this.loginError = loginError;
        this.passwordError = passwordError;
        this.emailError = emailError;
    }

    public String getLoginError() {
        return loginError;
    }

    public void setLoginError(String loginError) {
        this.loginError = loginError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    
}
