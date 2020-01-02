# 𝗙𝘂𝗻 𝗦𝗸𝗶𝗹𝗹𝘀™ 🧩


<p align=center><img src="https://cutt.ly/Ueul1gR" width="620"></p>

<p align="center">
  <img
       src="https://camo.githubusercontent.com/a3469255f3fcdead1593919251ab6f438744e9be/68747470733a2f2f63692e6170707665796f722e636f6d2f6170692f70726f6a656374732f7374617475732f346f3338706c743078626f31756263382f6272616e63682f6d61737465723f7376673d74727565">
  
  <img src= "https://img.shields.io/badge/python-v3.7-blue">
  <br/>
  <img src= "https://img.shields.io/badge/status-stable-brightgreen">
 
  <img src="https://img.shields.io/badge/license-GPL-blue">
  <img src="https://img.shields.io/badge/Made%20with-Python-1f425f.svg">
  <img src="https://readthedocs.org/projects/ansicolortags/badge/?version=latest">
</p>

***


<p align='justify'>
𝗙𝘂𝗻 𝗦𝗸𝗶𝗹𝗹𝘀™ corresponds to the final project of the CE-3104 course on languages, interpreters and compilers. It consists of a device that helps children in their <b>gross motor therapy</b>. For this, a <b> game suite </b> has been developed that encourages the child to perform stimulation exercises while playing.</br>

To connect the real world with the software, we have implemented the microsoft <b>kinect</b>, from which we can read and interpret the signals and thus detect the movements and reflect them on the screen. The games seek to stimulate the basic movements of children: Foot movement, jumping, hitting and reaching.</br></p>

<table>
  <tr>
    <td>
      <img src="https://github.com/estalvgs1999/CE3104-Fun-Skills/blob/master/Games/gameSuite/img/Game%20-%20icons/balloonIcon.png">
    </td>
    <td>
      <img src="https://github.com/estalvgs1999/CE3104-Fun-Skills/blob/master/Games/gameSuite/img/Game%20-%20icons/flagIcon.png">
    </td>
    <td>
      <img src="https://github.com/estalvgs1999/CE3104-Fun-Skills/blob/master/Games/gameSuite/img/Game%20-%20icons/objectiveIcon.png">
    </td>
    <td>
      <img src="https://github.com/estalvgs1999/CE3104-Fun-Skills/blob/master/Games/gameSuite/img/Game%20-%20icons/spiderIcon.png">
    </td>
  </tr>
</table>

<p align='justify'>
In addition, a <b>command language</b> has been created to configure the game.This language is interpreted by a "small compiler" that we have developed with the knowledge acquired throughout the course. <i>Python</i> and its <i>PLY</i> library have been used to make the compiler.
</p>

### Fun Skills Game Suite
<table>
  <tr>
    <td>
      <img src="https://res.cloudinary.com/estalvgs1999/image/upload/v1575320708/CE3104/Fun%20Skills/Captura_de_pantalla_de_2019-12-02_12-38-15_cdi8h2.png" width="400">
    </td>
    <td>
      <img src="https://res.cloudinary.com/estalvgs1999/image/upload/v1575320708/CE3104/Fun%20Skills/Captura_de_pantalla_de_2019-12-02_12-42-03_kyz5re.png" width="400">
    </td>
  </tr>
</table>


---
### Fun Skills Playground

<p align='justify'>
A small IDE to program your games! The team developed a programming environment in which the games for the suite can be programmed. For this, a new interpreter was developed, capable of recognizing the syntax of our command language, using the python libraries PLY and Qscintilla.
You can find the source code of this IDE in the Compiler folder.
</p>

<table>
  <tr>
    <td>
      <img src="https://res.cloudinary.com/estalvgs1999/image/upload/v1575325244/CE3104/Fun%20Skills/demo_lfmpjq.gif" width="300">
    </td>
    <td>
      <img src="https://res.cloudinary.com/estalvgs1999/image/upload/v1575326273/CE3104/Fun%20Skills/Captura_de_pantalla_de_2019-12-02_15-44-38_vpqu3g.png" width="300">
    </td>
    <td>
      <img src="https://res.cloudinary.com/estalvgs1999/image/upload/v1575326263/CE3104/Fun%20Skills/Captura_de_pantalla_de_2019-12-02_15-45-31_izodyu.png" width="300">
    </td>
  </tr>
