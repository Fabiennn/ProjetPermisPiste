<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<nav class="navbar2">
    <div class="navbar-min">
        <button type="button" onclick="toggleNavBar()"><span class="glyphicon glyphicon-th-list"></span></button>
        <div class="brand-min">brandmin</div>
    </div>
    <div class="navbar2-nav">
        <div class="brand">
            <svg width="40" height="42" viewBox="0 0 182 193" fill="none" xmlns="http://www.w3.org/2000/svg">
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
        <div class="identity">
            <p class="name">Félix</p>
            <div class="identity-sub">
                <p>felix.gffrault@gmail.com</p>
                <p>felix</p>
            </div>
        </div>
        <div class="nav-section">
            <h4 class="nav-section-title">Menu</h4>
            <a href="/authentification/accueil" class="nav-link">
                <span class="nav-icon">
                    <svg width="25" height="23" viewBox="0 0 23 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M22.1079 10.3291L12.6743 0.900391L12.042 0.268067C11.8979 0.124943 11.7031 0.0446167 11.5 0.0446167C11.2969 0.0446167 11.1021 0.124943 10.958 0.268067L0.892069 10.3291C0.74444 10.4762 0.627766 10.6513 0.548935 10.8442C0.470103 11.0371 0.430711 11.2438 0.433085 11.4521C0.44285 12.3115 1.15818 12.9976 2.01756 12.9976H3.05516V20.9492H19.9448V12.9976H21.0044C21.4219 12.9976 21.8149 12.834 22.1103 12.5386C22.2558 12.3936 22.371 12.2212 22.4494 12.0313C22.5278 11.8415 22.5677 11.638 22.5669 11.4326C22.5669 11.0176 22.4033 10.6245 22.1079 10.3291ZM12.8672 19.1914H10.1328V14.2109H12.8672V19.1914ZM18.187 11.2397V19.1914H14.4297V13.625C14.4297 13.0854 13.9927 12.6484 13.4531 12.6484H9.54685C9.0073 12.6484 8.57029 13.0854 8.57029 13.625V19.1914H4.81297V11.2397H2.46922L11.5024 2.21387L12.0664 2.77783L20.5332 11.2397H18.187Z" fill="white"/>
                    </svg>
                </span>
                Accueil
            </a>
            <div class="nav-dropdown">
                <button type="button" class="nav-link drop-title">
                    <span class="nav-icon">
                        <svg width="25" height="23" viewBox="0 0 25 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M24.7225 19.5419L14.4039 1.1157C14.2144 0.777329 13.9381 0.495584 13.6036 0.299479C13.269 0.103375 12.8882 0 12.5003 0C12.1125 0 11.7317 0.103375 11.3971 0.299479C11.0626 0.495584 10.7863 0.777329 10.5968 1.1157L0.278142 19.5419C0.061132 19.9295 -0.0324296 20.374 0.00996116 20.8161C0.0523519 21.2583 0.228675 21.6769 0.515367 22.0162C0.802059 22.3554 1.18546 22.5991 1.61433 22.7146C2.0432 22.8301 2.49712 22.8119 2.9154 22.6626L12.5003 19.2395L22.0852 22.6626C22.3234 22.7481 22.5745 22.792 22.8276 22.7923C23.2075 22.7901 23.5802 22.689 23.909 22.4988C24.2378 22.3087 24.5114 22.0361 24.7027 21.7079C24.894 21.3798 24.9964 21.0074 24.9999 20.6275C25.0034 20.2477 24.9077 19.8735 24.7224 19.5419H24.7225ZM13.8094 16.9268V10.8679C13.8094 10.5207 13.6715 10.1877 13.426 9.94225C13.1805 9.69676 12.8475 9.55884 12.5003 9.55884C12.1532 9.55884 11.8202 9.69676 11.5747 9.94225C11.3292 10.1877 11.1913 10.5207 11.1913 10.8679V16.9268L3.13096 19.8056L12.5003 3.07466L21.8695 19.8055L13.8094 16.9268Z" fill="white"/>
                        </svg>
                    </span>
                    Mission
                </button>
                <div class="drop-downs">
                    <div class="drop-downs-wrapper">
                        <a href="/mission/ajoutMissionAdmin" class="drop-item nav-link"><span class="nav-icon">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M10 1.42857C14.7143 1.42857 18.5714 5.28571 18.5714 10C18.5714 14.7143 14.7143 18.5714 10 18.5714C5.28571 18.5714 1.42857 14.7143 1.42857 10C1.42857 5.28571 5.28571 1.42857 10 1.42857ZM10 0C4.5 0 0 4.5 0 10C0 15.5 4.5 20 10 20C15.5 20 20 15.5 20 10C20 4.5 15.5 0 10 0Z" fill="white"/>
                            <path d="M15.7143 9.28577H10.7143V4.28577H9.28577V9.28577H4.28577V10.7143H9.28577V15.7143H10.7143V10.7143H15.7143V9.28577Z" fill="white"/>
                            </svg>
                        </span> Ajouter une mission</a>
                        <a href="/mission/getAllMissionAdmin" class="drop-item nav-link"><span class="nav-icon">
                            <svg width="22" height="18" viewBox="0 0 22 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M21.3882 0.529412H5.92941C5.81294 0.529412 5.71765 0.624706 5.71765 0.741176V2.22353C5.71765 2.34 5.81294 2.43529 5.92941 2.43529H21.3882C21.5047 2.43529 21.6 2.34 21.6 2.22353V0.741176C21.6 0.624706 21.5047 0.529412 21.3882 0.529412ZM21.3882 8.04706H5.92941C5.81294 8.04706 5.71765 8.14235 5.71765 8.25882V9.74118C5.71765 9.85765 5.81294 9.95294 5.92941 9.95294H21.3882C21.5047 9.95294 21.6 9.85765 21.6 9.74118V8.25882C21.6 8.14235 21.5047 8.04706 21.3882 8.04706ZM21.3882 15.5647H5.92941C5.81294 15.5647 5.71765 15.66 5.71765 15.7765V17.2588C5.71765 17.3753 5.81294 17.4706 5.92941 17.4706H21.3882C21.5047 17.4706 21.6 17.3753 21.6 17.2588V15.7765C21.6 15.66 21.5047 15.5647 21.3882 15.5647ZM0 1.48235C-2.90074e-09 1.67702 0.0383423 1.86978 0.112837 2.04962C0.187333 2.22947 0.296522 2.39289 0.434171 2.53054C0.57182 2.66818 0.735234 2.77737 0.915081 2.85187C1.09493 2.92636 1.28769 2.96471 1.48235 2.96471C1.67702 2.96471 1.86978 2.92636 2.04962 2.85187C2.22947 2.77737 2.39289 2.66818 2.53053 2.53054C2.66818 2.39289 2.77737 2.22947 2.85187 2.04962C2.92636 1.86978 2.96471 1.67702 2.96471 1.48235C2.96471 1.28769 2.92636 1.09493 2.85187 0.915081C2.77737 0.735234 2.66818 0.57182 2.53053 0.434171C2.39289 0.296522 2.22947 0.187332 2.04962 0.112837C1.86978 0.0383421 1.67702 0 1.48235 0C1.28769 0 1.09493 0.0383421 0.915081 0.112837C0.735234 0.187332 0.57182 0.296522 0.434171 0.434171C0.296522 0.57182 0.187333 0.735234 0.112837 0.915081C0.0383423 1.09493 -2.90074e-09 1.28769 0 1.48235V1.48235ZM0 9C-2.90074e-09 9.19467 0.0383423 9.38743 0.112837 9.56727C0.187333 9.74712 0.296522 9.91053 0.434171 10.0482C0.57182 10.1858 0.735234 10.295 0.915081 10.3695C1.09493 10.444 1.28769 10.4824 1.48235 10.4824C1.67702 10.4824 1.86978 10.444 2.04962 10.3695C2.22947 10.295 2.39289 10.1858 2.53053 10.0482C2.66818 9.91053 2.77737 9.74712 2.85187 9.56727C2.92636 9.38743 2.96471 9.19467 2.96471 9C2.96471 8.80533 2.92636 8.61258 2.85187 8.43273C2.77737 8.25288 2.66818 8.08947 2.53053 7.95182C2.39289 7.81417 2.22947 7.70498 2.04962 7.63048C1.86978 7.55599 1.67702 7.51765 1.48235 7.51765C1.28769 7.51765 1.09493 7.55599 0.915081 7.63048C0.735234 7.70498 0.57182 7.81417 0.434171 7.95182C0.296522 8.08947 0.187333 8.25288 0.112837 8.43273C0.0383423 8.61258 -2.90074e-09 8.80533 0 9V9ZM0 16.5176C-2.90074e-09 16.7123 0.0383423 16.9051 0.112837 17.0849C0.187333 17.2648 0.296522 17.4282 0.434171 17.5658C0.57182 17.7035 0.735234 17.8127 0.915081 17.8872C1.09493 17.9617 1.28769 18 1.48235 18C1.67702 18 1.86978 17.9617 2.04962 17.8872C2.22947 17.8127 2.39289 17.7035 2.53053 17.5658C2.66818 17.4282 2.77737 17.2648 2.85187 17.0849C2.92636 16.9051 2.96471 16.7123 2.96471 16.5176C2.96471 16.323 2.92636 16.1302 2.85187 15.9504C2.77737 15.7705 2.66818 15.6071 2.53053 15.4695C2.39289 15.3318 2.22947 15.2226 2.04962 15.1481C1.86978 15.0736 1.67702 15.0353 1.48235 15.0353C1.28769 15.0353 1.09493 15.0736 0.915081 15.1481C0.735234 15.2226 0.57182 15.3318 0.434171 15.4695C0.296522 15.6071 0.187333 15.7705 0.112837 15.9504C0.0383423 16.1302 -2.90074e-09 16.323 0 16.5176V16.5176Z" fill="white"/>
                            </svg>
                        </span> Lister les missions</a>
                    </div>
                </div>
            </div>
            <div class="nav-dropdown">
                <button type="button" class="nav-link drop-title"><span class="nav-icon">
                    <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0)">
                        <path d="M24.3943 8.34886L13.0661 2.09886C12.8928 2.00318 12.698 1.953 12.5 1.953C12.302 1.953 12.1073 2.00318 11.9339 2.09886L0.605781 8.34886C0.422283 8.45009 0.269291 8.59869 0.162746 8.77915C0.0562005 8.95962 0 9.16536 0 9.37493C0 9.5845 0.0562005 9.79024 0.162746 9.97071C0.269291 10.1512 0.422283 10.2998 0.605781 10.401L1.95314 11.1444V16.1319C1.95296 16.5924 2.11568 17.0382 2.41252 17.3903C3.30178 18.4423 6.65725 21.8749 12.5 21.8749C14.0281 21.8811 15.5465 21.6315 16.9922 21.1366V23.4374C16.9922 23.7482 17.1157 24.0463 17.3354 24.2661C17.5552 24.4858 17.8533 24.6093 18.1641 24.6093C18.4749 24.6093 18.773 24.4858 18.9927 24.2661C19.2125 24.0463 19.336 23.7482 19.336 23.4374V20.0644C20.5612 19.3604 21.6602 18.4567 22.5874 17.3904C22.8843 17.0382 23.0471 16.5924 23.0469 16.1318V11.1445L24.3943 10.4011C24.5778 10.2999 24.7307 10.1513 24.8373 9.9708C24.9438 9.79034 25 9.5846 25 9.37503C25 9.16546 24.9438 8.95972 24.8373 8.77925C24.7307 8.59878 24.5778 8.45019 24.3943 8.34895V8.34886ZM12.5 4.46331L21.4024 9.37493L21.3192 9.42083L21.3131 9.42415L18.1641 11.1615L13.0661 8.34895C12.9313 8.27323 12.7828 8.22493 12.6292 8.20685C12.4757 8.18878 12.32 8.20127 12.1713 8.24363C12.0226 8.28598 11.8837 8.35735 11.7627 8.45362C11.6417 8.5499 11.5409 8.66917 11.4662 8.80456C11.3915 8.93996 11.3443 9.08881 11.3274 9.24252C11.3105 9.39623 11.3242 9.55177 11.3676 9.70017C11.4111 9.84857 11.4835 9.9869 11.5807 10.1072C11.6779 10.2275 11.7979 10.3273 11.9339 10.401L15.7383 12.4999L12.5 14.2866L3.68693 9.42425L3.68088 9.42083L3.59777 9.37493L12.5 4.46331ZM12.5 19.5312C7.85559 19.5312 5.14475 16.9491 4.29689 15.9866V12.4374L11.9339 16.651C12.1073 16.7467 12.302 16.7968 12.5 16.7968C12.698 16.7968 12.8928 16.7467 13.0661 16.651L16.9922 14.4849V18.6288C15.5723 19.2336 14.0434 19.5407 12.5 19.5312V19.5312ZM20.7031 15.9866C20.2886 16.4513 19.8308 16.8756 19.336 17.2537V13.1917L20.7031 12.4374V15.9866Z" fill="white"/>
                        </g>
                        <defs>
                        <clipPath id="clip0">
                        <rect width="25" height="25" fill="white"/>
                        </clipPath>
                        </defs>
                        </svg>
                    </span>
                    Apprenants
                </button>
                <div class="drop-downs">
                    <div class="drop-downs-wrapprt">
                        <a href="/apprenant/ajouterApprenant" class="drop-item nav-link">
                            <span class="nav-icon">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10 1.42857C14.7143 1.42857 18.5714 5.28571 18.5714 10C18.5714 14.7143 14.7143 18.5714 10 18.5714C5.28571 18.5714 1.42857 14.7143 1.42857 10C1.42857 5.28571 5.28571 1.42857 10 1.42857ZM10 0C4.5 0 0 4.5 0 10C0 15.5 4.5 20 10 20C15.5 20 20 15.5 20 10C20 4.5 15.5 0 10 0Z" fill="white"/>
                                <path d="M15.7143 9.28577H10.7143V4.28577H9.28577V9.28577H4.28577V10.7143H9.28577V15.7143H10.7143V10.7143H15.7143V9.28577Z" fill="white"/>
                                </svg>
                            </span>
                            Ajouter un apprenant</a>
                        <a href="/apprenant/getAllApprenantAdmin" class="drop-item nav-link"><span class="nav-icon">
                            <svg width="22" height="18" viewBox="0 0 22 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M21.3882 0.529412H5.92941C5.81294 0.529412 5.71765 0.624706 5.71765 0.741176V2.22353C5.71765 2.34 5.81294 2.43529 5.92941 2.43529H21.3882C21.5047 2.43529 21.6 2.34 21.6 2.22353V0.741176C21.6 0.624706 21.5047 0.529412 21.3882 0.529412ZM21.3882 8.04706H5.92941C5.81294 8.04706 5.71765 8.14235 5.71765 8.25882V9.74118C5.71765 9.85765 5.81294 9.95294 5.92941 9.95294H21.3882C21.5047 9.95294 21.6 9.85765 21.6 9.74118V8.25882C21.6 8.14235 21.5047 8.04706 21.3882 8.04706ZM21.3882 15.5647H5.92941C5.81294 15.5647 5.71765 15.66 5.71765 15.7765V17.2588C5.71765 17.3753 5.81294 17.4706 5.92941 17.4706H21.3882C21.5047 17.4706 21.6 17.3753 21.6 17.2588V15.7765C21.6 15.66 21.5047 15.5647 21.3882 15.5647ZM0 1.48235C-2.90074e-09 1.67702 0.0383423 1.86978 0.112837 2.04962C0.187333 2.22947 0.296522 2.39289 0.434171 2.53054C0.57182 2.66818 0.735234 2.77737 0.915081 2.85187C1.09493 2.92636 1.28769 2.96471 1.48235 2.96471C1.67702 2.96471 1.86978 2.92636 2.04962 2.85187C2.22947 2.77737 2.39289 2.66818 2.53053 2.53054C2.66818 2.39289 2.77737 2.22947 2.85187 2.04962C2.92636 1.86978 2.96471 1.67702 2.96471 1.48235C2.96471 1.28769 2.92636 1.09493 2.85187 0.915081C2.77737 0.735234 2.66818 0.57182 2.53053 0.434171C2.39289 0.296522 2.22947 0.187332 2.04962 0.112837C1.86978 0.0383421 1.67702 0 1.48235 0C1.28769 0 1.09493 0.0383421 0.915081 0.112837C0.735234 0.187332 0.57182 0.296522 0.434171 0.434171C0.296522 0.57182 0.187333 0.735234 0.112837 0.915081C0.0383423 1.09493 -2.90074e-09 1.28769 0 1.48235V1.48235ZM0 9C-2.90074e-09 9.19467 0.0383423 9.38743 0.112837 9.56727C0.187333 9.74712 0.296522 9.91053 0.434171 10.0482C0.57182 10.1858 0.735234 10.295 0.915081 10.3695C1.09493 10.444 1.28769 10.4824 1.48235 10.4824C1.67702 10.4824 1.86978 10.444 2.04962 10.3695C2.22947 10.295 2.39289 10.1858 2.53053 10.0482C2.66818 9.91053 2.77737 9.74712 2.85187 9.56727C2.92636 9.38743 2.96471 9.19467 2.96471 9C2.96471 8.80533 2.92636 8.61258 2.85187 8.43273C2.77737 8.25288 2.66818 8.08947 2.53053 7.95182C2.39289 7.81417 2.22947 7.70498 2.04962 7.63048C1.86978 7.55599 1.67702 7.51765 1.48235 7.51765C1.28769 7.51765 1.09493 7.55599 0.915081 7.63048C0.735234 7.70498 0.57182 7.81417 0.434171 7.95182C0.296522 8.08947 0.187333 8.25288 0.112837 8.43273C0.0383423 8.61258 -2.90074e-09 8.80533 0 9V9ZM0 16.5176C-2.90074e-09 16.7123 0.0383423 16.9051 0.112837 17.0849C0.187333 17.2648 0.296522 17.4282 0.434171 17.5658C0.57182 17.7035 0.735234 17.8127 0.915081 17.8872C1.09493 17.9617 1.28769 18 1.48235 18C1.67702 18 1.86978 17.9617 2.04962 17.8872C2.22947 17.8127 2.39289 17.7035 2.53053 17.5658C2.66818 17.4282 2.77737 17.2648 2.85187 17.0849C2.92636 16.9051 2.96471 16.7123 2.96471 16.5176C2.96471 16.323 2.92636 16.1302 2.85187 15.9504C2.77737 15.7705 2.66818 15.6071 2.53053 15.4695C2.39289 15.3318 2.22947 15.2226 2.04962 15.1481C1.86978 15.0736 1.67702 15.0353 1.48235 15.0353C1.28769 15.0353 1.09493 15.0736 0.915081 15.1481C0.735234 15.2226 0.57182 15.3318 0.434171 15.4695C0.296522 15.6071 0.187333 15.7705 0.112837 15.9504C0.0383423 16.1302 -2.90074e-09 16.323 0 16.5176V16.5176Z" fill="white"/>
                            </svg>
                        </span> Lister les apprenants</a>
                    </div>
                </div>
            </div>
            <div class="nav-dropdown">
                <button type="button" class="nav-link drop-title">
                    <span class="nav-icon">
                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M14.2169 21.9499H14.1438C13.8758 21.9337 13.6207 21.8294 13.4181 21.6533C13.2155 21.4771 13.0768 21.2389 13.0235 20.9757L10.9656 10.9906L0.98049 8.93267C0.716822 8.88031 0.477893 8.74216 0.300958 8.53979C0.124024 8.33741 0.0190297 8.08217 0.00234784 7.81387C-0.014334 7.54557 0.0582341 7.27929 0.208737 7.05655C0.359239 6.83381 0.579216 6.66714 0.834366 6.58251L20.3176 0.0921736C20.5363 0.00187268 20.7765 -0.0227598 21.009 0.0212873C21.2415 0.0653345 21.4561 0.176153 21.6266 0.340198C21.7971 0.504242 21.9161 0.714406 21.9691 0.945002C22.0221 1.1756 22.0067 1.41663 21.9249 1.63865L15.4346 21.1218C15.3499 21.3739 15.185 21.5913 14.9651 21.7408C14.7452 21.8903 14.4824 21.9637 14.2169 21.9499ZM5.93653 7.45926L12.2564 8.75002C12.4926 8.79559 12.7101 8.91012 12.8813 9.07917C13.0525 9.24821 13.1698 9.46418 13.2184 9.69982L14.497 16.0197L18.7833 3.17295L5.93653 7.45926Z" fill="white"/>
                        </svg>
                    </span>
                    Actions
                </button>
                <div class="drop-downs">
                    <div class="drop-downs-wrapper">
                        <a href="/apprenant/ajouterApprenant" class="drop-item nav-link"> <span class="nav-icon">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M10 1.42857C14.7143 1.42857 18.5714 5.28571 18.5714 10C18.5714 14.7143 14.7143 18.5714 10 18.5714C5.28571 18.5714 1.42857 14.7143 1.42857 10C1.42857 5.28571 5.28571 1.42857 10 1.42857ZM10 0C4.5 0 0 4.5 0 10C0 15.5 4.5 20 10 20C15.5 20 20 15.5 20 10C20 4.5 15.5 0 10 0Z" fill="white"/>
