# DevOps Projesi TASK-1: Terraform ve Jenkins ile AWS'de Modüler Sanal Makine Oluşturma

## Amaç
Bu proje, AWS üzerinde Terraform kullanarak modüler sanal makineler oluşturmayı ve bu süreci Jenkins ile otomatize etmeyi içermektedir. Testing, development, staging ve production gibi farklı ortamlar için workspace'leri kullanarak otomatik yapılandırmalar yapacağız.

## Gereksinimler
- AWS hesabı
- Terraform
- Jenkins
- Git ve GitHub (veya benzeri bir versiyon kontrol sistemi)

## Adım Adım Görevler

### 1. Proje Yapısının Kurulması
- **1.1.** GitHub'da bir repo oluşturun. Bu repo, Terraform konfigürasyonlarınızı ve Jenkinsfile'ınızı içerecek.
- **1.2.** Repo'yu lokal bilgisayarınıza klonlayın.

### 2. Terraform Dosyalarının Oluşturulması
- **2.1.** Her ortam için (test, dev, staging, prod) bir Terraform workspace oluşturun. Bu sayede tek bir Terraform yapılandırması ile farklı ortamlar için ayrı yapılandırmalar yapabilirsiniz. 
- **2.2.** Her ortam için giriş değişkenleri tanımlayın (örn: instance tipi, boyutu, ortam adı).
- **2.3.** Oluşturulan kaynakların detaylarını vermek için çıkış değişkenleri kullanın (örn: EC2 instance'larının IP adresleri).

### 3. Jenkins Kurulumu ve Yapılandırılması
- **3.1.** Bir EC2 instance üzerinde Jenkins kurun.
- **3.2.** EC2 instance üzerinde Terraform kurun.
- **3.3.** Jenkins içinde yeni bir pipeline oluşturun ve GitHub repo'nuzla entegre edin.

### 4. Jenkins Pipeline'ının Oluşturulması
- **4.1.** `Jenkinsfile` oluşturarak pipeline'ınızı tanımlayın. Pipeline, Önce EC2 lar için projeye özel AWS CLI ile Key Pairs oluşturacak sonrasında Terraform plan ve apply komutlarını çalıştıracaktır.
- **4.2.** Pipeline içinde, Terraform'ın hangi ortam için çalıştırılacağını belirten parametreler ekleyin.
- **4.3.** Otomatik tetikleyiciler kurarak GitHub'daki değişiklikler sonrası Jenkins'in pipeline'ı çalıştırmasını sağlayın.

### 5. Test ve Doğrulama
- **5.1.** Terraform modüllerinizin çalıştığını doğrulamak için her ortam için `terraform apply` komutunu çalıştırın.
- **5.2.** EC2 instance'ların başarılı bir şekilde oluşturulup oluşturulmadığını kontrol edin.
- **5.3.** Jenkins pipeline'ının düzgün çalışıp çalışmadığını ve otomatik olarak tetiklenip tetiklenmediğini test edin.

### 6. Dokümantasyon ve Raporlama
- **6.1.** Projede kullanılan her bir adımı ve yapılandırmayı detaylı bir şekilde dokümante edin.
- **6.2.** Karşılaştığınız zorlukları ve çözümleri raporlayın.
- **6.3.** Sonuç olarak, oluşturulan kaynakların detaylarını içeren bir rapor hazırlayın.
