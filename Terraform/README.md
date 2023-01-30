## 외부 인프라

### CloudFront 구축
![image](https://user-images.githubusercontent.com/110655823/215499638-61a3a45f-7d66-48ac-982b-399444bbe0e7.png)
> - 데이터 캐싱을 통해 고객에서 정적 및 동적 콘텐츠를 빠르고 안정적으로 배포

</br>

### Route53, ACM 구축
![image](https://user-images.githubusercontent.com/110655823/215500133-c43b843e-8570-4c4a-af23-fb9b0dca8fe8.png)
> - DNS를 제공하여 고객들이 웹 서비스를 쉽고 빠르게 이용
> - HTTPS Protocol를 사용하여 보안을 강화

</br>

### CloudWatch 구축
![image](https://user-images.githubusercontent.com/110655823/215500665-e1515b53-73b2-4f65-8746-bb319c6513fd.png)
> - 웹 서비스의 Error 발생 시, 메일을 통한 실시간 알림

</br>

### Prometheus, Grafana 구현
![image](https://user-images.githubusercontent.com/110655823/215504714-26d6db4b-6b83-4b22-8651-943fce7dba1f.png)
> - 각 EC2의 Resource 사용량을 실시간으로 Monitoring과 시각화
