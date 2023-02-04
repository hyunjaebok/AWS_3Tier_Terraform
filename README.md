# Terraform을 활용한 AWS Infra 구축
     Terraform 하여, AWS Infra 구축
     WEB-WAS-DB를 Mod_jk로 연동하여, 3-Tier 웹 서비스 운영
     
## 📆 진행 기간
- 2022.10.17 ~ 2022.10.21 (총 5)

</br>

## 🛠 사용 기술
#### CSP
<img src="https://img.shields.io/badge/Amazon AWS-232F3E?style=flat-square&logo=Amazon AWS&logoColor=white"> <!--AWS-->
#### OS
<img src="https://img.shields.io/badge/Amazon Linux 2-232F3E?style=flat-square&logo=Amazon AWS&logoColor=white"> <!--amazon linux-->
#### Database
<img src="https://img.shields.io/badge/mysql-4479A1?style=flat-square&logo=mysql&logoColor=white"> <!--Mysql-->
#### IaC
<img src="https://img.shields.io/badge/Terraform-7B42BC?style=flat-square&logo=Terraform&logoColor=white"> <!--Terraform-->
#### IDE
<img src="https://img.shields.io/badge/AWS Cloud9-007ACC?style=flat-square&logo=AWS Cloud9&logoColor=white"> <!--AWS Cloud9-->
#### Framework
<img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"> <!--Spring-->
#### Team Collabolation Tool
<img src="https://img.shields.io/badge/Notion-000000?style=flat-square&logo=Notion&logoColor=white"> <!--Notion-->
### Drawing Tool
<img src="https://img.shields.io/badge/Drawio-000000?style=flat-square&logo=Drawio&logoColor=white"> <!--Draw.io-->

</br>

## 💁‍♂️ 담당 업무
- version.tf을 작성하여, Terraform의 버전과 공급자를 구성
- vpc.tf을 작성하여, VPC을 생성
    - Internet_gateway을 구성
    - subnet.tf을 작성하여, Public/Private Subnet을 구성
    - subnet 생성 후 routing_table 구성하고 연동
- variable.tf을 작성하여, 변수를 활용
- sg.tf을 작성하여, 보안그룹을 생성
    - WEB/WAS/DB 보안그룹 구성
- ec2.tf를 작성하여, Instance을 생성
    - WEB/WAS Instance을 구성
- db.tf를 작성하여, RDS를 생성
- WEB/WAS/DB를 Mod_jk로 연동하여, 3-Tier 구성
- ec2.tf에 추가 작성하여, WEB과 WAS의 AMI를 생성
- nlb.tf를 작성하여, Network Load Balancer를 생성
    - 시작구성, Autoscaling Group, 보안그룹, 대상그룹, 리스너 정의를 구성
- alb.tf를 작성하여, Application Load Balancer를 생성
    - 시작구성, Autoscaling Group, 보안그룹, 대상그룹, 리스너 정의를 구성
- route53.tf를 작성하여, 호스팅 영역을 생성
    - 도메인을 레코드에 등록
    - ACM 인증서을 생성
    - 기존 alb 리스너를 443port로 변경
    
</br>

## 📖 상세 내용 
### Infra Architecture
![image](https://user-images.githubusercontent.com/110655823/215509545-27108752-71c4-440a-9c69-ab5f035438e9.png)
> - 관리자는 클라우드 기반 IDE인 Cloud9을 사용해 Terraform으로 AWS Infra를 구축
> - 고객은 Route53에 등록된 도메인을 통해 3-Tier 웹 서비스 이용
> - ACM을 구축하여, HTTPS Protocol를 사용하여 보안을 강화
> - RDS 이중화 구성

### Security Group
![image](https://user-images.githubusercontent.com/110655823/215509978-f7599624-3857-4e42-9af7-bcfd9709ffae.png)

### [- Terraform](https://github.com/hyunjaebok/AWS_3Tier_Terraform_Project/tree/main/Terraform)

</br>

## 🔗 구축 과정
### [- Notion Link](https://awesome-bottle-5fa.notion.site/Terraform-AWS-Infra-a55221f85f6043cda23e13a3ad58096a)

</br>

---

### [👈 Go back](https://github.com/hyunjaebok)
