package com.epul.oeuvre.domains;

public class LoginParam {
    private String nomUtil;
    private String motPasse;
    private boolean admin;

    public String getMotPasse() {
        return motPasse;
    }

    public void setNomUtil(String nomUtil) {
        this.nomUtil = nomUtil;
    }

    public void setMotPasse(String motPasse) {
        this.motPasse = motPasse;
    }

    public void setPermission(boolean admin) { this.admin = admin; }

    public boolean getPermission() { return this.admin; }

    public String getNomUtil() {
        return nomUtil;
    }

}