</table>

---
## Getting Started 🚀

<p align=justify>Prerequisites:You must have <a href="https://git-scm.com/book/es/v2/Inicio---Sobre-el-Control-de-Versiones-Instalaci%C3%B3n-de-Git">Git</a>
 installed on your console.</p>

1. On **GitHub**, go to the main page of the [repository](https://github.com/estalvgs1999/CE3104-Fun-Skills).
2. Under the name of the repository, click **Clone or download**.
3. In the Clone with HTTPs section, click to copy the repository cloning URL.
4. Open **Git Bash**.
5. Change the current working directory to the location where you want the cloned directory to be made.
6. Type 'git clone', and then paste the URL that you copied in _Step 2_.

   ```$ git clone https://github.com/estalvgs1999/CE3104-Fun-Skills```

7. Press Enter. Your local clone will be created for [CE3104-Fun-Skills](https://github.com/estalvgs1999/CE3104-Fun-Skills).
8. Now you can access the examples contained in this repository.

### Prerequisites 📋

_To run this program you must have the following dependencies installed_

```
+ Processing 3
+ Python 3.6

Python dependencies:

$pip install ply==3.11
$pip installPyQt5==5.13.2
$pip installPyQt5-sip==12.7.0
$pip installQScintilla==2.11.3
```

## Built With

For the development of this project we use the following resources

<table>
  <tr>
    <td>
      <p align=center><img src="https://pypi.org/static/images/logo-small.6eef541e.svg" width="100"></p>
    </td>
    <td>
      <p align=center><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPulCp1_2X95McIbF8PzbWQGzI1r9-eYUZZDfIgxpSLpt4zGoP&s" width="100"></p>
    </td>
    <td>
      <p align=center><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Processing_3_logo.png/600px-Processing_3_logo.png" width="100"></p>
    </td>
    <td>
      <p align=center><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1024px-Python-logo-notext.svg.png" width="100"></p>
    </td>
  </tr>
  
  <tr>
    <td>
      <p align=center><a href="https://www.dabeaz.com/ply/"><b>Python Lex Yacc</b></a>
        </br>The Lexical Compiler Analyzer</p>
    </td>
    <td>
      <p align=center><a href="https://www.qt.io/"><b>PyQt5</b></a>
</br>UI IDE FunSkills Playground</p>
    </td>
    <td>
      <p align=center>
        <a href="https://processing.org/"><b>Processing</b></a>
</br>Graphic Interface Development</p>
    </td>
    <td>
      <p align=center> <a href="https://www.python.org//"><b>Python</b></a>
        </br>Business Logic Development</p>
    </td>
  </tr>
</table>


## Docs 📖

You can find much more about how to use this project in our [documentation section](https://github.com/estalvgs1999/CE3104-Fun-Skills/tree/master/docs)

## Authors 

This project has an excellent development group formed by ITCR computer engineering students

* **Esteban Alvarado** - *Software/Hardware Developer* - [@estalvgs1999](https://github.com/estalvgs1999)
* **Sahid Rojas** - *Software/Hardware Developer* - [@reds98](https://github.com/reds98)
* **Erick Barrantes** - *Software Developer* - [@ErickCR12](https://github.com/ErickCR12)
* **María José Zamora** - *Software Developer* - [@mjosezam](https://github.com/mjosezam)
* **Jessica Espinoza** - *Software Developer* - [@jespinoza1703](https://github.com/jespinoza1703)


<p align="center"> Project developed at the <b>Technological Institute of Costa Rica</b> | 2019 🄯</p>


## Licence 📄

This project is under License (GNU General Public License) - see the file [LICENSE.md](https://github.com/estalvgs1999/CE3104-Fun-Skills/blob/master/LICENSE) for details

---
<p align="center">

  <img src="https://img2.freepng.es/20180420/ubq/kisspng-open-source-software-open-source-model-open-source-5ad9ba90da5134.5431202915242185128942.jpg" width="40"/>
  <img src="https://cutt.ly/ieulNTo" width="50"/>
<img src="https://amin-ahmadi.com/wp-content/uploads/2016/12/Built_with_Qt_RGB_logo_vertical.png" width="40"/>
</p>
