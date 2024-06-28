# 🌱RE+ECO (팀명: RE+ECO)

## 1. ✨ 서비스 소개
* 서비스명 : 공공데이터를 활용한 지도 API 기반 분리수거함 위치 제공 및 교육자료 서비스
* 서비스 설명:
* 분리수거율을 올리기 위해 수거함 위치 데이터를 가지고 사용자들에게 알려주고자 함.
* 또, 교육 자료로 활용할 수 있도록 분리배출 방법을 이미지와 퀴즈 형식으로 안내함.

## 프로젝트 기간
2024.05.00 ~ 2024.06.25

## . 👍 주요 기능
* 수거함 데이터의 위치 제공
* 선택한 마커를 도착 지점으로 길찾기 기능
* 퀴즈 제공 후 정답 확인 기능


## . 기술스택
<table>
  <tr>
    <th>구분</th>
    <th>내용</th>
  </tr>
   <tr>
    <td>시용 언어</td>
    <td>
      <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
      <img src="https://img.shields.io/badge/HTML-E34F26?style=for-the-badge&logo=html5&logoColor=white">
      <img src="https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=css3&logoColor=white">
    </td>
  </tr>
   <tr>
    <td>Data & Server</td>
    <td>
      <img src="https://img.shields.io/badge/Apache Tomcat 9.0-D22128?style=for-the-badge&logo=Apache Tomcat&logoColor=white"/> 
      <img src="https://img.shields.io/badge/heidi sql-83B81A?style=for-the-badge">
    </td>
  </tr>
   <tr>
    <td>API & Library</td>
    <td>
      <img src="https://img.shields.io/badge/Kakao Map Api-007CE2?style=for-the-badge&logo=KaKao Map Api&logoColor=white">
      <img src="https://img.shields.io/badge/My Batis-191A1B?style=for-the-badge">
    </td>
  </tr>
   <tr>
    <td>IDE</td>
    <td>
      <img src="https://img.shields.io/badge/VSCode-007ACC?style=for-the-badge&logo=VisualStudioCode&logoColor=white"/>
      <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"/> 
    </td>
  </tr>
   <tr>
    <td>Etc.</td>
    <td>
      <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"/>
    </td>
  </tr>
</table>

## 시스템 아키텍쳐
![image](https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/cce9961a-aed9-4a1f-b3b8-bac39ecbce0b)



## 유스케이스
![image](https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/ce440ca7-e490-4579-b5cd-6660ab689cc8)


## 서비스 흐름도
![image](https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/b2eecc0d-959e-4bbf-a50b-814eb374f2b7)


## ER-D
![image](https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/053c0db4-ab88-483a-b25f-0dfb14e837f4)


## 화면 구성
* 홈
  ![image](https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/1f3fab31-bff9-4105-8db4-93314873d3d5)
  ![image](https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/525191a1-244f-4f1f-839b-ff42aedd584f)
  ![image](https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/16910c83-eb03-4cdd-9410-fb841a12de01)

* 지도
<h4>지도 메뉴 선택 시 처음 보이는 화면</h4>
 <img src="https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/62f491e7-836b-419b-8a9c-4001d7ac8b10">
<h4>사용자가 사용자 현재 위치를 검색했을 때 지도의 중심 좌표가 현재 위치로 변하는 것을 확인할 수 있는 화면</h4>
 <img src="https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/7953e474-1c86-4d88-954d-0285f4bc7537">
<h4>원하는 수거함의 메뉴를 선택하고 원하는 곳의 마커를 선택 시, 해당하는 주소 데이터와 길찾기가 나타나는 화면</h4>
 <img src="https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/2ffbb807-5ae3-4f37-a95f-3fa6dd54d1c8">
<h4>길찾기를 선택했을 때 선택한 마커의 주소가 도착 지점으로 설정된 것을 확인할 수 있는 화면</h4>
 <img src="https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/fdb81d49-3696-4bb3-8ef0-c200ed472242">

* 재질별 분리배출 방법
 ![image](https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/9d0407cf-e0a8-4878-b72a-d47d812fb94a)
 ![image](https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/b1de4bde-7ccd-4bbc-836f-18e26c078497)


* 품목별 분리배출 방법
  ![image](https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/30a8d5eb-2b10-4318-b16b-232aabc16ae0)
  ![image](https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/f7340c8b-c508-4aaf-bb7d-0d9a4e235395)

* 퀴즈


## 팀원 역할
![image](https://github.com/2024-SMHRD-SW-DataDesign-1/recycle/assets/109200207/093b4476-c7e5-414d-911e-293a693bc933)


## 트러블 슈팅




