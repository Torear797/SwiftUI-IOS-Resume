<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
<div align="center">

![GitHub top language](https://img.shields.io/github/languages/top/Torear797/SwiftUI-IOS-Resume?color=orange)
[![Swift](https://img.shields.io/badge/Swift-5.8-orange?style=flat)](https://img.shields.io/badge/Swift-5.8-Orange?style=flat)
![ios-image](https://img.shields.io/badge/iOS-15.0+-blue.svg?style=flat)
[![Platforms](https://img.shields.io/badge/Platforms-iOS-yellowgreen?style=flat)](https://img.shields.io/badge/Platforms-iOS-Green?style=flat)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat)
</div>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Torear797/SwiftUI-IOS-Resume">
    <img src="Common/Resources/Assets.xcassets/AppIcon.appiconset/appstore.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">SwiftUI IOS Resume</h3>

  <p align="center">
    SwiftUI IOS Resume - это тестовое задание для ios-разработчика на SwiftUI. Приложение имеет простой и понятный интерфейс, который позволяет быстро ознакомиться с основными возможностями SwiftUI и реализовать различные анимации и переходы между экранами.
    <br />
    <a href="https://github.com/Torear797/SwiftUI-IOS-Resume/issues">Сообщить об ошибке</a>
  </p>
</div>

<p align="center">
<img src= "https://github.com/Torear797/SwiftUI-IOS-Resume/assets/48101267/f5feb9cf-1a56-4baf-aafa-a94e72715495" width="300" >
<img src= "https://github.com/Torear797/SwiftUI-IOS-Resume/assets/48101267/717b5d29-6e19-4e83-a3eb-31670ccd4226" width="300" >
<img src= "https://github.com/Torear797/SwiftUI-IOS-Resume/assets/48101267/6dde1cbd-f78f-4568-99d5-f0396940c4be" width="300" >
</p>

<!-- ABOUT THE PROJECT -->
## О Проекте

Приложение "Resume" состоит из следующих экранов:

- [x] Фильмы
- [x] Детальная информация о фильме 
- [x] Каталог
- [x] Информация о категории
- [x] Детальная информация об устройстве
- [x] Магазин
- [x] Профиль

## Mock-Server

Все получаемые данные в приложении загружаются в формате JSON. В качестве Mock-Server используется репозиторий: https://github.com/Torear797/api

## Требования

- iOS 15.0+
- Xcode 14.0+


## Библиотеки

- [x] Alamofire
- [x] Kingfisher
- [x] Swinject


<!-- Фильмы -->

## Экран "Фильмы"

Представляет из себя простой список фильмов. При нажатии на фильм, открывается детальная информация о фильме, с помощью "Hero Animation".

<p align="center">
<img src= "https://github.com/Torear797/SwiftUI-IOS-Resume/assets/48101267/f5feb9cf-1a56-4baf-aafa-a94e72715495" width="300" >
</p>

<p align="right">(<a href="#readme-top">вернуться к началу</a>)</p>

<!-- Экран "Детальная информация о фильме" -->

## Экран "Детальная информация о фильме"

Вывод оригинального изображения и описания фильма. Используется анимация аналогичная App Store.

<p align="center">
<img src= "https://github.com/Torear797/SwiftUI-IOS-Resume/assets/48101267/717b5d29-6e19-4e83-a3eb-31670ccd4226" width="300" >
</p>

<p align="right">(<a href="#readme-top">вернуться к началу</a>)</p>

<!-- Каталог -->

## Экран "Каталог"

Отображает список категорий в виде устройств Apple. При нажатии на категорию происходит переход на экран "Информация о категории".
Также в NavigationBar присутствует кнопка для открытие экрана "Профиль".

<p align="center">
<img src= "https://github.com/Torear797/SwiftUI-IOS-Resume/assets/48101267/6942c062-4096-4340-be15-a519169c143e" width="300" >
</p>

<p align="right">(<a href="#readme-top">вернуться к началу</a>)</p>

<!-- Информация о категории -->

## Экран "Информация о категории"

Отображает список устройств входящих в данную категорию. При нажатии на устройство, происходит переход на экран "Детальная информация об устройстве".

<p align="center">
<img src= "https://github.com/Torear797/SwiftUI-IOS-Resume/assets/48101267/b35904cb-47df-4e1d-8f2b-0bcac9b8e545" width="300" >
</p>

<p align="right">(<a href="#readme-top">вернуться к началу</a>)</p>

<!-- Детальная информация об устройстве -->

## Экран "Детальная информация об устройстве"

Отображает изображение устройства и текстовое описание. Используется Parallax анимация.

<p align="center">
<img src= "https://github.com/Torear797/SwiftUI-IOS-Resume/assets/48101267/3451bc5f-e2b2-42f7-8b36-a249c715a14b" width="300" >
</p>

<p align="right">(<a href="#readme-top">вернуться к началу</a>)</p>

<!-- Магазин -->

## Экран "Магазин"

Отображает список устройств Apple, разбитый по категориям. Имеется возможность поиска по названию и идентификатору устройства.
При нажатии на устройство открывается экран "Детальная информация об устройстве" в виде карточки.
В NavigationBar присутствует кнопка для открытие экрана "Профиль".
При нажатии на кнопку "Купить" - происходит списание виртуальной валюты. Все изменения сохраняются в памяти устройства.

В случае, если средств не достаточно будет выведено соответствующее уведомление.

<p align="center">
<img src= "https://github.com/Torear797/SwiftUI-IOS-Resume/assets/48101267/6dde1cbd-f78f-4568-99d5-f0396940c4be" width="300" >
<img src= "https://github.com/Torear797/SwiftUI-IOS-Resume/assets/48101267/d61252df-d78c-46fe-badc-42f13ce7f663" width="300" >
</p>

<p align="right">(<a href="#readme-top">вернуться к началу</a>)</p>

<!-- Профиль -->

## Экран "Профиль"

Открывается в виде карточки. Выводит базовую информацию о пользователе, а также имеет переключатель для изменения текущего баланса.
Измененный баланс сохраняется в памяти устройства.

<p align="center">
<img src= "https://github.com/Torear797/SwiftUI-IOS-Resume/assets/48101267/8c1e2536-f206-4cce-9e70-8432939d114b" width="300" >
</p>

<p align="right">(<a href="#readme-top">вернуться к началу</a>)</p>
