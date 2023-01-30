## Terraform을 활용한 AWS Infra 구축 & Terraform Code
### Network 구성
#### VPC & IGW 생성
![image](https://user-images.githubusercontent.com/110655823/215526165-aeaca2d3-19fa-45c6-9758-210e1674ab96.png)

#### Subnet 생성
![image](https://user-images.githubusercontent.com/110655823/215526739-2d122bfe-88ea-481b-a155-2d3a8db0f96c.png)

#### RTB 생성 및 연결
![image](https://user-images.githubusercontent.com/110655823/215526973-47b21801-2a1b-4343-ad55-127378443391.png)

</br>

### Golden Images
#### 이미지용 인스턴스 생성
![image](https://user-images.githubusercontent.com/110655823/215527360-cf8e6f54-35b4-40d6-acb3-48bae3094255.png)

#### DB 생성
![image](https://user-images.githubusercontent.com/110655823/215527636-300c4cb7-36d6-4b7b-8acc-97ee5796f1bb.png)

#### WEB/WAS/DB 연결
![image](https://user-images.githubusercontent.com/110655823/215527810-60a37ed3-f4c0-409d-b2d0-66d51c332c8a.png)

#### AMI 생성
![image](https://user-images.githubusercontent.com/110655823/215527916-96d55ec0-fe29-442a-adc6-b2e3c1a5e2b8.png)

</br>

### Load Balancer
#### AutoScaling - WEB/WAS 시작구성의 Userdata 생성
![image](https://user-images.githubusercontent.com/110655823/215529582-2e5969a6-524d-43db-88b2-93c1d935a091.png)

#### AutoScaling - WAS 시작구성 생성
![image](https://user-images.githubusercontent.com/110655823/215529836-a2c8ac20-4c6c-4f20-bf22-94f5d42c7ed9.png)

#### AutoScaling - WAS Autoscaling Group 생성
![image](https://user-images.githubusercontent.com/110655823/215530060-f517b3a1-2b83-4d46-9c93-643063294cfd.png)

#### LoadBalance - NLB 생성
![image](https://user-images.githubusercontent.com/110655823/215530393-4e30a07a-a16b-4a10-9f28-9f4b35499a6a.png)

#### LoadBalancer - Target Group 생성
![image](https://user-images.githubusercontent.com/110655823/215530592-ed3766e3-7478-47b1-b70a-efdb7b379729.png)

#### LoadBalancer - NLB Listener 생성
![image](https://user-images.githubusercontent.com/110655823/215530737-1447eeca-a43d-48d6-b38a-149fea9a32ef.png)

#### Auto Scaling| WEB 시작구성
![image](https://user-images.githubusercontent.com/110655823/215530976-745f3ba7-70f1-41cd-8209-28630bc2ddac.png)

#### AutoScaling - WEB Autoscaling Group 생성
![image](https://user-images.githubusercontent.com/110655823/215531100-ca493303-5d29-4281-90fe-39f894599ecd.png)

#### LoadBalancer - ALB 생성
![image](https://user-images.githubusercontent.com/110655823/215531100-ca493303-5d29-4281-90fe-39f894599ecd.png)

#### LoadBalancer -  ALB Listener생성
![image](https://user-images.githubusercontent.com/110655823/215545279-ea529d60-61d0-4e05-85a5-09b4b33f4e68.png)

#### LoadBalancer - Target Group, Listener Rule 생성
![image](https://user-images.githubusercontent.com/110655823/215545394-4ca7a90d-07e5-4711-bcab-aca2fee752ce.png)

#### LoadBalancer - ALB DNS 접속
![image](https://user-images.githubusercontent.com/110655823/215545439-ed3f1d94-bdc2-4c66-9533-3d5b7188a4e2.png)

</br>

### DNS
#### Route53 - 호스팅 영역 생성
![image](https://user-images.githubusercontent.com/110655823/215545631-a13f55fd-115a-43cc-a5d1-956cfe62ead1.png)

#### Route53 - 레코드 등록
![image](https://user-images.githubusercontent.com/110655823/215545791-e803bdaf-b2b5-4930-b707-10818ec824b3.png)

#### Route53 - DNS 확인
![image](https://user-images.githubusercontent.com/110655823/215545931-28ba749c-0058-4ded-8f74-35977f329108.png)

</br>

### Certification
#### ACM - 인증서 생성
![image](https://user-images.githubusercontent.com/110655823/215546179-973ebe6d-bc23-4145-b0e1-f6509197a36d.png)

#### ACM - 인증서 검증
![image](https://user-images.githubusercontent.com/110655823/215546271-cb2cb25d-de32-4a1d-8536-5bb30a8441bc.png)

#### ACM - 인증서 확인
![image](https://user-images.githubusercontent.com/110655823/215546384-67ff4b5a-b207-4ee2-9ec8-1447926b7445.png)

#### LoadBalancer - ALB 리스너 변경
![image](https://user-images.githubusercontent.com/110655823/215546565-f3b37adf-4e3b-4c64-ba26-a21367282dc9.png)
