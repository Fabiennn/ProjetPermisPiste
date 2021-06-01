<%--
  Created by IntelliJ IDEA.
  User: loko6
  Date: 01/06/2021
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Acceuil - PolyPisteur</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="<c:url value="/css/home.css"/>" />
    <link rel="stylesheet" href="<c:url value="/css/styles.css"/>" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.3.4/CSSRulePlugin.min.js"></script>
</head>

<body>
<div class="background">
    <video autoplay loop>
        <source src="<c:url value="/bg_video.mp4"/>" type="video/mp4" />
    </video>
</div>
<main>
    <div class="brand">
        <svg width="182" height="193" viewBox="0 0 182 193" fill="none" xmlns="http://www.w3.org/2000/svg">
            <g filter="url(#filter0_b)">
                <path d="M1 110H35V193H32C14.8792 193 1 179.121 1 162V110Z" fill="#00ADEF" />
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M38.0502 110C41.6588 120.631 48.4023 129.977 57.4638 136.741C68.4993 144.979 82.1853 148.8 95.865 147.462C109.545 146.124 122.242 139.723 131.492 129.502C140.742 119.28 145.884 105.968 145.921 92.1482C145.957 78.3289 140.885 64.9889 131.69 54.7181C122.494 44.4473 109.831 37.9785 96.1585 36.5676C82.4861 35.1566 68.78 38.9042 57.7011 47.0827C48.8101 53.6461 42.1202 62.6875 38.4002 73H0.972568C5.61751 50.8726 18.2081 31.2329 36.3488 17.8413C54.6401 4.33849 77.2689 -1.84875 99.8422 0.480748C122.415 2.81025 143.323 13.4903 158.504 30.4474C173.686 47.4046 182.06 69.429 182 92.2447C181.939 115.061 173.449 137.04 158.178 153.915C142.906 170.791 121.943 181.359 99.3577 183.568C76.7724 185.777 54.1766 179.468 35.9571 165.868C17.746 152.274 5.20588 132.364 0.768402 110H38.0502Z"
                      fill="#00ADEF" />
                <path d="M18.5 189V149.5V110" stroke="#E5E5E5" stroke-width="2" stroke-dasharray="15 15" />
                <path d="M17.5137 71.8168C22.189 54.6829 33.0693 39.7882 48.1384 29.893C63.2075 19.9978 81.4436 15.773 99.4673 18.0015C117.491 20.23 134.08 28.7607 146.161 42.0128C158.241 55.2649 164.994 72.3398 165.167 90.0732C165.34 107.807 158.923 124.996 147.103 138.456C135.284 151.917 118.865 160.735 100.888 163.277C82.9105 165.819 64.5949 161.912 49.3349 152.281C34.075 142.65 22.9053 127.947 17.8958 110.898"
                      stroke="#E5E5E5" stroke-width="2" stroke-dasharray="15 15" />
            </g>
            <defs>
                <filter id="filter0_b" x="-10" y="-10.0002" width="202" height="213" filterUnits="userSpaceOnUse"
                        color-interpolation-filters="sRGB">
                    <feFlood flood-opacity="0" result="BackgroundImageFix" />
                    <feGaussianBlur in="BackgroundImage" stdDeviation="5" />
                    <feComposite in2="SourceAlpha" operator="in" result="effect1_backgroundBlur" />
                    <feBlend mode="normal" in="SourceGraphic" in2="effect1_backgroundBlur" result="shape" />
                </filter>
            </defs>
        </svg>
        <p>olyPist</p>
    </div>
    <div class="context">
        <div id="home" class="active">
            <div class="assets">
                <div class="asset-element">
                    <svg width="23" height="23" viewBox="0 0 23 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="11.5" cy="11.5" r="11.5" fill="white" />
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M11.5 0C5.14886 0 0 5.14886 0 11.5C0 17.8511 5.14886 23 11.5 23C17.8511 23 23 17.8511 23 11.5C23 5.14886 17.8511 0 11.5 0ZM16.4847 9.55545C16.5765 9.45054 16.6464 9.32832 16.6902 9.19599C16.7341 9.06367 16.7511 8.92391 16.7401 8.78494C16.7291 8.64597 16.6905 8.51059 16.6265 8.38677C16.5624 8.26295 16.4743 8.15319 16.3672 8.06395C16.2601 7.9747 16.1362 7.90778 16.0029 7.86711C15.8695 7.82644 15.7294 7.81285 15.5907 7.82714C15.4521 7.84142 15.3177 7.8833 15.1954 7.9503C15.0732 8.0173 14.9656 8.10807 14.8789 8.21727L10.3835 13.6108L8.05732 11.2836C7.86014 11.0932 7.59606 10.9878 7.32194 10.9902C7.04783 10.9925 6.78562 11.1025 6.59178 11.2963C6.39794 11.4902 6.288 11.7524 6.28561 12.0265C6.28323 12.3006 6.38861 12.5647 6.57905 12.7619L9.71541 15.8982C9.81813 16.0009 9.94112 16.081 10.0765 16.1335C10.2119 16.186 10.3568 16.2097 10.5019 16.2031C10.647 16.1965 10.7891 16.1598 10.9192 16.0952C11.0492 16.0307 11.1645 15.9397 11.2575 15.8282L16.4847 9.55545Z"
                              fill="#00ADEF" />
                    </svg>
                    <p>Entraineur</p>
                </div>
                <div class="asset-element">
                    <svg width="23" height="23" viewBox="0 0 23 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="11.5" cy="11.5" r="11.5" fill="white" />
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M11.5 0C5.14886 0 0 5.14886 0 11.5C0 17.8511 5.14886 23 11.5 23C17.8511 23 23 17.8511 23 11.5C23 5.14886 17.8511 0 11.5 0ZM16.4847 9.55545C16.5765 9.45054 16.6464 9.32832 16.6902 9.19599C16.7341 9.06367 16.7511 8.92391 16.7401 8.78494C16.7291 8.64597 16.6905 8.51059 16.6265 8.38677C16.5624 8.26295 16.4743 8.15319 16.3672 8.06395C16.2601 7.9747 16.1362 7.90778 16.0029 7.86711C15.8695 7.82644 15.7294 7.81285 15.5907 7.82714C15.4521 7.84142 15.3177 7.8833 15.1954 7.9503C15.0732 8.0173 14.9656 8.10807 14.8789 8.21727L10.3835 13.6108L8.05732 11.2836C7.86014 11.0932 7.59606 10.9878 7.32194 10.9902C7.04783 10.9925 6.78562 11.1025 6.59178 11.2963C6.39794 11.4902 6.288 11.7524 6.28561 12.0265C6.28323 12.3006 6.38861 12.5647 6.57905 12.7619L9.71541 15.8982C9.81813 16.0009 9.94112 16.081 10.0765 16.1335C10.2119 16.186 10.3568 16.2097 10.5019 16.2031C10.647 16.1965 10.7891 16.1598 10.9192 16.0952C11.0492 16.0307 11.1645 15.9397 11.2575 15.8282L16.4847 9.55545Z"
                              fill="#00ADEF" />
                    </svg>
                    <p>Examinateur</p>
                </div>
                <div class="asset-element">
                    <svg width="23" height="23" viewBox="0 0 23 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="11.5" cy="11.5" r="11.5" fill="white" />
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M11.5 0C5.14886 0 0 5.14886 0 11.5C0 17.8511 5.14886 23 11.5 23C17.8511 23 23 17.8511 23 11.5C23 5.14886 17.8511 0 11.5 0ZM16.4847 9.55545C16.5765 9.45054 16.6464 9.32832 16.6902 9.19599C16.7341 9.06367 16.7511 8.92391 16.7401 8.78494C16.7291 8.64597 16.6905 8.51059 16.6265 8.38677C16.5624 8.26295 16.4743 8.15319 16.3672 8.06395C16.2601 7.9747 16.1362 7.90778 16.0029 7.86711C15.8695 7.82644 15.7294 7.81285 15.5907 7.82714C15.4521 7.84142 15.3177 7.8833 15.1954 7.9503C15.0732 8.0173 14.9656 8.10807 14.8789 8.21727L10.3835 13.6108L8.05732 11.2836C7.86014 11.0932 7.59606 10.9878 7.32194 10.9902C7.04783 10.9925 6.78562 11.1025 6.59178 11.2963C6.39794 11.4902 6.288 11.7524 6.28561 12.0265C6.28323 12.3006 6.38861 12.5647 6.57905 12.7619L9.71541 15.8982C9.81813 16.0009 9.94112 16.081 10.0765 16.1335C10.2119 16.186 10.3568 16.2097 10.5019 16.2031C10.647 16.1965 10.7891 16.1598 10.9192 16.0952C11.0492 16.0307 11.1645 15.9397 11.2575 15.8282L16.4847 9.55545Z"
                              fill="#00ADEF" />
                    </svg>
                    <p>Permis T</p>
                </div>
                <div class="asset-element">
                    <svg width="23" height="23" viewBox="0 0 23 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="11.5" cy="11.5" r="11.5" fill="white" />
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M11.5 0C5.14886 0 0 5.14886 0 11.5C0 17.8511 5.14886 23 11.5 23C17.8511 23 23 17.8511 23 11.5C23 5.14886 17.8511 0 11.5 0ZM16.4847 9.55545C16.5765 9.45054 16.6464 9.32832 16.6902 9.19599C16.7341 9.06367 16.7511 8.92391 16.7401 8.78494C16.7291 8.64597 16.6905 8.51059 16.6265 8.38677C16.5624 8.26295 16.4743 8.15319 16.3672 8.06395C16.2601 7.9747 16.1362 7.90778 16.0029 7.86711C15.8695 7.82644 15.7294 7.81285 15.5907 7.82714C15.4521 7.84142 15.3177 7.8833 15.1954 7.9503C15.0732 8.0173 14.9656 8.10807 14.8789 8.21727L10.3835 13.6108L8.05732 11.2836C7.86014 11.0932 7.59606 10.9878 7.32194 10.9902C7.04783 10.9925 6.78562 11.1025 6.59178 11.2963C6.39794 11.4902 6.288 11.7524 6.28561 12.0265C6.28323 12.3006 6.38861 12.5647 6.57905 12.7619L9.71541 15.8982C9.81813 16.0009 9.94112 16.081 10.0765 16.1335C10.2119 16.186 10.3568 16.2097 10.5019 16.2031C10.647 16.1965 10.7891 16.1598 10.9192 16.0952C11.0492 16.0307 11.1645 15.9397 11.2575 15.8282L16.4847 9.55545Z"
                              fill="#00ADEF" />
                    </svg>
                    <p>Permis TZ</p>
                </div>
            </div>
            <div class="main-action action-sign">
                <button type="button" class="btn-primary" onclick="display('sign-in')">
                    Se connecter
                </button>
                <button type="button" class="btn-secondary" onclick="display('sign-up')">
                    S'inscrire
                </button>
            </div>
        </div>
        <div id="sign-up">
            <form action="" method="POST">
                <div class="form-inputs">
                    <h1 class="title">Inscription</h1>
                    <div class="name">
                        <div class="input-field first-name">
                            <label for="firstname"><span class="animated-label">Prénom</span>&nbsp;</label>
                            <input type="text" name="firstname" id="firstname"/>
                            <p class="input-error"><!-- Ce prénom est invalide -->&nbsp;</p>
                        </div>
                        <div class="input-field last-name">
                            <label for="lastname"><span class="animated-label">Nom</span>&nbsp;</label>
                            <input type="text" name="lastname" id="lastname"/>
                            <p class="input-error"><!-- Ce nom est invalide -->&nbsp;</p>
                        </div>
                    </div>
                    <div class="input-field login-signup">
                        <label for="login-signup"><span class="animated-label">Identifiant</span>&nbsp;</label>
                        <input type="text" name="login" id="login-signup"/>
                        <p class="input-error"><!-- Cet login est invalide -->&nbsp;</p>
                    </div>
                    <div class="input-field password">
                        <label for="password-signup"><span class="animated-label">Mot de passe</span>&nbsp;</label>
                        <input type="password" name="password" id="password-signup" />
                        <p class="input-error"><!-- Ce mot de passe est invalide -->&nbsp;</p>
                    </div>
                    <div class="input-field password-verif">
                        <label for="password-verif"><span class="animated-label">Mot de passe vérification</span>&nbsp;</label>
                        <input type="password" name="password-verif" id="password-verif" />
                        <p class="input-error"><!-- Les mots de passe ne correspondent pas. -->&nbsp;</p>
                    </div>
                </div>
                <div class="main-action">
                    <button type="submit" class="btn-primary" name="sign-up">Inscription</button>
                    <button type="button" class="btn-link" onclick="display('sign-in')">Connexion</button>
                </div>
            </form>
        </div>
        <div id="sign-in">
            <form action="/authentification/getLogin" method="POST">
                <h1 class="title">Connexion</h1>
                <div class="form-inputs form-signin">
                    <div class="input-field login-signin">
                        <label for="login-signin"><span class="animated-label">Identifiant</span>&nbsp;</label>
                        <input type="text" name="login" id="login-signin"/>
                        <p class="input-error"><!-- Cet login est invalide -->&nbsp;</p>
                    </div>
                    <div class="input-field password-signin">
                        <label for="password-signin"><span class="animated-label">Mot de passe</span>&nbsp;</label>
                        <input type="password" name="pwd" id="password-signin" />
                        <p class="input-error"><!-- Ce mot de passe est invalide -->&nbsp;</p>
                    </div>
                </div>
                <div class="main-action">
                    <button type="submit" class="btn-primary" name="sign-in">Connexion</button>
                    <button type="button" class="btn-link" onclick="display('sign-up')">Inscription</button>
                </div>
            </form>
        </div>
    </div>
</main>
<script src="<c:url value="/js/home.js" />"></script>
</body>

</html>