<path d="M15.7143 9.28577H10.7143V4.28577H9.28577V9.28577H4.28577V10.7143H9.28577V15.7143H10.7143V10.7143H15.7143V9.28577Z" fill="white"/>
</svg>
                        </span> Ajouter une action</a>
                        <a href="/action/getAllActionsAdmin" class="drop-item nav-link">
                            <span class="nav-icon">
                                <svg width="22" height="18" viewBox="0 0 22 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M21.3882 0.529412H5.92941C5.81294 0.529412 5.71765 0.624706 5.71765 0.741176V2.22353C5.71765 2.34 5.81294 2.43529 5.92941 2.43529H21.3882C21.5047 2.43529 21.6 2.34 21.6 2.22353V0.741176C21.6 0.624706 21.5047 0.529412 21.3882 0.529412ZM21.3882 8.04706H5.92941C5.81294 8.04706 5.71765 8.14235 5.71765 8.25882V9.74118C5.71765 9.85765 5.81294 9.95294 5.92941 9.95294H21.3882C21.5047 9.95294 21.6 9.85765 21.6 9.74118V8.25882C21.6 8.14235 21.5047 8.04706 21.3882 8.04706ZM21.3882 15.5647H5.92941C5.81294 15.5647 5.71765 15.66 5.71765 15.7765V17.2588C5.71765 17.3753 5.81294 17.4706 5.92941 17.4706H21.3882C21.5047 17.4706 21.6 17.3753 21.6 17.2588V15.7765C21.6 15.66 21.5047 15.5647 21.3882 15.5647ZM0 1.48235C-2.90074e-09 1.67702 0.0383423 1.86978 0.112837 2.04962C0.187333 2.22947 0.296522 2.39289 0.434171 2.53054C0.57182 2.66818 0.735234 2.77737 0.915081 2.85187C1.09493 2.92636 1.28769 2.96471 1.48235 2.96471C1.67702 2.96471 1.86978 2.92636 2.04962 2.85187C2.22947 2.77737 2.39289 2.66818 2.53053 2.53054C2.66818 2.39289 2.77737 2.22947 2.85187 2.04962C2.92636 1.86978 2.96471 1.67702 2.96471 1.48235C2.96471 1.28769 2.92636 1.09493 2.85187 0.915081C2.77737 0.735234 2.66818 0.57182 2.53053 0.434171C2.39289 0.296522 2.22947 0.187332 2.04962 0.112837C1.86978 0.0383421 1.67702 0 1.48235 0C1.28769 0 1.09493 0.0383421 0.915081 0.112837C0.735234 0.187332 0.57182 0.296522 0.434171 0.434171C0.296522 0.57182 0.187333 0.735234 0.112837 0.915081C0.0383423 1.09493 -2.90074e-09 1.28769 0 1.48235V1.48235ZM0 9C-2.90074e-09 9.19467 0.0383423 9.38743 0.112837 9.56727C0.187333 9.74712 0.296522 9.91053 0.434171 10.0482C0.57182 10.1858 0.735234 10.295 0.915081 10.3695C1.09493 10.444 1.28769 10.4824 1.48235 10.4824C1.67702 10.4824 1.86978 10.444 2.04962 10.3695C2.22947 10.295 2.39289 10.1858 2.53053 10.0482C2.66818 9.91053 2.77737 9.74712 2.85187 9.56727C2.92636 9.38743 2.96471 9.19467 2.96471 9C2.96471 8.80533 2.92636 8.61258 2.85187 8.43273C2.77737 8.25288 2.66818 8.08947 2.53053 7.95182C2.39289 7.81417 2.22947 7.70498 2.04962 7.63048C1.86978 7.55599 1.67702 7.51765 1.48235 7.51765C1.28769 7.51765 1.09493 7.55599 0.915081 7.63048C0.735234 7.70498 0.57182 7.81417 0.434171 7.95182C0.296522 8.08947 0.187333 8.25288 0.112837 8.43273C0.0383423 8.61258 -2.90074e-09 8.80533 0 9V9ZM0 16.5176C-2.90074e-09 16.7123 0.0383423 16.9051 0.112837 17.0849C0.187333 17.2648 0.296522 17.4282 0.434171 17.5658C0.57182 17.7035 0.735234 17.8127 0.915081 17.8872C1.09493 17.9617 1.28769 18 1.48235 18C1.67702 18 1.86978 17.9617 2.04962 17.8872C2.22947 17.8127 2.39289 17.7035 2.53053 17.5658C2.66818 17.4282 2.77737 17.2648 2.85187 17.0849C2.92636 16.9051 2.96471 16.7123 2.96471 16.5176C2.96471 16.323 2.92636 16.1302 2.85187 15.9504C2.77737 15.7705 2.66818 15.6071 2.53053 15.4695C2.39289 15.3318 2.22947 15.2226 2.04962 15.1481C1.86978 15.0736 1.67702 15.0353 1.48235 15.0353C1.28769 15.0353 1.09493 15.0736 0.915081 15.1481C0.735234 15.2226 0.57182 15.3318 0.434171 15.4695C0.296522 15.6071 0.187333 15.7705 0.112837 15.9504C0.0383423 16.1302 -2.90074e-09 16.323 0 16.5176V16.5176Z" fill="white"/>
                                </svg>
                            </span> Lister les actions</a>
                    </div>
                </div>
                <div class="search-bar">
                    <form method="post" action="/apprenant/getApprenantByName" onsubmit="return teste()">
                        <input type="text" name="nom" value="" id="nom" class="form-control" min="0">
                        <button type="submit" class="btn btn-default btn-primary"><span class="glyphicon glyphicon-ok"></span>
                            Rechercher
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</nav>
<%--<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/authentification/accueil" style="color: chartreuse">Permis Piste</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/authentification/accueil"> <span class="glyphicon glyphicon-home"></span> Accueil</a></li>
            <c:if test="${sessionScope.id == null }">
            <li class="dropdown">
                <a class="nav navbar-nav navbar-right" href="/authentification/accueil">
                    <span class="glyphicon glyphicon-user"></span>
                    Se Connecter
                    <span class="caret"></span>
                </a>
                </c:if>
            </li>
            <c:if test="${sessionScope.id > 0  }">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-oil"></span>
                        Missions
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/mission/ajoutMissionAdmin"> <span class="glyphicon glyphicon-plus"></span> Ajouter une mission</a>
                        </li>
                        <li><a href="/mission/getAllMissionAdmin"><span class="glyphicon glyphicon-th-list"></span> Lister
                            les missions</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-user"></span>
                        Apprenants
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/apprenant/ajouterApprenant"> <span class="glyphicon glyphicon-plus"></span> Ajouter un apprenant</a>
                        </li>
                        <li><a href="/apprenant/getAllApprenantAdmin"><span class="glyphicon glyphicon-th-list"></span> Lister
                            les apprenants</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-leaf"></span>
                        Actions
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/apprenant/ajouterApprenant"> <span class="glyphicon glyphicon-plus"></span> Ajouter une action</a>
                        </li>
                        <li><a href="/action/getAllActionsAdmin"><span class="glyphicon glyphicon-th-list"></span> Lister
                            les actions</a>
                        </li>
                    </ul>
                </li>


            <form method="post" action="/apprenant/getApprenantByName" onsubmit="return teste()">

                <div class="nav navbar-nav">
                    <INPUT type="text" name="nom" value="" id="nom" class="form-control" min="0">
                    <button type="submit" class="btn btn-default btn-primary"><span class="glyphicon glyphicon-ok"></span>
                        Rechercher
                    </button>
                </div></form>


                <li><a href="/authentification/logout"><span class="glyphicon glyphicon-log-out"></span> Quitter</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.role.equals('apprenant')}">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-user"></span>
                        TA MERE
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/adherent/ajout"> <span class="glyphicon glyphicon-plus"></span> TA RACE</a>
                        </li>
                        <li><a href="/adherent/getAdherents"><span class="glyphicon glyphicon-th-list"></span> TES UN APPRENANT</a>
                        </li>
                    </ul>
                </li>
            </c:if>

        </ul>
    </div>
</nav>--%>
